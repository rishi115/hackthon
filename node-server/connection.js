const mongoose = require("mongoose");
const connectDb = async () => {
  const connection = await mongoose.connect(process.env.MONGO_URI);
  if (connection.STATES.connected) {
    console.log("The database is connected");
  } else {
    console.log("The database is not connected");
  }
};
module.exports = { connectDb };
