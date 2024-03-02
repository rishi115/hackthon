const express = require("express");
const app = express();
const port = 5000;
const cors = require("cors");
const { connectDb } = require("./connection");
require("dotenv").config();

connectDb();
app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.send("The server is running ");
});

app.use("/api", require("./routes"));

app.listen(port, () => console.log(`The server is running on port ${port}`));
