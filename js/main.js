/* ============================================================
   JEREMY KIRKPATRICK — ELECTRONIC PORTFOLIO
   main.js  — Animations, interactions, utilities
   ============================================================ */

'use strict';

/* ── Mobile Navigation ──────────────────────────────────── */
(function initNav() {
  const toggle = document.getElementById('navToggle');
  const links  = document.getElementById('navLinks');
  if (!toggle || !links) return;

  toggle.addEventListener('click', function () {
    const isOpen = links.classList.toggle('open');
    toggle.setAttribute('aria-expanded', String(isOpen));
    toggle.textContent = isOpen ? '✕' : '☰';
  });

  // Close menu when a nav link is clicked
  links.querySelectorAll('.nav-link').forEach(function (link) {
    link.addEventListener('click', function () {
      links.classList.remove('open');
      toggle.setAttribute('aria-expanded', 'false');
      toggle.textContent = '☰';
    });
  });

  // Close on Escape
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape' && links.classList.contains('open')) {
      links.classList.remove('open');
      toggle.setAttribute('aria-expanded', 'false');
      toggle.textContent = '☰';
    }
  });
}());

/* ── Typing Animation (hero subtitle) ──────────────────── */
(function initTyping() {
  const el = document.getElementById('typingText');
  if (!el) return;

  const phrases = [
    'CIS Computer Programming Student',
    'Web Developer',
    'C# Programmer',
    'Database Developer',
    'Full-Stack Developer',
    'Graduating Summer 2026!',
  ];

  let phraseIdx  = 0;
  let charIdx    = 0;
  let isDeleting = false;
  let pause      = false;

  const TYPE_SPEED   = 65;   // ms per character when typing
  const DELETE_SPEED = 35;   // ms per character when deleting
  const HOLD_MS      = 2000; // ms to hold full phrase
  const PAUSE_MS     = 400;  // ms before typing next phrase

  function tick() {
    if (pause) return;

    const current = phrases[phraseIdx];

    if (isDeleting) {
      charIdx--;
      el.textContent = current.slice(0, charIdx);
      if (charIdx === 0) {
        isDeleting = false;
        phraseIdx  = (phraseIdx + 1) % phrases.length;
        pause = true;
        setTimeout(function () { pause = false; tick(); }, PAUSE_MS);
        return;
      }
      setTimeout(tick, DELETE_SPEED);
    } else {
      charIdx++;
      el.textContent = current.slice(0, charIdx);
      if (charIdx === current.length) {
        isDeleting = true;
        setTimeout(tick, HOLD_MS);
        return;
      }
      setTimeout(tick, TYPE_SPEED);
    }
  }

  setTimeout(tick, 600);
}());

/* ── Skill Bar Scroll Animation ─────────────────────────── */
(function initSkillBars() {
  const bars = document.querySelectorAll('.skill-fill[data-width]');
  if (!bars.length) return;

  var observer = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        var bar = entry.target;
        bar.style.width = bar.dataset.width;
        observer.unobserve(bar);
      }
    });
  }, { threshold: 0.3 });

  bars.forEach(function (bar) { observer.observe(bar); });
}());

/* ── Fade-in on Scroll ──────────────────────────────────── */
(function initScrollReveal() {
  var items = document.querySelectorAll(
    '.project-card, .card, .skill-item, .course-group, .about-content'
  );
  if (!items.length) return;

  // Initial state — will be overridden by observer
  items.forEach(function (el) {
    el.style.opacity  = '0';
    el.style.transform = 'translateY(18px)';
    el.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
  });

  var obs = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry, i) {
      if (entry.isIntersecting) {
        // Stagger siblings slightly
        setTimeout(function () {
          entry.target.style.opacity   = '1';
          entry.target.style.transform = 'translateY(0)';
        }, i * 60);
        obs.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1 });

  items.forEach(function (el) { obs.observe(el); });
}());

/* ── Browser Tab Title Blink ────────────────────────────── */
(function initTitleBlink() {
  var base = document.title;
  var blink = '★ ' + base;
  var show  = true;

  setInterval(function () {
    document.title = show ? blink : base;
    show = !show;
  }, 2000);
}());

/* ── Konami Code Easter Egg ─────────────────────────────── */
(function initKonami() {
  var sequence = [
    'ArrowUp','ArrowUp','ArrowDown','ArrowDown',
    'ArrowLeft','ArrowRight','ArrowLeft','ArrowRight',
    'b','a'
  ];
  var idx = 0;

  document.addEventListener('keydown', function (e) {
    if (e.key === sequence[idx]) {
      idx++;
      if (idx === sequence.length) {
        idx = 0;
        showEasterEgg();
      }
    } else {
      idx = 0;
    }
  });

  function showEasterEgg() {
    var overlay = document.createElement('div');
    overlay.setAttribute('role', 'dialog');
    overlay.setAttribute('aria-modal', 'true');
    overlay.setAttribute('aria-label', 'Easter egg unlocked');
    overlay.style.cssText = [
      'position:fixed','inset:0','background:rgba(10,0,16,0.97)',
      'display:flex','flex-direction:column','align-items:center',
      'justify-content:center','z-index:99999','cursor:pointer',
      'font-family:\'Press Start 2P\',monospace','text-align:center','padding:32px'
    ].join(';');

    overlay.innerHTML = [
      '<p style="font-size:48px;margin-bottom:24px;">🎮</p>',
      '<p style="color:#fffb96;font-size:14px;text-shadow:0 0 18px #fffb96;',
        'margin-bottom:20px;letter-spacing:2px;">KONAMI CODE UNLOCKED!</p>',
      '<p style="color:#ff71ce;font-size:10px;margin-bottom:32px;line-height:2;',
        'text-shadow:0 0 12px #ff71ce;">+30 LIVES AWARDED<br>GG WP JEREMY</p>',
      '<p style="color:rgba(255,255,255,0.4);font-size:9px;">[ CLICK OR PRESS ESC TO CLOSE ]</p>'
    ].join('');

    document.body.appendChild(overlay);

    function close() {
      overlay.remove();
      document.removeEventListener('keydown', escClose);
    }
    function escClose(e) { if (e.key === 'Escape') close(); }

    overlay.addEventListener('click', close);
    document.addEventListener('keydown', escClose);
  }
}());
