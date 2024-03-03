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
    const { id, behaviour, wrongSolvedQuestions, correctSolvedQuestions}  = req.body
    try {
console.log('WrongSolvedQuestions ', wrongSolvedQuestions, 
"Correct solved questions", correctSolvedQuestions)
    let us = await user.findById(id)
    if(!us) {
        return res.status(404).json({success:false, message:"User not found"})
    }
    u = await userAnalytic.findById( id);
    if(u) {
        await userAnalytic.findByIdAndUpdate(id ,{
            $push : {
                wrongSolvedQuestions : 
                    wrongSolvedQuestions
                ,
                correctSolvedQuestions : 
                    correctSolvedQuestions
                
            }
        }, {
            new :true
        })

        return res.status(200).json({success:true,message :"Analytics added"})
    
    } else {
        const analytic = await userAnalytic.create({
            id : us._id,
            wrongSolvedQuestions : 
                    wrongSolvedQuestions
                ,
                correctSolvedQuestions : 
                    correctSolvedQuestions
        })
    }
        
    } catch (error) {
        return res.status(500).json({ success:false, message : error.message})
    }
}

module.exports = {
    registerUser,
    loginUser,
    uploadAnalityc

}