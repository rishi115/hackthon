const mongoose = require("mongoose");


const userAnalitycs = mongoose.Schema({
    id : {
        type : Number,
    },
    behaviour : {
        type : String,
    },
    wrongSolvedQuestions : {

            type : Array,
            default : []
    },
    correctSolvedQuestions : {
            type : Array,
            default : []
    }

})


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
    }

})


const user = mongoose.model('user', users);
const userAnalytic = mongoose.model('userAnalityc', userAnalitycs)

module.exports = {
    user,
    userAnalytic
}