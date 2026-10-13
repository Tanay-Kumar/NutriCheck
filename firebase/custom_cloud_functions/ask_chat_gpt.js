const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.askChatGpt = onRequest(async (request, response) => {
  logger.info("Body logs!", request.body, { structuredData: true });
  const { messages, apiKey } = request.body;
  logger.info("Body logs messages!", messages);
  // const apiKey ="AIzaSyCxEEXs9d1MmCdp0IpFoMkNc55rkxDvbBA";

  // Define the API endpoint and payload
  const apiUrl = "https://api.openai.com/v1/chat/completions";
  const data = {
    model: "gpt-3.5-turbo",
    messages: [
      {
        role: "user",
        content: messages,
      },
    ],
    max_tokens: 150,
  };

  // Send a request to the OpenAI API
  const responseData = await axios.post(apiUrl, data, {
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${apiKey}`,
    },
  });

  response.send(responseData.data);
});
