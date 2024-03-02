const mongoose = require("mongoose");

const userAnalitycs = mongoose.Schema({
  _id: {
    type: String,
  },
  behaviour: {
    type: String,
  },
  wrongSolvedQuestions: [
    {
      id: {
        type: Number,
      },
    },
  ],
  correctSolvedQuestions: [
    {
      id: {
        type: Number,
      },
    },
  ],
});

const users = mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  lname: {
    type: String,
    required: false,
  },
  email: {
    type: String,
    required: true,
  },
  pwd: {
    type: String,
    required: true,
  },
});

const user = mongoose.model("user", users);
const userAnalytic = mongoose.model("userAnalityc", userAnalitycs);

module.exports = {
  user,
  userAnalytic,
};
