/* global PDFLib */

const {
  PDFDocument,
  StandardFonts,
  PDFName,
  PDFString,
  PDFHexString,
  PDFArray,
  PDFNumber,
  PDFTextField,
  PDFDropdown,
  PDFOptionList,
  PDFCheckBox,
  PDFRadioGroup,
  rgb,
} = PDFLib;

const dom = {
  templateInput: document.getElementById("templateInput"),
  fieldSearch: document.getElementById("fieldSearch"),
  flattenOutput: document.getElementById("flattenOutput"),
  reloadDefaultBtn: document.getElementById("reloadDefaultBtn"),
  downloadBtn: document.getElementById("downloadBtn"),
  fieldsForm: document.getElementById("fieldsForm"),
  fieldCount: document.getElementById("fieldCount"),
  mappingCount: document.getElementById("mappingCount"),
  mappingBody: document.getElementById("mappingBody"),
  status: document.getElementById("status"),
};

const state = {
  templateBytes: null,
  fieldDescriptors: [],
  inputsByName: new Map(),
};

function setStatus(message, tone = "info") {
  dom.status.textContent = message;
  dom.status.className = `status ${tone}`;
}

function friendlyFieldType(type) {
  switch (type) {
    case "text":
      return "Text";
    case "dropdown":
      return "Dropdown";
    case "option-list":
      return "Multi-select";
    case "checkbox":
      return "Checkbox";
    case "radio":
      return "Radio";
    default:
      return "Unsupported";
  }
}

function safeCall(fn, fallback) {
  try {
    return fn();
  } catch {
    return fallback;
  }
}

function isInstanceOf(value, typeCtor) {
  if (typeof typeCtor !== "function") return false;
  try {
    return value instanceof typeCtor;
  } catch {
    return false;
  }
}

function pdfName(key) {
  return safeCall(() => (PDFName ? PDFName.of(key) : key), key);
}

function lookupObject(context, objectOrRef) {
  if (!objectOrRef) return null;
  if (!context || typeof context.lookup !== "function") return objectOrRef;
  return safeCall(() => context.lookup(objectOrRef), objectOrRef);
}

function getDictValue(dict, key) {
  if (!dict || typeof dict.get !== "function") return null;
  const byPdfName = safeCall(() => dict.get(pdfName(key)), null);
  if (byPdfName !== null && byPdfName !== undefined) return byPdfName;
  return safeCall(() => dict.get(key), null);
}

function asPdfArray(value) {
  if (!value) return null;
  if (isInstanceOf(value, PDFArray)) return value;
  if (typeof value.size === "function" && typeof value.get === "function") {
    return value;
  }
  return null;
}

function readPdfNumber(value) {
  if (value === null || value === undefined) return null;
  if (isInstanceOf(value, PDFNumber) && typeof value.asNumber === "function") {
    return safeCall(() => value.asNumber(), null);
  }
  if (typeof value.asNumber === "function") {
    return safeCall(() => value.asNumber(), null);
  }
  const direct = Number(value);
  if (Number.isFinite(direct)) return direct;
  const parsed = Number(String(value).replace(/[^\d.+-]/g, ""));
  return Number.isFinite(parsed) ? parsed : null;
}

function normalizePdfText(text) {
  return String(text || "")
    .replace(/^\/+/, "")
    .trim();
}

function readPdfText(value) {
  if (value === null || value === undefined) return "";
  if (isInstanceOf(value, PDFString) || isInstanceOf(value, PDFHexString)) {
    return safeCall(() => value.decodeText(), "");
  }
  if (isInstanceOf(value, PDFName)) {
    return normalizePdfText(safeCall(() => value.asString(), ""));
  }
  if (typeof value.decodeText === "function") {
    return safeCall(() => value.decodeText(), "");
  }
  if (typeof value.asString === "function") {
    return normalizePdfText(safeCall(() => value.asString(), ""));
  }
  return normalizePdfText(value);
}

function readPdfNameValue(value) {
  const text = readPdfText(value);
  return text.startsWith("/") ? text.slice(1) : text;
}

function readRect(value) {
  const array = asPdfArray(value);
  if (!array || array.size() < 4) return null;
  const x1 = readPdfNumber(array.get(0));
  const y1 = readPdfNumber(array.get(1));
  const x2 = readPdfNumber(array.get(2));
  const y2 = readPdfNumber(array.get(3));
  if ([x1, y1, x2, y2].some((num) => num === null)) return null;
  return [x1, y1, x2, y2];
}

