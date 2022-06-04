
// const bcrypt = require('bcrypt');
// require('dotenv').config()
// const jwt = require('jsonwebtoken');
const Expert = require('../Models/expert');
const Explorer = require("../Models/explorer");
const User = require("../Models/user");


const getProfileDetails = async (req, res ) => {
    await Expert.findOne({
        aboutYourself : res.body.aboutYourself,
        profilePic : res.body.profilePic,
        interest : res.body.interest,
        language : res.body.language,
        areaExpertise : res.body.areaExpertise,
    }, { where : { uuid : res?.body?.userId }})
        .then( ()=> {
            res.status(200).json( { message : "Success", success: true })
        })
        .catch( (error)=>  {
            console.log(error)
            res.status(404).json( { message :  error, success : false})
        })
}

const updateProfileDetails = async (req, res ) => {
    await Expert.update({
        aboutYourself : res.body.aboutYourself,
        profilePic : res.body.profilePic,
        interest : res.body.interest,
        language : res.body.language,
        areaExpertise : res.body.areaExpertise,
    }, { where : { uuid : res.body.userId }})
        .then( ()=> {
            res.status(200).json( { message : "Success", success: true })
        })
        .catch( (error)=>  {
            console.log(error)
            res.status(404).json( { message :  error, success : false})
        } )
}

// ---------------------------EVENTS RELATED OPERATIONS -----------------------------------
const createEvent = async (req, res ) => {

    await Event.create({
        details : res?.body?.id,
        date : res?.body?.date,
        authorId : null,//TODO get the id of currently logged in user
    })
    .then( () => res.status(200).json( {message : "Successfuly Created", success : true }))
    .catch( () => res.status(400).json( { message : "Unkknown Error", success: false }))
}

const getMyEvents = async (req, res ) => {
    
    // To Do 
    // Get all the events of current User
    res.status(200).json({
        "someRandome" : "data"
    })
}


const updateEvents = async (req, res ) => {
    Event.update( {
        details: res?.body?.details,
        date: res?.body?.details
    },  { where : { uuid  : req.body.eventId , authorId:null }}) //TODO get user id
        .then( ()=> {
            res.status(200).json( { message : "Success", success: true })
        })
        .catch( (error)=>  {
            console.log(error)
            res.status(404).json( { message :  error, success : false})

        } )
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