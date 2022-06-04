
// const bcrypt = require('bcrypt');
// require('dotenv').config()
// const jwt = require('jsonwebtoken');
const Expert = require('../Models/expert');


const getProfileDetails = async (req, res ) => {
    
    
    // To Do 
    // Get detials of the user parsing the body, userId
    res.status(200).json({
        "someRandome" : "data"
    })
}

const updateProfileDetails = async (req, res ) => {
    
    // const [row, created] =  await Expert.findOrCreate({
    //     where : {  }
    // })
    // To Do 
    // Update detials of the user parsing the body, userId
    res.status(200).json({
        "someRandome" : "data"
    })
}

// ---------------------------EVENTS RELATED OPERATIONS -----------------------------------
const createEvent = async (req, res ) => {
    

    // To Do 
    // create Event for the user parsing the body, userId
    res.status(200).json({
        "someRandome" : "data"
    })
}

const getMyEvents = async (req, res ) => {
    
    // To Do 
    // Get all the events of current User
    res.status(200).json({
        "someRandome" : "data"
    })
}


const updateEvents = async (req, res ) => {
    
    // To Do 
    // update the event of the user.
    res.status(200).json({
        "someRandome" : "data"
    })
}


module.exports = {
    //getMe,
    getProfileDetails,
    updateProfileDetails,
    updateEvents,
    getMyEvents,
    createEvent,
    updateEvents
}