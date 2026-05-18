// EcoRush — main.js

// Hamburger menu toggle
function toggleMenu() {
  document.querySelector('.nav-links').classList.toggle('open');
}

// Close menu when a link is clicked
document.querySelectorAll('.nav-links a').forEach(link => {
  link.addEventListener('click', () => {
    document.querySelector('.nav-links').classList.remove('open');
  });
});

// Scroll-triggered fade-in for sections
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
      observer.unobserve(entry.target);
    }
  });
}, { threshold: 0.15 });

document.querySelectorAll('.section, .imp-card, .obj-item, .entity, .info-card, .scope-box').forEach(el => {
  el.classList.add('fade-in-el');
  observer.observe(el);
});

// Inject fade-in CSS dynamically
const style = document.createElement('style');
style.textContent = `
  .fade-in-el { opacity: 0; transform: translateY(28px); transition: opacity 0.65s ease, transform 0.65s ease; }
  .fade-in-el.visible { opacity: 1; transform: translateY(0); }
`;
document.head.appendChild(style);

// Active nav link highlight on scroll
const sections = document.querySelectorAll('section[id]');
const navLinks = document.querySelectorAll('.nav-links a');

window.addEventListener('scroll', () => {
  let current = '';
  sections.forEach(section => {
    const sectionTop = section.offsetTop - 100;
    if (window.scrollY >= sectionTop) current = section.getAttribute('id');
  });
  navLinks.forEach(link => {
    link.classList.remove('active-nav');
    if (link.getAttribute('href') === '#' + current) link.classList.add('active-nav');
  });
});

// Inject active-nav style
const navStyle = document.createElement('style');
navStyle.textContent = `.active-nav { color: var(--green-mid) !important; font-weight: 700 !important; }`;
document.head.appendChild(navStyle);

// CTA form mock submit
const ctaBtn = document.querySelector('.cta-section .btn-primary');
const ctaInput = document.querySelector('.cta-input');
if (ctaBtn && ctaInput) {
  ctaBtn.addEventListener('click', () => {
    if (ctaInput.value.trim()) {
      ctaBtn.textContent = '✅ You\'re on the list!';
      ctaBtn.style.background = '#1a4a1e';
      ctaInput.disabled = true;
      ctaBtn.disabled = true;
    } else {
      ctaInput.style.borderColor = '#e53935';
      setTimeout(() => ctaInput.style.borderColor = '', 1500);
    }
  });
}