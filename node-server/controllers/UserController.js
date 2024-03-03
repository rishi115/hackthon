const {user, userAnalytic} = require("../models/User")
const mongoose = require("mongoose")

async function registerUser(req, res) {
    console.log(req.body);
    const {fname, lname, email, pwd} = req.body;
    user.create({
        name : fname,
        lname : lname,
        email : email,
        pwd : pwd,  
    })
    return res.send("working");
}
async function loginUser(req, res) {
    const {email, pwd} = req.body;
    user.findOne({email, pwd})
}
async function uploadAnalityc(req, res) {
    const { _id, behaviour, wrongSolvedQuestions, correctSolvedQuestions}  = req.body
    userAnalytic.create({
        _id,
        behaviour,
        wrongSolvedQuestions,
        correctSolvedQuestions,
    })
}

module.exports = {
    registerUser,
    loginUser,
    uploadAnalityc

}