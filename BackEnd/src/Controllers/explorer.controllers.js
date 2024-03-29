
// const bcrypt = require('bcrypt');
// require('dotenv').config()
// const jwt = require('jsonwebtoken');
const Explorer = require('../Models/explorer');
const User = require("../Models/user");



const getProfileDetails = async (req, res ) => {
    await User.findOne({ where : { uuid : req.body.userId }})
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
        aboutYourself : req.body.aboutYourself,
        profilePic : req.body.profilePic,
        interest : req.body.interest,
        language : req.body.language
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
const getRelatedPeople = async (req, res ) => {
    await Explorer.findAll({
        where :  {
            interest : req.body.interest
        }
      })
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