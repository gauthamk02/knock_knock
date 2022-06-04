const express = require('express');
const userControllers = require('../controllers/users.controllers');
const router = express.Router(); 

//  Required for authentication
// const checkAuth = require('../middleware/checkAuth.middleware');


router.post('/signup',userControllers.userRegister);
router.post('/login',userControllers.userLogin);

// router.get('/me', checkAuth, userControllers.getMe); 


module.exports = router