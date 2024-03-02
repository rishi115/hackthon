const { user } = require("../models/User");
const mongoose = require("mongoose");

async function registerUser(req, res) {
  console.log(req.body);
  const { fname, lname, email, pwd } = req.body;
  try {
    const u = await user.create({ fname, lname, email, pwd });
    await u.save();
    return res.status(201).json({ success: true, message: "User created" });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
}
async function loginUser(req, res) {
  const { email, pwd } = req.body;
  try {
    const u = await user.findOne({ email });

    if (!u) {
      return res
        .status(404)
        .json({ success: false, message: "User not found" });
    }
    if (u.pwd !== pwd) {
      return res
        .status(401)
        .json({ success: false, message: "Incorrect password" });
    }
    return res.status(200).json({
      success: true,
      message: "Login Sucessfull",
      user: {
        name: u.name,
        email: u.email,
      },
    });
  } catch (error) {
    return res.status(500).json({ success: true, message: error.message });
  }
}

module.exports = {
  registerUser,
  loginUser,
};