function parseChoiceOptions(optionObject, lookup) {
  const options = [];
  const arr = asPdfArray(optionObject);
  if (!arr) return options;

  const pushOption = (optionValue) => {
    const normalized = String(optionValue ?? "");
    if (!options.includes(normalized)) {
      options.push(normalized);
    }
  };

  for (let index = 0; index < arr.size(); index += 1) {
    const entry = lookup(arr.get(index));
    const entryArray = asPdfArray(entry);
    if (entryArray && entryArray.size() > 0) {
      const preferred = entryArray.size() > 1 ? entryArray.get(1) : entryArray.get(0);
      pushOption(readPdfText(lookup(preferred)));
    } else {
      pushOption(readPdfText(entry));
    }
  }
  return options;
}

function classifyWidgetType(fieldType, flags) {
  if (fieldType === "Tx") {
    return { type: "text", multiline: (flags & 4096) !== 0 };
  }
  if (fieldType === "Ch") {
    const isMultiSelect = (flags & 2097152) !== 0;
    return {
      type: isMultiSelect ? "option-list" : "dropdown",
      multiline: false,
    };
  }
  if (fieldType === "Btn") {
    const isRadio = (flags & 32768) !== 0;
    return { type: isRadio ? "radio" : "checkbox", multiline: false };
  }
  return { type: "unsupported", multiline: false };
}

function parseWidgetValue(rawValue, descriptorType, lookup) {
  if (descriptorType === "option-list") {
    const valueArray = asPdfArray(rawValue);
    if (valueArray) {
      const values = [];
      for (let index = 0; index < valueArray.size(); index += 1) {
        values.push(readPdfText(lookup(valueArray.get(index))));
      }
      return { values };
    }
    const single = readPdfText(rawValue);
    return { values: single ? [single] : [] };
  }

  if (descriptorType === "checkbox") {
    const text = readPdfText(rawValue);
    return { value: Boolean(text) && text.toLowerCase() !== "off" };
  }

  return { value: readPdfText(rawValue) };
}

function describeAcroField(field) {
  const name = field.getName();
  const isTextByClass =
    isInstanceOf(field, PDFTextField) &&
    typeof field.getText === "function" &&
    typeof field.setText === "function";
  const isDropdownByClass =
    isInstanceOf(field, PDFDropdown) &&
    typeof field.getOptions === "function" &&
    typeof field.select === "function";
  const isOptionListByClass =
    isInstanceOf(field, PDFOptionList) &&
    typeof field.getOptions === "function" &&
    typeof field.select === "function";
  const isCheckboxByClass =
    isInstanceOf(field, PDFCheckBox) &&
    typeof field.check === "function" &&
    typeof field.uncheck === "function";
  const isRadioByClass =
    isInstanceOf(field, PDFRadioGroup) &&
    typeof field.getOptions === "function" &&
    typeof field.select === "function";
  const hasTextApi =
    typeof field.getText === "function" && typeof field.setText === "function";
  const hasChoiceApi =
    typeof field.getOptions === "function" &&
    typeof field.getSelected === "function" &&
    typeof field.select === "function";
  const hasCheckboxApi =
    typeof field.check === "function" &&
    typeof field.uncheck === "function" &&
    typeof field.isChecked === "function";

  if (isTextByClass || hasTextApi) {
    return {
      name,
      type: "text",
      value: safeCall(() => field.getText() || "", ""),
      multiline: safeCall(() => field.isMultiline(), false),
      options: [],
      values: [],
      source: "acroform",
    };
  }

  if (isDropdownByClass || isOptionListByClass || hasChoiceApi) {
    const selected = safeCall(() => field.getSelected(), []);
    const options = safeCall(() => field.getOptions(), []);
    const isMulti =
      isOptionListByClass ||
      safeCall(
        () =>
          typeof field.isMultiselect === "function" ? field.isMultiselect() : false,
        false,
      );
    if (isMulti) {
      return {
        name,
        type: "option-list",
        values: Array.isArray(selected)
          ? selected
          : selected
            ? [selected]
            : [],
        options,
        multiline: false,
        source: "acroform",
      };
    }
    return {
      name,
      type: "dropdown",
      value: Array.isArray(selected) ? selected[0] || "" : selected || "",
      options,
      multiline: false,
      source: "acroform",
    };
  }

  if (isCheckboxByClass || hasCheckboxApi) {
    return {
      name,
      type: "checkbox",
      value: safeCall(() => field.isChecked(), false),
      multiline: false,
      options: [],
      values: [],
      source: "acroform",
    };
  }

  if (isRadioByClass) {
    return {
      name,
      type: "radio",
      value: safeCall(() => field.getSelected() || "", ""),
      options: safeCall(() => field.getOptions(), []),
      multiline: false,
      values: [],
      source: "acroform",
    };
  }

  return {
    name,
    type: "unsupported",
    value: "",
    options: [],
    values: [],
    multiline: false,
    source: "acroform",
  };
}

