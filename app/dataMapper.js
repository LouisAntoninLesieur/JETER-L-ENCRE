const database = require('./database');

const dataMapper = {
    async getLatestArticles () {
        const result = await database.query({
            text:`
            SELECT author_name, title, article.id
            FROM article 
            JOIN author ON article.author_id = author.id
            ORDER BY article.id DESC;`,
        });
        //console.log(result.rows);
        return result.rows;
    },
    async getActualTheme () {
        const result = await database.query({
            text:`
            SELECT name
            FROM category
            ORDER BY id
            LIMIT 1;`,
        });
        //console.log(result.rows);
        return result.rows[0];
    },
    async getAtctualArticle (id) {
        const result = await database.query({
            text:`
            SELECT author_name, title, content, name AS category_name
            FROM article 
            JOIN author ON article.author_id = author.id
            JOIN category ON category.id = article.category_id
            WHERE article.id = $1;`,
            values: [id]
        });
        console.log(result.rows);
        return result.rows[0];
    }
};

module.exports = dataMapper;