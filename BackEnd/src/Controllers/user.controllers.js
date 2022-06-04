
// const bcrypt = require('bcrypt');
// require('dotenv').config()
// const jwt = require('jsonwebtoken');
const User = require('../Models/user');


// -------------------------------------- User Related Operation -------------------------
//For Authentication 
// const getMe = async (req, res) => {  
//     const userId = req.user.userId  
//     const user = await User.findById(userId)  
//     if(user){    
//            res.status(200).json({      
//                            message:"Found",      
//                            user,    
//                            })  
//             }  
//             else{    
//                  res.status(400).json({       
//                                 message:"Bad request"    
//                                })  
// }}

const updateUserDetails = async (req, res ) => {
    
    
    // To Do 
    // Get detials of the user parsing the body, userId
    res.status(200).json({
        "someRandome" : "data"
    })
}

const createUserDetails = async (req, res ) => {
    
    // To Do 
    // Update detials of the user parsing the body, userId
    res.status(200).json({
        "someRandome" : "data"
    })
}

// ---------------------------EVENTS RELATED OPERATIONS -----------------------------------
const getUserDetails = async (req, res ) => {
    
    // To Do 
    // create Event for the user parsing the body, userId
    res.status(200).json({
        "someRandome" : "data"
    })
}

const deleteUserDetails = async (req, res ) => {
    
    // To Do 
    // Get all the events of current User
    res.status(200).json({
        "someRandome" : "data"
    })
}


module.exports = {
    //getMe,
    updateUserDetails,
    createUserDetails,
    deleteUserDetails,
    getUserDetails
}