function buildWidgetDescriptors(pdfDoc) {
  const pages = pdfDoc.getPages();
  const descriptors = [];
  let order = 1;

  for (let pageIndex = 0; pageIndex < pages.length; pageIndex += 1) {
    const page = pages[pageIndex];
    const annotationArray = asPdfArray(safeCall(() => page.node.Annots(), null));
    if (!annotationArray) continue;

    const lookup = (value) => lookupObject(pdfDoc.context, value);

    for (let annotationIndex = 0; annotationIndex < annotationArray.size(); annotationIndex += 1) {
      const annotationRef = annotationArray.get(annotationIndex);
      const annotation = lookup(annotationRef);
      if (!annotation || typeof annotation.get !== "function") continue;

      const subtype = readPdfNameValue(getDictValue(annotation, "Subtype"));
      if (subtype !== "Widget") continue;

      const parent = lookup(getDictValue(annotation, "Parent"));
      const name =
        readPdfText(getDictValue(annotation, "T")) ||
        readPdfText(getDictValue(parent, "T"));
      if (!name) continue;

      const fieldType =
        readPdfNameValue(getDictValue(annotation, "FT")) ||
        readPdfNameValue(getDictValue(parent, "FT"));
      const flags =
        readPdfNumber(getDictValue(annotation, "Ff")) ??
        readPdfNumber(getDictValue(parent, "Ff")) ??
        0;
      const rect = readRect(getDictValue(annotation, "Rect"));
      const options = parseChoiceOptions(
        getDictValue(annotation, "Opt") || getDictValue(parent, "Opt"),
        lookup,
      );
      const rawValue =
        getDictValue(annotation, "V") || getDictValue(parent, "V");
      const base = classifyWidgetType(fieldType, flags);
      const parsedValue = parseWidgetValue(rawValue, base.type, lookup);

      descriptors.push({
        name,
        type: base.type,
        multiline: base.multiline,
        options,
        value: parsedValue.value ?? "",
        values: parsedValue.values ?? [],
        source: "widget",
        order,
        annotationRef,
        occurrences: [{ pageIndex, rect }],
      });
      order += 1;
    }
  }
  return descriptors;
}

function getAcroFormDict(pdfDoc) {
  const catalogDict = pdfDoc?.catalog?.dict;
  if (!catalogDict || typeof catalogDict.get !== "function") return null;
  return lookupObject(pdfDoc.context, getDictValue(catalogDict, "AcroForm"));
}

function getOrCreateAcroFormFieldsArray(pdfDoc) {
  const acroForm = getAcroFormDict(pdfDoc);
  if (!acroForm || typeof acroForm.get !== "function") {
    return { acroForm: null, fieldsArray: null };
  }

  let fieldsArray = asPdfArray(lookupObject(pdfDoc.context, getDictValue(acroForm, "Fields")));
  if (!fieldsArray) {
    fieldsArray = pdfDoc.context.obj([]);
    acroForm.set(pdfName("Fields"), fieldsArray);
  }
  return { acroForm, fieldsArray };
}

function getFieldNameFromDict(pdfDoc, dict) {
  if (!dict || typeof dict.get !== "function") return "";
  const ownName = readPdfText(getDictValue(dict, "T"));
  if (ownName) return ownName;

  const parent = lookupObject(pdfDoc.context, getDictValue(dict, "Parent"));
  return readPdfText(getDictValue(parent, "T"));
}

