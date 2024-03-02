const mongoose = require("mongoose");

const querySchema = new mongoose.Schema(
  {
    title: {
      type: String,
      required: true,
    },
    content: {
      type: String,
      required: true,
    },
    comments: {
      type: Array,
      default: [],
    },
  },
  { timestamps: true }
);

const Query = mongoose.model("Query", querySchema);
module.exports = Query;
