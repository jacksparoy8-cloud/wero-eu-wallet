// Configuration Telegram - Injectée par l'entrypoint ou par défaut
window.telegramConfig = window.telegramConfig || {
    BOT_TOKEN: localStorage.getItem('TELEGRAM_BOT_TOKEN') || '',
    CHAT_ID: localStorage.getItem('TELEGRAM_CHAT_ID') || '6078788670'
};
