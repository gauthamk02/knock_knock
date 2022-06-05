
// const bcrypt = require('bcrypt');
// require('dotenv').config()
// const jwt = require('jsonwebtoken');
const Expert = require('../Models/expert');
const Post = require("../Models/events")

const getProfileDetails = async (req, res ) => {
    // To do  
}

const updateProfileDetails = async (req, res ) => {
    await Expert.update({
        aboutYourself : req.body.aboutYourself,
        profilePic : req.body.profilePic,
        interest : req.body.interest,
        language : req.body.language,
        areaExpertise : req.body.areaExpertise,
    }, { where : { uuid : req.body.userId }})
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

    await Post.create({
        details : req.body.id,
        date : req.body.date,
        authorId : null,//TODO get the id of currently logged in user
        isEvent : true
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
    Post.update( {
        details: req.body.details,
        date: req.body.details
    },  { where : { uuid  : req.body.eventId , authorId : null, isEvent : true }}) //TODO get user id
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