function registerWidgetOnlyFieldsInAcroForm(pdfDoc, widgetDescriptors) {
  const { acroForm, fieldsArray } = getOrCreateAcroFormFieldsArray(pdfDoc);
  if (!acroForm || !fieldsArray) {
    return { added: 0, existingRootNames: 0 };
  }

  const lookup = (value) => lookupObject(pdfDoc.context, value);
  const rootFieldNames = new Set();
  for (let index = 0; index < fieldsArray.size(); index += 1) {
    const rootField = lookup(fieldsArray.get(index));
    const rootName = getFieldNameFromDict(pdfDoc, rootField);
    if (rootName) rootFieldNames.add(rootName);
  }

  let added = 0;
  const pushedRefTexts = new Set();
  for (const descriptor of widgetDescriptors) {
    if (!descriptor?.annotationRef) continue;
    if (!descriptor.name || rootFieldNames.has(descriptor.name)) continue;

    const refText = safeCall(() => descriptor.annotationRef.toString(), "");
    if (pushedRefTexts.has(refText)) continue;

    safeCall(() => fieldsArray.push(descriptor.annotationRef), null);
    rootFieldNames.add(descriptor.name);
    pushedRefTexts.add(refText);
    added += 1;
  }

  safeCall(() => acroForm.set(pdfName("NeedAppearances"), pdfDoc.context.obj(true)), null);
  return { added, existingRootNames: rootFieldNames.size };
}

function mergeDescriptors(widgetDescriptors, acroDescriptors) {
  const merged = new Map();
  const acroByName = new Map(acroDescriptors.map((descriptor) => [descriptor.name, descriptor]));

  let nextOrder = 1;
  for (const widget of widgetDescriptors) {
    const existing = merged.get(widget.name);
    if (existing) {
      existing.occurrences.push(...widget.occurrences);
      continue;
    }

    const acro = acroByName.get(widget.name);
    const mergedDescriptor = {
      name: widget.name,
      type: widget.type,
      multiline: widget.multiline,
      options: [...(widget.options || [])],
      value: widget.value || "",
      values: [...(widget.values || [])],
      source: acro ? "acroform+widget" : "widget",
      order: widget.order || nextOrder,
      occurrences: [...widget.occurrences],
    };

    if (acro) {
      if (mergedDescriptor.type === "unsupported" && acro.type !== "unsupported") {
        mergedDescriptor.type = acro.type;
      }
      if (!mergedDescriptor.multiline && acro.multiline) {
        mergedDescriptor.multiline = true;
      }
      if (
        (!mergedDescriptor.options || mergedDescriptor.options.length === 0) &&
        acro.options &&
        acro.options.length > 0
      ) {
        mergedDescriptor.options = [...acro.options];
      }
      if (!mergedDescriptor.value && acro.value) {
        mergedDescriptor.value = acro.value;
      }
      if (
        (!mergedDescriptor.values || mergedDescriptor.values.length === 0) &&
        acro.values &&
        acro.values.length > 0
      ) {
        mergedDescriptor.values = [...acro.values];
      }
    }

    merged.set(widget.name, mergedDescriptor);
    nextOrder = Math.max(nextOrder, mergedDescriptor.order + 1);
  }

  for (const acro of acroDescriptors) {
    if (merged.has(acro.name)) continue;
    merged.set(acro.name, {
      ...acro,
      order: nextOrder,
      occurrences: [],
      source: "acroform",
    });
    nextOrder += 1;
  }

  const ordered = [...merged.values()].sort(
    (a, b) => a.order - b.order || a.name.localeCompare(b.name),
  );
  for (const descriptor of ordered) {
    const pages = descriptor.occurrences
      .map((occurrence) => occurrence.pageIndex + 1)
      .filter((pageNumber) => Number.isInteger(pageNumber) && pageNumber > 0);
    descriptor.pages = [...new Set(pages)];
  }
  return ordered;
}

function createInputForField(descriptor) {
  let input;

  if (descriptor.type === "text") {
    if (descriptor.multiline) {
      input = document.createElement("textarea");
      input.rows = 4;
    } else {
      input = document.createElement("input");
      input.type = "text";
    }
    input.value = descriptor.value || "";
    return input;
  }

  if (descriptor.type === "dropdown" || descriptor.type === "radio") {
    input = document.createElement("select");
    const optionValues = descriptor.options || [];
    const hasEmpty = optionValues.includes("");
    if (!hasEmpty) {
      const empty = document.createElement("option");
      empty.value = "";
      empty.textContent = "(empty)";
      input.appendChild(empty);
    }
    for (const optionValue of optionValues) {
      const option = document.createElement("option");
      option.value = optionValue;
      option.textContent = optionValue || "(empty)";
      input.appendChild(option);
    }
    input.value = descriptor.value || "";
    return input;
  }

  if (descriptor.type === "option-list") {
    input = document.createElement("select");
    input.multiple = true;
    input.size = Math.min(8, Math.max(3, descriptor.options?.length || 3));
    for (const optionValue of descriptor.options || []) {
      const option = document.createElement("option");
      option.value = optionValue;
      option.textContent = optionValue || "(empty)";
      option.selected = (descriptor.values || []).includes(optionValue);
      input.appendChild(option);
    }
    return input;
  }

  if (descriptor.type === "checkbox") {
    input = document.createElement("input");
    input.type = "checkbox";
    input.checked = Boolean(descriptor.value);
    return input;
  }

  input = document.createElement("input");
  input.type = "text";
  input.value = descriptor.value || "";
  return input;
}

