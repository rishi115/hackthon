const Query = require("../models/Query");

module.exports.addQuery = async (req, res) => {
  const { title, content } = req.body;
  try {
    const query = await Query.create({ title, content });
    return res.status(201).json({ success: true, message: "Query posted" });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

module.exports.getQueries = async (req, res) => {
  try {
    const queries = await Query.find();
    return res.status(200).json({ success: true, queries });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

module.exports.deleteQuery = async (req, res) => {
  const { id } = req.params;
  try {
    const query = await Query.findByIdAndDelete(id);
    if (!query) {
      return res
        .status(404)
        .json({ success: false, message: "Query not found" });
    }
    return res.status(200).json({ success: true, message: "Query deleted" });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

module.exports.replyQuery = async (req, res) => {
  const { id } = req.params;
  const { comment, username } = req.body;

  try {
    const query = await Query.findById(id);
    if (!query) {
      return res
        .status(404)
        .json({ success: false, message: "Query not found" });
    }
    const updatedQuery = await Query.findByIdAndUpdate(
      id,
      {
        $push: {
          comments: {
            comment,
            username,
          },
        },
      },
      { new: true }
    );
    return res
      .status(200)
      .json({ success: true, updatedQuery, message: "Reply added" });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};
