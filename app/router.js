const mainController = require('./controllers/mainController');

const express = require('express');

const router = express.Router();

router.get('/', mainController.homePage);

router.get('/article/:id', mainController.articlePage)
router.get('/article', mainController.articlePage);
// router.get('/participer', mainController.formPage);

module.exports = router;