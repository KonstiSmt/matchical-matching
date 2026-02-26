import { resolve } from 'node:path';
import { defineConfig } from 'vite';

export default defineConfig({
  envDir: resolve(__dirname, '..'),
  server: {
    host: '0.0.0.0',
    port: 5173
  },
  preview: {
    host: '127.0.0.1',
    port: 4173
  },
  build: {
    rollupOptions: {
      input: {
        home: resolve(__dirname, 'index.html'),
        demo: resolve(__dirname, 'decks/demo/index.html'),
        variantA: resolve(__dirname, 'decks/variant-a/index.html'),
        variantB: resolve(__dirname, 'decks/variant-b/index.html'),
        variantC: resolve(__dirname, 'decks/variant-c/index.html')
      }
    }
  }
});
