const { OpenAI } = require("openai");
const openai = new OpenAI({ apiKey: process.env.API_KEY });

module.exports.chat = async (req, res) => {
  const { message } = req.body;
  try {
    const completion = await openai.chat.completions.create({
      model: "gpt-3.5-turbo",
      messages: [
        {
          role: "system",
          content:
            "Pretend you're a Ai Chatbot, be energetic and full of charisma. Your job is to satisfy the user with the best answers possible",
        },
        {
          role: "user",
          content: message,
        },
      ],
      max_tokens: 200,
    });

    if (!completion.choices[0].message.content) {
      return res
        .status(500)
        .json({ success: false, message: "Chatbot not available" });
    }

    return res.status(200).json({
      success: true,
      message: completion.choices[0].message.content,
    });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};