function renderFields(descriptors) {
  dom.fieldsForm.innerHTML = "";
  state.inputsByName = new Map();

  for (const descriptor of descriptors) {
    const row = document.createElement("div");
    row.className = "field-row";
    row.dataset.fieldName = descriptor.name.toLowerCase();

    const label = document.createElement("label");
    label.append(document.createTextNode(`${descriptor.name} `));

    const typeTag = document.createElement("span");
    typeTag.className = "field-type";
    typeTag.textContent = `(${friendlyFieldType(descriptor.type)})`;
    label.append(typeTag);

    const input = createInputForField(descriptor);
    input.dataset.fieldName = descriptor.name;

    row.appendChild(label);
    row.appendChild(input);
    dom.fieldsForm.appendChild(row);
    state.inputsByName.set(descriptor.name, input);
  }

  dom.fieldCount.textContent = String(descriptors.length);
}

function renderMappingLog(descriptors) {
  dom.mappingBody.innerHTML = "";
  dom.mappingCount.textContent = String(descriptors.length);

  for (const descriptor of descriptors) {
    const row = document.createElement("tr");

    const orderCell = document.createElement("td");
    orderCell.textContent = String(descriptor.order);

    const keyCell = document.createElement("td");
    keyCell.textContent = descriptor.name;

    const typeCell = document.createElement("td");
    typeCell.textContent = friendlyFieldType(descriptor.type);

    const sourceCell = document.createElement("td");
    sourceCell.textContent = descriptor.source;

    const pageCell = document.createElement("td");
    pageCell.textContent =
      descriptor.pages && descriptor.pages.length > 0
        ? descriptor.pages.join(", ")
        : "-";

    row.append(orderCell, keyCell, typeCell, sourceCell, pageCell);
    dom.mappingBody.appendChild(row);
  }
}

function filterFields() {
  const query = dom.fieldSearch.value.trim().toLowerCase();
  const rows = dom.fieldsForm.querySelectorAll(".field-row");
  for (const row of rows) {
    const match = !query || row.dataset.fieldName.includes(query);
    row.style.display = match ? "" : "none";
  }
}

async function parseTemplate(bytes) {
  const pdfDoc = await PDFDocument.load(bytes, { ignoreEncryption: true });
  const form = pdfDoc.getForm();

  const acroDescriptors = safeCall(() => form.getFields().map(describeAcroField), []);
  const widgetDescriptors = buildWidgetDescriptors(pdfDoc);
  const mergedDescriptors = mergeDescriptors(widgetDescriptors, acroDescriptors);

  state.templateBytes = bytes;
  state.fieldDescriptors = mergedDescriptors;

  renderFields(mergedDescriptors);
  renderMappingLog(mergedDescriptors);
  dom.downloadBtn.disabled = false;

  setStatus(
    `Template loaded: ${mergedDescriptors.length} unique keys detected (${widgetDescriptors.length} widgets, ${acroDescriptors.length} AcroForm roots).`,
    "success",
  );
}

async function loadBundledTemplate() {
  setStatus("Loading bundled template...", "info");
  const response = await fetch("./template.pdf");
  if (!response.ok) {
    throw new Error(`Failed to fetch template.pdf (${response.status})`);
  }
  const bytes = await response.arrayBuffer();
  await parseTemplate(bytes);
}

async function onTemplateFileSelected(event) {
  const file = event.target.files && event.target.files[0];
  if (!file) return;
  setStatus(`Loading ${file.name}...`, "info");
  const bytes = await file.arrayBuffer();
  await parseTemplate(bytes);
}

