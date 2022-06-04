const express = require('express');
const explorerController = require('../Controllers/explorer.controllers');
const router = express.Router(); 



router.post('/getProfileDetails',explorerController.getProfileDetails);
router.post('/updateProfile',explorerController.updateProfileDetails);
router.get('/getRelatedPeople', explorerController.getRelatedPeople);
router.get('/getRelatedEvents',  explorerController.getRelatedEvents);
// router.get('/me', checkAuth, explorerController.getMe); 




module.exports = router