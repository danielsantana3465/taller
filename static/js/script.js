/* ============================================================
   SANTANA'S UPHOLSTERY — script.js
   Vanilla JS: solo diseño / interacción visual. Sin backend.
   Cada bloque corre en su propio try/catch para que un error en
   una función (menú, contadores, etc.) NUNCA impida que el resto
   del archivo -incluyendo los modales- se registre correctamente.
   ============================================================ */

document.addEventListener('DOMContentLoaded', () => {

  const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  /* ----------------------------------------------------------
     1. MODALES DE LOGIN / REGISTRO
     (va primero para garantizar que siempre quede activo)
     ---------------------------------------------------------- */
  try {
    const modals = document.querySelectorAll('[data-modal]');
    let lastFocusedEl = null;

    function getModal(id) {
      return document.getElementById(id);
    }

    function openModal(id) {
      const modal = getModal(id);
      if (!modal) {
        console.warn('[Santana\'s] No existe un modal con id:', id);
        return;
      }
      lastFocusedEl = document.activeElement;

      modals.forEach(m => { m.classList.remove('is-open'); m.setAttribute('aria-hidden', 'true'); });
      modal.classList.add('is-open');
      modal.setAttribute('aria-hidden', 'false');
      document.body.style.overflow = 'hidden';

      const firstField = modal.querySelector('input, button');
      if (firstField) firstField.focus();
    }

    function closeAllModals() {
      modals.forEach(m => { m.classList.remove('is-open'); m.setAttribute('aria-hidden', 'true'); });
      document.body.style.overflow = '';
      if (lastFocusedEl) lastFocusedEl.focus();
    }

    document.querySelectorAll('[data-modal-open]').forEach(btn => {
      btn.addEventListener('click', () => openModal(btn.dataset.modalOpen));
    });

    document.querySelectorAll('[data-modal-switch]').forEach(btn => {
      btn.addEventListener('click', () => openModal(btn.dataset.modalSwitch));
    });

    document.querySelectorAll('[data-modal-close]').forEach(btn => {
      btn.addEventListener('click', closeAllModals);
    });

    modals.forEach(overlay => {
      overlay.addEventListener('click', (e) => {
        if (e.target === overlay) closeAllModals();
      });
    });

    document.addEventListener('keydown', (e) => {
      const openModalEl = document.querySelector('.modal-overlay.is-open');
      if (!openModalEl) return;

      if (e.key === 'Escape') {
        closeAllModals();
        return;
      }

      if (e.key === 'Tab') {
        const focusables = openModalEl.querySelectorAll('button, input, a[href]');
        if (!focusables.length) return;
        const first = focusables[0];
        const last = focusables[focusables.length - 1];

        if (e.shiftKey && document.activeElement === first) {
          e.preventDefault(); last.focus();
        } else if (!e.shiftKey && document.activeElement === last) {
          e.preventDefault(); first.focus();
        }
      }
    });

    document.querySelectorAll('[data-demo-form]').forEach(form => {
      form.addEventListener('submit', (e) => {
        e.preventDefault();
        const submitBtn = form.querySelector('.form__submit');
        if (submitBtn) {
          const originalText = submitBtn.textContent;
          submitBtn.textContent = 'Enviando…';
          submitBtn.disabled = true;
          setTimeout(() => {
            submitBtn.textContent = '¡Listo! (demo sin backend)';
            setTimeout(() => {
              submitBtn.textContent = originalText;
              submitBtn.disabled = false;
              closeAllModals();
              form.reset();
            }, 1100);
          }, 700);
        }
        console.info('[UI demo] Formulario enviado — conectar a backend/auth real aquí.');
      });
    });
  } catch (err) {
    console.error('[Santana\'s] Error inicializando modales:', err);
  }

  /* ----------------------------------------------------------
     2. MENÚ MÓVIL
     ---------------------------------------------------------- */
  try {
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
      navMenu.querySelectorAll('a').forEach(link => link.addEventListener('click', closeMenu));
      document.addEventListener('keydown', (e) => { if (e.key === 'Escape') closeMenu(); });
    }
  } catch (err) {
    console.error('[Santana\'s] Error inicializando menú móvil:', err);
  }

  /* ----------------------------------------------------------
     3. NAV CON SOMBRA AL HACER SCROLL
     ---------------------------------------------------------- */
  try {
    const nav = document.getElementById('nav');
    function onScrollNav() {
      if (!nav) return;
      if (window.scrollY > 12) nav.classList.add('is-scrolled');
      else nav.classList.remove('is-scrolled');
    }
    window.addEventListener('scroll', onScrollNav, { passive: true });
    onScrollNav();
  } catch (err) {
    console.error('[Santana\'s] Error inicializando sombra de nav:', err);
  }

  /* ----------------------------------------------------------
     4. SCROLL REVEAL (fade + slide-up) con IntersectionObserver
     ---------------------------------------------------------- */
  try {
    const revealEls = document.querySelectorAll('.reveal');

    if (prefersReducedMotion) {
      revealEls.forEach(el => el.classList.add('is-visible'));
    } else if ('IntersectionObserver' in window) {
      const revealObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach((entry, i) => {
          if (entry.isIntersecting) {
            setTimeout(() => entry.target.classList.add('is-visible'), i * 60);
            observer.unobserve(entry.target);
          }
        });
      }, { threshold: 0.15, rootMargin: '0px 0px -40px 0px' });

      revealEls.forEach(el => revealObserver.observe(el));
    } else {
      revealEls.forEach(el => el.classList.add('is-visible'));
    }
  } catch (err) {
    console.error('[Santana\'s] Error inicializando scroll-reveal:', err);
  }

  /* ----------------------------------------------------------
     5. ANIMACIÓN DE "COSTURA" (stitch) al entrar en viewport
     ---------------------------------------------------------- */
  try {
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
  } catch (err) {
    console.error('[Santana\'s] Error inicializando animación de costura:', err);
  }

  /* ----------------------------------------------------------
     6. CONTADORES ANIMADOS (estadísticas del taller)
     ---------------------------------------------------------- */
  try {
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
  } catch (err) {
    console.error('[Santana\'s] Error inicializando contadores:', err);
  }

  /* ----------------------------------------------------------
     7. SCROLL SUAVE A ANCLAS INTERNAS
     ---------------------------------------------------------- */
  try {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
      anchor.addEventListener('click', function (e) {
        const targetId = this.getAttribute('href');
        if (targetId.length <= 1) return;
        const targetEl = document.querySelector(targetId);
        if (!targetEl) return;

        e.preventDefault();
        targetEl.scrollIntoView({
          behavior: prefersReducedMotion ? 'auto' : 'smooth',
          block: 'start'
        });
      });
    });
  } catch (err) {
    console.error('[Santana\'s] Error inicializando scroll suave:', err);
  }

});
