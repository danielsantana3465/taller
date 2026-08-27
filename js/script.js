/* ============================================================
   TAPICERÍA TORRES — script.js
   Vanilla JS: solo diseño / interacción visual. Sin backend.
   ============================================================ */

document.addEventListener('DOMContentLoaded', () => {

  const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  /* ----------------------------------------------------------
     1. MENÚ MÓVIL
     ---------------------------------------------------------- */
  const navToggle = document.getElementById('navToggle');
  const navMenu = document.getElementById('navMenu');

  function closeMenu() {
    navMenu.classList.remove('is-open');
    navToggle.setAttribute('aria-expanded', 'false');
    navToggle.setAttribute('aria-label', 'Abrir menú');
  }

  function toggleMenu() {
    const isOpen = navMenu.classList.toggle('is-open');
    navToggle.setAttribute('aria-expanded', String(isOpen));
    navToggle.setAttribute('aria-label', isOpen ? 'Cerrar menú' : 'Abrir menú');
  }

  if (navToggle && navMenu) {
    navToggle.addEventListener('click', toggleMenu);

    navMenu.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', closeMenu);
    });

    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') closeMenu();
    });
  }

  /* ----------------------------------------------------------
     2. NAV CON SOMBRA AL HACER SCROLL
     ---------------------------------------------------------- */
  const nav = document.getElementById('nav');
  let lastScrollY = window.scrollY;

  function onScrollNav() {
    if (window.scrollY > 12) {
      nav.classList.add('is-scrolled');
    } else {
      nav.classList.remove('is-scrolled');
    }
    lastScrollY = window.scrollY;
  }

  window.addEventListener('scroll', onScrollNav, { passive: true });
  onScrollNav();

  /* ----------------------------------------------------------
     3. SCROLL REVEAL (fade + slide-up) con IntersectionObserver
     ---------------------------------------------------------- */
  const revealEls = document.querySelectorAll('.reveal');

  if (prefersReducedMotion) {
    revealEls.forEach(el => el.classList.add('is-visible'));
  } else if ('IntersectionObserver' in window) {
    const revealObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach((entry, i) => {
        if (entry.isIntersecting) {
          // pequeño stagger entre elementos que aparecen juntos
          setTimeout(() => entry.target.classList.add('is-visible'), i * 60);
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.15, rootMargin: '0px 0px -40px 0px' });

    revealEls.forEach(el => revealObserver.observe(el));
  } else {
    revealEls.forEach(el => el.classList.add('is-visible'));
  }

  /* ----------------------------------------------------------
     4. ANIMACIÓN DE "COSTURA" (stitch) al entrar en viewport
     ---------------------------------------------------------- */
  const stitches = document.querySelectorAll('.stitch');

  if ('IntersectionObserver' in window && !prefersReducedMotion) {
    const stitchObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-stitched');
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.4 });

    stitches.forEach(s => stitchObserver.observe(s));
  } else {
    stitches.forEach(s => s.classList.add('is-stitched'));
  }

  /* ----------------------------------------------------------
     5. CONTADORES ANIMADOS (estadísticas del taller)
     ---------------------------------------------------------- */
  const counters = document.querySelectorAll('.stats-card__number');

  function animateCounter(el) {
    const target = parseInt(el.dataset.count, 10) || 0;
    const suffix = el.dataset.suffix || '';
    const duration = 1400;
    const start = performance.now();

    if (prefersReducedMotion) {
      el.textContent = target + suffix;
      return;
    }

    function tick(now) {
      const progress = Math.min((now - start) / duration, 1);
      // easeOutCubic
      const eased = 1 - Math.pow(1 - progress, 3);
      const value = Math.round(eased * target);
      el.textContent = value + suffix;
      if (progress < 1) requestAnimationFrame(tick);
    }
    requestAnimationFrame(tick);
  }

  if ('IntersectionObserver' in window) {
    const counterObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          animateCounter(entry.target);
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.6 });

    counters.forEach(c => counterObserver.observe(c));
  } else {
    counters.forEach(animateCounter);
  }

  /* ----------------------------------------------------------
     6. SCROLL SUAVE A ANCLAS INTERNAS
     ---------------------------------------------------------- */
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      const targetId = this.getAttribute('href');
      if (targetId.length <= 1) return; // "#" solo
      const targetEl = document.querySelector(targetId);
      if (!targetEl) return;

      e.preventDefault();
      targetEl.scrollIntoView({
        behavior: prefersReducedMotion ? 'auto' : 'smooth',
        block: 'start'
      });
    });
  });

  /* ----------------------------------------------------------
     7. BOTONES DE LOGIN / REGISTRO (solo maqueta visual)
     ---------------------------------------------------------- */
  document.querySelectorAll('[data-auth]').forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      const action = btn.dataset.auth === 'login' ? 'Iniciar sesión' : 'Registrarse';
      btn.animate(
        [{ transform: 'scale(1)' }, { transform: 'scale(.96)' }, { transform: 'scale(1)' }],
        { duration: 220, easing: 'ease-out' }
      );
      console.info(`[UI demo] Botón "${action}" — conectar a backend/auth real aquí.`);
    });
  });

});
