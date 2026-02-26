import { access, mkdir } from 'node:fs/promises';
import { constants } from 'node:fs';
import path from 'node:path';
import process from 'node:process';
import { spawn } from 'node:child_process';
import { chromium } from 'playwright';

function getArg(name, fallback) {
  const index = process.argv.indexOf(`--${name}`);
  if (index === -1) {
    return fallback;
  }

  return process.argv[index + 1] ?? fallback;
}

async function waitForServer(url, timeoutMs = 30000) {
  const start = Date.now();

  while (Date.now() - start < timeoutMs) {
    try {
      const response = await fetch(url);
      if (response.ok) {
        return;
      }
    } catch {
      // keep polling
    }

    await new Promise((resolve) => setTimeout(resolve, 250));
  }

  throw new Error(`Timed out waiting for preview server at ${url}`);
}

function runCommand(command, args, options = {}) {
  return new Promise((resolve, reject) => {
    const child = spawn(command, args, { stdio: 'inherit', ...options });

    child.on('exit', (code) => {
      if (code === 0) {
        resolve();
        return;
      }

      reject(new Error(`${command} ${args.join(' ')} failed with exit code ${code}`));
    });

    child.on('error', reject);
  });
}

async function ensureBuildExists() {
  try {
    await access(path.resolve('dist'), constants.R_OK);
  } catch {
    await runCommand('pnpm', ['run', 'build']);
  }
}

async function main() {
  const deck = getArg('deck', 'demo');
  const out = getArg('out', `output/${deck}.pdf`);
  const port = getArg('port', '4173');

  await ensureBuildExists();

  const outPath = path.resolve(out);
  await mkdir(path.dirname(outPath), { recursive: true });

  const preview = spawn('pnpm', ['exec', 'vite', 'preview', '--host', '127.0.0.1', '--port', port, '--strictPort'], {
    stdio: 'inherit'
  });

  const previewUrl = `http://127.0.0.1:${port}`;

  try {
    await waitForServer(previewUrl);

    const browser = await chromium.launch({ headless: true });
    const page = await browser.newPage({ viewport: { width: 1600, height: 900 } });

    await page.goto(`${previewUrl}/decks/${deck}/?view=print`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelectorAll('.pdf-page').length > 0, { timeout: 15000 });

    await page.pdf({
      path: outPath,
      printBackground: true,
      preferCSSPageSize: true,
      margin: { top: '0', right: '0', bottom: '0', left: '0' }
    });

    await browser.close();
    console.log(`PDF exported: ${outPath}`);
  } finally {
    preview.kill('SIGTERM');
  }
}

main().catch((error) => {
  console.error(error.message);
  process.exitCode = 1;
});
