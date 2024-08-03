const dataMapper = require("../dataMapper");

const mainController = {
    async homePage (req, res) {
        const latestArticles = await dataMapper.getLatestArticles();
        const actualTheme = await dataMapper.getActualTheme();
        res.render('home', {articles: latestArticles, theme: actualTheme});
    },
    articlePage (req, res) {
        res.render('article')
    },
    formPage (req, res) {
        res.render('form')
    }
};

module.exports = mainController;