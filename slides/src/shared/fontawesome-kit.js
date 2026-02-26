function resolveKitUrl(value) {
  if (!value) {
    return '';
  }

  const trimmed = value.trim();
  if (!trimmed) {
    return '';
  }

  if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
    return trimmed;
  }

  return `https://kit.fontawesome.com/${trimmed}.js`;
}

export function loadFontAwesomeKit() {
  const kitUrl = resolveKitUrl(import.meta.env.VITE_FONT_AWESOME_KIT_URL);
  if (!kitUrl) {
    return;
  }

  if (document.querySelector('script[data-matchical-fa-kit="true"]')) {
    return;
  }

  const script = document.createElement('script');
  script.src = kitUrl;
  script.crossOrigin = 'anonymous';
  script.defer = true;
  script.setAttribute('data-matchical-fa-kit', 'true');
  document.head.appendChild(script);
}
