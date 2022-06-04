const express = require('express');
const explorerController = require('../controllers/explorer.controller.js');
const router = express.Router(); 



router.post('/getProfileDetails',explorerController.getProfileDetails);
router.post('/updateProfile',explorerController.updatePro);
router.get('/getRelatedPlaces', )
router.get('/getRelatedEvents',  )
// router.get('/me', checkAuth, explorerController.getMe); 




module.exports = router