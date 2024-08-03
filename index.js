require('dotenv').config();

const express = require('express');

const PORT = process.env.PORT || 3000;

const app = express();

const router = require('./app/router');

app.use(express.static('integration'));

app.set('view engine', 'ejs');
app.set('views', './app/views');

app.use(router);


app.listen(PORT, () => {
    console.log(`Currently flying on ${process.env.BASE_URL} ${PORT}`);
});