function getInputValue(descriptor, inputElement) {
  if (!inputElement) return "";

  if (descriptor.type === "checkbox") {
    return Boolean(inputElement.checked);
  }
  if (descriptor.type === "option-list") {
    return Array.from(inputElement.selectedOptions).map((option) => option.value);
  }
  return inputElement.value || "";
}

function getFieldByName(form, name) {
  return safeCall(() => form.getField(name), null);
}

function writeToAcroField(field, descriptor, value) {
  if (!field) return false;

  if (descriptor.type === "checkbox") {
    if (typeof field.check !== "function" || typeof field.uncheck !== "function") {
      return false;
    }
    if (value) field.check();
    else field.uncheck();
    return true;
  }

  if (descriptor.type === "option-list") {
    if (typeof field.select !== "function") return false;
    if (Array.isArray(value) && value.length > 0) {
      field.select(value);
    } else if (typeof field.clear === "function") {
      field.clear();
    } else if (descriptor.options.includes("")) {
      field.select("");
    }
    return true;
  }

  if (descriptor.type === "dropdown" || descriptor.type === "radio") {
    if (typeof field.select !== "function") return false;
    if (value) {
      field.select(value);
    } else if (typeof field.clear === "function") {
      field.clear();
    }
    return true;
  }

  if (typeof field.setText === "function") {
    field.setText(String(value || ""));
    return true;
  }

  return false;
}

function valueForOverlay(descriptor, value) {
  if (descriptor.type === "checkbox") {
    return value ? "Ja" : "";
  }
  if (descriptor.type === "option-list") {
    return Array.isArray(value) ? value.join(", ") : "";
  }
  return String(value || "");
}

function truncateToWidth(text, font, fontSize, maxWidth) {
  if (!text) return "";
  if (font.widthOfTextAtSize(text, fontSize) <= maxWidth) return text;
  const ellipsis = "...";
  let end = text.length;
  while (end > 0) {
    const candidate = `${text.slice(0, end)}${ellipsis}`;
    if (font.widthOfTextAtSize(candidate, fontSize) <= maxWidth) return candidate;
    end -= 1;
  }
  return "";
}

function wrapTextToWidth(text, font, fontSize, maxWidth) {
  const lines = [];
  const paragraphs = String(text || "").split(/\r?\n/);
  for (const paragraph of paragraphs) {
    const trimmed = paragraph.trim();
    if (!trimmed) {
      lines.push("");
      continue;
    }
    const words = trimmed.split(/\s+/);
    let current = "";
    for (const word of words) {
      const candidate = current ? `${current} ${word}` : word;
      if (font.widthOfTextAtSize(candidate, fontSize) <= maxWidth) {
        current = candidate;
      } else {
        if (current) {
          lines.push(current);
          current = word;
        } else {
          lines.push(truncateToWidth(word, font, fontSize, maxWidth));
          current = "";
        }
      }
    }
    if (current) lines.push(current);
  }
  return lines;
}

function drawOverlayValue(page, font, rect, text, isMultiline) {
  if (!page || !font || !rect || !text) return;
  const [x1, y1, x2, y2] = rect;
  const width = x2 - x1;
  const height = y2 - y1;
  if (width <= 2 || height <= 2) return;

  const padX = 2;
  const padY = 2;
  const maxWidth = Math.max(1, width - padX * 2);

  if (!isMultiline) {
    let fontSize = Math.min(11, Math.max(8, height * 0.55));
    let line = String(text).replace(/\s+/g, " ").trim();
    while (fontSize > 6 && font.widthOfTextAtSize(line, fontSize) > maxWidth) {
      fontSize -= 0.5;
    }
    line = truncateToWidth(line, font, fontSize, maxWidth);
    if (!line) return;
    const y = y1 + Math.max(padY, (height - fontSize) / 2);
    page.drawText(line, {
      x: x1 + padX,
      y,
      size: fontSize,
      font,
      color: rgb(0, 0, 0),
    });
    return;
  }

  const fontSize = 10;
  const lineHeight = fontSize * 1.2;
  const maxLines = Math.max(1, Math.floor((height - padY * 2) / lineHeight));
  const wrappedLines = wrapTextToWidth(text, font, fontSize, maxWidth).slice(0, maxLines);
  let y = y2 - padY - fontSize;
  for (const line of wrappedLines) {
    if (line) {
      page.drawText(line, {
        x: x1 + padX,
        y,
        size: fontSize,
        font,
        color: rgb(0, 0, 0),
      });
    }
    y -= lineHeight;
    if (y < y1) break;
  }
}

