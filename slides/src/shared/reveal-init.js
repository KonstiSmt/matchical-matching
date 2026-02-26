import Reveal from 'reveal.js';
import RevealNotes from 'reveal.js/plugin/notes/notes.esm.js';

export async function initializeRevealDeck(options = {}) {
  const deck = new Reveal({
    controls: true,
    progress: true,
    slideNumber: false,
    hash: true,
    center: false,
    width: 1600,
    height: 900,
    margin: 0.04,
    navigationMode: 'linear',
    transition: 'slide',
    backgroundTransition: 'fade',
    showSlideNumber: 'speaker',
    plugins: [RevealNotes],
    ...options
  });

  await deck.initialize();
  return deck;
}
