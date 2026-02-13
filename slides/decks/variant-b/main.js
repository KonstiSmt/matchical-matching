import 'reveal.js/dist/reveal.css';
import '@fortawesome/fontawesome-free/css/all.min.css';
import '/src/theme/variants/variant-b.css';

import { initializeRevealDeck } from '/src/shared/reveal-init.js';
import { loadFontAwesomeKit } from '/src/shared/fontawesome-kit.js';

loadFontAwesomeKit();

initializeRevealDeck({
  controlsTutorial: false,
  mouseWheel: false,
  pdfSeparateFragments: false
});
