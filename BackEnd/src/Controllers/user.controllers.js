
const bcrypt = require('bcrypt');
const user = require('../Models/user');
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

    const hashPassword = bcrypt.hash(req.body.password, 10)

    await User.update( { 
        name : res.body.name,
        phoneNumber : res.body.phoneNumber,
        age : res.body.age,
        currentLocation : res.body.currentLocation,
        password : hashPassword,
     },  { where : { phoneNumber  : req.body.phoneNumber } })
    .then( ()=> {
        res.status(200).json( { message : "Success", success: true })
    })
   .catch( (error)=>  {
       console.log(error)
        res.status(404).json( { message :  error, success : false})
    
   } )

}

const createUserDetails = async (req, res ) => {

    // Checking wether the number exists or not 
    await User.findOne( { where : { phoneNumber  : req.body.phoneNumber } })
    .then( (respone) => {
        if(respone == null) {
          //  const hashPassword = bcrypt.hashSync(req.body.password);
            User.create({
                name : req.body.name,
                age : req.body.age,
                phoneNumber : req.body.phoneNumber,
                currentLocation : req.body.currentLocation,
                type : req.body.type,
                password : req.body.password
            })
            .then( () => res.status(200).json( {message : "Successfuly Created", success : true }))
            .catch( (error) => res.status(400).json( { message : error, success: false }))
        }
        else{
            res.status(400).json( {message : "Already has same number", success : false } )
        }

    })
    .catch((error)=> res.status(400).json( {message : error, success : false}))
   
}

// ---------------------------EVENTS RELATED OPERATIONS -----------------------------------
const getUserDetails = async (req, res ) => {
    
    await User.findOne( { where : { phoneNumber  : req.body.phoneNumber } })
    .then( (response)=> {
        res.status(200).json( response.dataValues )
    })
   .catch( (error)=>  {
       console.log(error)
        res.status(404).json( { message :  error, success : false})
    
   } )
}

const deleteUserDetails = async (req, res ) => {
    
    // Delete Based On Number
    await User.destroy( { where : { phoneNumber  : req.body.phoneNumber } })
    .then( ()=> {
        res.status(200).json( { message : "Success", success: true })
    })
   .catch( (error)=>  {
       console.log(error)
        res.status(404).json( { message :  error, success : false})
    
   } )
}

const authenticateUser = async (req, res) => {
    await User.findOne( { where : { phoneNumber  : req.body.phoneNumber } })
    .then( (response)=> { 
        var userData = JSON.parse( JSON.stringify (response.dataValues) )
        if((req.body.password == userData.password)) {
            delete userData.password
            res.status(200).json( userData )
        }
        else{
            res.status(400).json( {message : "Wrong Password" , success : false }  )
        }

    })
   .catch( (error)=>  {
        res.status(404).json( { message :  "Number Not Found", success : false})
    
   } )
}


module.exports = {
    //getMe,
    updateUserDetails,
    createUserDetails,
    deleteUserDetails,
    getUserDetails,
    authenticateUser,
}