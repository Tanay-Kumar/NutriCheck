const admin = require("firebase-admin/app");
admin.initializeApp();

const askChatGpt = require("./ask_chat_gpt.js");
exports.askChatGpt = askChatGpt.askChatGpt;
