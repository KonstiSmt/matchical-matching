document.addEventListener('DOMContentLoaded', () => {
    // Preloader
    const loader = document.getElementById('loader');
    setTimeout(() => {
        loader.classList.add('hidden');
    }, 800);

    // Navbar Scroll Effect
    const navbar = document.getElementById('navbar');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });

    // Intersection Observer for Scroll Animations
    const scrollElements = document.querySelectorAll('[data-scroll]');

    const elementInView = (el, dividend = 1) => {
        const elementTop = el.getBoundingClientRect().top;
        return (elementTop <= (window.innerHeight || document.documentElement.clientHeight) / dividend);
    };

    const displayScrollElement = (element) => {
        element.classList.add('is-visible');
    };

    const handleScrollAnimation = () => {
        scrollElements.forEach((el) => {
            if (elementInView(el, 1.15)) {
                displayScrollElement(el);
            }
        });
    };

    window.addEventListener('scroll', () => {
        handleScrollAnimation();
    });

    // Trigger once on load
    setTimeout(() => {
        handleScrollAnimation();
    }, 1000);

    // Interactive steps for Workflow section
    const stepItems = document.querySelectorAll('.step-item');
    let currentStep = 0;

    setInterval(() => {
        if (!stepItems.length) return;

        // Remove active class from all
        stepItems.forEach(item => item.classList.remove('active'));

        // Add active class to current
        stepItems[currentStep].classList.add('active');

        // Move to next step or loop
        currentStep = (currentStep + 1) % stepItems.length;
    }, 3000);
});
