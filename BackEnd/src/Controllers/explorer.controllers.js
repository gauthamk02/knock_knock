
// const bcrypt = require('bcrypt');
// require('dotenv').config()
// const jwt = require('jsonwebtoken');
const Explorer = require('../Models/explorer');


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

const getProfileDetails = async (req, res ) => {
    
    // To Do 
    // Get detials of the user parsing the body, userId
    res.status(200).json({
        "someRandome" : "data"
    })
}

const updateProfileDetails = async (req, res ) => {
    
    // To Do 
    // Update detials of the user parsing the body, userId
    res.status(200).json({
        "someRandome" : "data"
    })
}

// ---------------------------EVENTS RELATED OPERATIONS -----------------------------------
const getRelatedPeople = async (req, res ) => {
    
    // To do 
    // Give data back based on interest

    res.status(200).json({
        "someRandome" : "data"
    })
}

const getRelatedEvents = async (req, res ) => {
    
    // To Do 
    // Get all the events of related to current user
    res.status(200).json({
        "someRandome" : "data"
    })
}




module.exports = {
    getProfileDetails,
    updateProfileDetails,

    getRelatedPeople,
    getRelatedEvents
}