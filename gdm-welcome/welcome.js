// HydraLogOS GDM Welcome Screen
const greetings = [
    { text: "Hello", lang: "English" },
    { text: "নমস্কার", lang: "বাংলা" },
    { text: "नमस्ते", lang: "हिंदी" },
    { text: "こんにちは", lang: "日本語" },
    { text: "안녕하세요", lang: "한국어" },
    { text: "مرحبا", lang: "العربية" },
    { text: "Bonjour", lang: "Français" },
    { text: "Hola", lang: "Español" },
    { text: "Ciao", lang: "Italiano" },
    { text: "Olá", lang: "Português" },
    { text: "Hallo", lang: "Deutsch" }
];

function updateWelcomeText() {
    const welcomeText = document.querySelector('.welcome-text');
    const currentIndex = parseInt(welcomeText.dataset.currentIndex || 0);
    const nextIndex = (currentIndex + 1) % greetings.length;
    
    // Add exit animation
    welcomeText.classList.add('exit');
    
    setTimeout(() => {
        // Update text and language
        welcomeText.textContent = greetings[nextIndex].text;
        welcomeText.dataset.currentIndex = nextIndex;
        welcomeText.dataset.language = greetings[nextIndex].lang;
        
        // Remove exit animation and add enter animation
        welcomeText.classList.remove('exit');
        welcomeText.classList.add('enter');
        
        // Schedule next update
        setTimeout(() => {
            welcomeText.classList.remove('enter');
            setTimeout(updateWelcomeText, 2000); // Show each greeting for 2 seconds
        }, 1000);
    }, 1000);
}

// Start the animation when the page loads
document.addEventListener('DOMContentLoaded', () => {
    const welcomeText = document.querySelector('.welcome-text');
    welcomeText.textContent = greetings[0].text;
    welcomeText.dataset.currentIndex = 0;
    welcomeText.dataset.language = greetings[0].lang;
    setTimeout(updateWelcomeText, 2000);
}); 