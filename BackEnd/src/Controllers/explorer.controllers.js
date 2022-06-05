
// const bcrypt = require('bcrypt');
// require('dotenv').config()
// const jwt = require('jsonwebtoken');
const Explorer = require('../Models/explorer');
const User = require("../Models/user");



const getProfileDetails = async (req, res ) => {
    await User.findOne({ where : { uuid : res.body.userId }})
    .then( (response)=> {
        res.status(200).json( response.dataValues )
    })
    .catch( (error)=>  {
        console.log(error)
        res.status(404).json( { message :  error, success : false})

    } )
}

const updateProfileDetails = async (req, res ) => {
    await Explorer.update({
        aboutYourself : res.body.aboutYourself,
        profilePic : res.body.profilePic,
        interest : res.body.interest,
        language : res.body.language
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
const getRelatedPeople = async (req, res ) => {
    await Explorer.findAll({
        aboutYourself : res.body.aboutYourself,
        profilePic : res.body.profilePic,
        interest : res.body.interest,
        language : res.body.language
    }, { where : { interest : res.body.interest }})
    .then( ()=> {
        res.status(200).json( { message : "Success", success: true })
    })
    .catch( (error)=>  {
        console.log(error)
        res.status(404).json( { message :  error, success : false})
    })
}

const getRelatedEvents = async (req, res ) => {
    await User.findAll({where : { authorId : res.body.userId}})
        .then( (response)=> {
            res.status(200).json( response.dataValues )
        })
        .catch( (error)=>  {
            console.log(error)
            res.status(404).json( { message :  error, success : false})

        } )
}



module.exports = {
    getProfileDetails,
    updateProfileDetails,

    getRelatedPeople,
    getRelatedEvents
}