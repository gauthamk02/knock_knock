const express = require('express')
const bodyParser = require('body-parser')
// var multer = require('multer');
// var upload = multer();

const app = express()
const port = 3000   

//Routers
const UserRouter = require('./Routes/user.routes')
const ExplorerRouter = require('./Routes/explorer.routes')
const ExpertRouter = require('./Routes/expert.routes')


const sequelize = require('./core/db');
const Expert = require('./Models/expert');
const User = require('./Models/user');
const Explorer = require('./Models/explorer'); 
// const Events = require('./Models/events');
//Relations 
User.hasOne(Expert)
User.hasOne(Explorer)
// Events.hasOne(User)

// If any changes are made in the Model then uncomment it once to force overwrite
// Caution will delete prev data stored

// sequelize.sync( {force : true} )
// .then( (resutl) =>{
//     //console.log(resutl)
// } )
// .catch( (error) => console.log(error))

// app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
// app.use(upload.array());

app.use('/users', UserRouter)
app.use('/explorer', ExplorerRouter)
app.use('/expert', ExpertRouter)


// Not Found
app.use(function(req, res, next) {
    res.status(err.status || 404).json({
      message: "No such route exists"
    })
  });
  
  // error handler
  app.use(function(err, req, res, next) {
    res.status(err.status || 500).json({
      message: "Error Message"
    })
  });



app.listen(port, console.log(`The server is started at port : ${port}`))