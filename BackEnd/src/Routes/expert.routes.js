const express = require('express');
const expertController = require('../Controllers/expert.controllers');
const router = express.Router(); 



router.post('/getProfileDetails',expertController.getProfileDetails);
router.post('/updateProfileDetails',expertController.updateProfileDetails);
router.post('/createEvent', expertController.createEvent)
router.post('/getMyEvents', expertController.getMyEvents);
router.post('/updateEvent', expertController.updateEvents);
// router.get('/me', checkAuth, expertController.getMe); 




module.exports = router