(() => {
  const viewport = document.querySelector('.journey-viewport');
  const steps = Array.from(document.querySelectorAll('.journey-step'));
  const fill = document.querySelector('.journey-line span');
  const counter = document.querySelector('.journey-counter strong');
  const previous = document.querySelector('.journey-control.previous');
  const next = document.querySelector('.journey-control.next');

  if (!viewport || !steps.length || !fill || !counter || !previous || !next) return;

  const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  let current = 0;
  let frame = null;
  let scrollSettleTimer = null;
  let programmaticScroll = false;

  const update = (index) => {
    current = Math.max(0, Math.min(index, steps.length - 1));
    steps.forEach((step, stepIndex) => step.classList.toggle('is-active', stepIndex === current));
    fill.style.width = `${(current / (steps.length - 1)) * 100}%`;
    counter.textContent = String(current + 1);
    previous.disabled = current === 0;
    next.disabled = current === steps.length - 1;
  };

  const goTo = (index) => {
    const targetIndex = Math.max(0, Math.min(index, steps.length - 1));
    const target = steps[targetIndex];
    const left = target.offsetLeft - (viewport.clientWidth - target.clientWidth) / 2;
    programmaticScroll = true;
    viewport.scrollTo({ left, behavior: reducedMotion ? 'auto' : 'smooth' });
    update(targetIndex);

    window.clearTimeout(scrollSettleTimer);
    scrollSettleTimer = window.setTimeout(() => {
      programmaticScroll = false;
      detectCurrent();
    }, reducedMotion ? 0 : 140);
  };

  const detectCurrent = () => {
    const maximumScroll = Math.max(0, viewport.scrollWidth - viewport.clientWidth);
    if (viewport.scrollLeft <= 1) {
      update(0);
      frame = null;
      return;
    }
    if (viewport.scrollLeft >= maximumScroll - 1) {
      update(steps.length - 1);
      frame = null;
      return;
    }

    const center = viewport.scrollLeft + viewport.clientWidth / 2;
    let closest = 0;
    let distance = Infinity;
    steps.forEach((step, index) => {
      const stepCenter = step.offsetLeft + step.clientWidth / 2;
      const nextDistance = Math.abs(stepCenter - center);
      if (nextDistance < distance) {
        distance = nextDistance;
        closest = index;
      }
    });
    update(closest);
    frame = null;
  };

  previous.addEventListener('click', () => goTo(current - 1));
  next.addEventListener('click', () => goTo(current + 1));
  viewport.addEventListener('scroll', () => {
    if (programmaticScroll) {
      window.clearTimeout(scrollSettleTimer);
      scrollSettleTimer = window.setTimeout(() => {
        programmaticScroll = false;
        detectCurrent();
      }, reducedMotion ? 0 : 140);
      return;
    }
    if (frame === null) frame = window.requestAnimationFrame(detectCurrent);
  }, { passive: true });
  window.addEventListener('resize', () => goTo(current));

  update(0);
})();