function drawOverlayForDescriptor(pdfDoc, descriptor, text, font) {
  if (!descriptor.occurrences || descriptor.occurrences.length === 0) return 0;
  if (!text) return 0;

  const pages = pdfDoc.getPages();
  let draws = 0;
  for (const occurrence of descriptor.occurrences) {
    const page = pages[occurrence.pageIndex];
    if (!page || !occurrence.rect) continue;
    drawOverlayValue(
      page,
      font,
      occurrence.rect,
      text,
      descriptor.multiline || descriptor.type === "option-list",
    );
    draws += 1;
  }
  return draws;
}

async function downloadPopulatedPdf() {
  if (!state.templateBytes) {
    setStatus("No template loaded yet.", "error");
    return;
  }

  setStatus("Populating PDF and generating download...", "info");

  const pdfDoc = await PDFDocument.load(state.templateBytes, {
    ignoreEncryption: true,
  });
  const widgetDescriptors = buildWidgetDescriptors(pdfDoc);
  const registration = registerWidgetOnlyFieldsInAcroForm(pdfDoc, widgetDescriptors);

  const form = pdfDoc.getForm();
  const helvetica = await pdfDoc.embedFont(StandardFonts.Helvetica);

  let acroWriteCount = 0;
  let overlayWriteCount = 0;

  for (const descriptor of state.fieldDescriptors) {
    const input = state.inputsByName.get(descriptor.name);
    if (!input) continue;

    const value = getInputValue(descriptor, input);
    const field = getFieldByName(form, descriptor.name);
    const wroteAcro = writeToAcroField(field, descriptor, value);
    if (wroteAcro) {
      acroWriteCount += 1;
      continue;
    }

    const overlayText = valueForOverlay(descriptor, value);
    overlayWriteCount += drawOverlayForDescriptor(
      pdfDoc,
      descriptor,
      overlayText,
      helvetica,
    );
  }

  safeCall(() => form.updateFieldAppearances(helvetica), null);

  let flattenWarning = "";
  if (dom.flattenOutput.checked) {
    try {
      form.flatten();
    } catch (error) {
      flattenWarning = `Flatten skipped (${error.message})`;
      console.warn("Flatten failed; continuing without flattening.", error);
    }
  }

  const outputBytes = await pdfDoc.save();
  const blob = new Blob([outputBytes], { type: "application/pdf" });
  const url = URL.createObjectURL(blob);

  const now = new Date();
  const stamp = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}-${String(
    now.getDate(),
  ).padStart(2, "0")}_${String(now.getHours()).padStart(2, "0")}${String(
    now.getMinutes(),
  ).padStart(2, "0")}`;
  const filename = `db-populated-${stamp}.pdf`;

  const link = document.createElement("a");
  link.href = url;
  link.download = filename;
  document.body.appendChild(link);
  link.click();
  link.remove();
  URL.revokeObjectURL(url);

  const summary = `Download ready: ${filename} (Acro writes: ${acroWriteCount}, overlay writes: ${overlayWriteCount}).`;
  const registrationInfo = `Registered widget-only fields: ${registration.added}.`;
  if (flattenWarning) {
    setStatus(`${summary} ${registrationInfo} ${flattenWarning}`, "error");
  } else {
    setStatus(`${summary} ${registrationInfo}`, "success");
  }
}

async function init() {
  dom.templateInput.addEventListener("change", (event) => {
    onTemplateFileSelected(event).catch((error) => {
      console.error(error);
      setStatus(`Could not load selected file: ${error.message}`, "error");
    });
  });

  dom.fieldSearch.addEventListener("input", filterFields);
  dom.downloadBtn.addEventListener("click", () => {
    downloadPopulatedPdf().catch((error) => {
      console.error(error);
      setStatus(`PDF generation failed: ${error.message}`, "error");
    });
  });

  dom.reloadDefaultBtn.addEventListener("click", () => {
    loadBundledTemplate().catch((error) => {
      console.error(error);
      setStatus(
        `Bundled template could not be loaded. Choose a PDF manually. (${error.message})`,
        "error",
      );
    });
  });

  await loadBundledTemplate().catch((error) => {
    console.error(error);
    setStatus(
      `Bundled template unavailable. Choose a PDF manually. (${error.message})`,
      "error",
    );
  });
}

init().catch((error) => {
  console.error(error);
  setStatus(`Unexpected initialization error: ${error.message}`, "error");
});
