const express = require('express');
const userControllers = require('../Controllers/user.controllers');
const router = express.Router(); 

//  Required for authentication
// const checkAuth = require('../middleware/checkAuth.middleware');


router.post('/signup', userControllers.createUserDetails);
router.post('/login', userControllers.authenticateUser);

router.post('/delete',userControllers.deleteUserDetails);
router.post('/get',userControllers.getUserDetails);
// router.get('/me', checkAuth, userControllers.getMe); 


module.exports = router