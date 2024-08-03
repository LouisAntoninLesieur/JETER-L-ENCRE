const dataMapper = require("../dataMapper");

const mainController = {
    async homePage (req, res) {
        const latestArticles = await dataMapper.getLatestArticles();
        const actualTheme = await dataMapper.getActualTheme();

        res.render('home', {articles: latestArticles, theme: actualTheme});
    },
    async articlePage (req, res) {
        const id = req.params.id;

        const article = await dataMapper.getAtctualArticle(id);

        res.render('article', {article: article})
    },
    formPage (req, res) {
        res.render('form')
    }
};

module.exports = mainController;