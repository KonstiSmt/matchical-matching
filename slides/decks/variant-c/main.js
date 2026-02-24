import 'reveal.js/dist/reveal.css';
import '/src/theme/variants/variant-c.css';

import { initializeRevealDeck } from '/src/shared/reveal-init.js';
import { loadFontAwesomeKit } from '/src/shared/fontawesome-kit.js';

loadFontAwesomeKit();

initializeRevealDeck({
  controlsTutorial: false,
  mouseWheel: false,
  pdfSeparateFragments: false
});
