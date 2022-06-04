const express = require('express')
const app = express()
const port = 3000   

const sequelize = require('./core/db');
const Expert = require('./Models/expert');
const User = require('./Models/user');
const Explorer = require('./Models/explorer'); 

// Relations 
User.hasOne(Expert)
User.hasOne(Explorer)


// sequelize.sync( {force : true} )
// .then( (resutl) =>{
//     console.log(resutl)
// } )
// .catch( (error) => console.log(error))

     

// app.get('/', (req, res) => {
//     sequelize.sync( {force : true} )
// .then( (resutl) =>{
//     console.log(resutl)
// } )
// .catch( (error) => console.log(error))
// })




app.listen(port, console.log(`The server is started at port : ${port}`))