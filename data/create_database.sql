BEGIN; -- starting transaction : if any command fails, the transaction is rolled back

-- Drop tables if they exist before initializing them again
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS author;

-- Create tables
CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    authorname VARCHAR(255) NOT NULL UNIQUE,
    author_email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE article (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author_id INTEGER REFERENCES author(id),
    category_id INTEGER REFERENCES category(id)
);

-- Insert data test
INSERT INTO author (authorname, author_email) VALUES
    ('michel', 'michel@isable.com'),
    ('marioBG', 'marioBG@isable.com'),
    ('the-scranton-strangler', 'the-scranton-strangler@isable.com')
;

INSERT INTO category (name) VALUES
    ('CATEGORIE TEST'),
    ('Catégorie 2'),
    ('Catégorie 3')
;

INSERT INTO article (title, content, author_id, category_id) VALUES
    ('L''article de Michel', 'Ceci est le premier article de Michel c''est génial parce que Michel adore raconter qu''il aime les pommes il aime tellement ça qu''il en parle vraiment à tous les gens qu''il croise ah la la sacré Michel. D''ailleurs je me demande pourquoi Michel n''a pas plutôt choisi de faire un Lorem 200 au lieu de nous raconter tout ça c''est vraiment terrible, sacré Michel !', 1, 1),
    ('L''article de Mario le BG', 'Je n''arive pas à comprendre. Ma moustache était pourtant si belle. Je l''avais soignée de telle sorte à ce que la Princesse ne remarque que cette fantastique moustache. Je n''arive pas à comprendre. Parfois je me dis que Luigi est un vrai forceur avec Daisy, ne vaudrais-je finalement pas mieux que lui avec mon acharnement envers Peach ? Je ne comprends vraiment pas ce qu''elle trouve à cette fichue tortue géante. Bowser ? Sans rire c''est quoi ce nom ? Non en vrai j''avoue c''est super stylé. Ce mec à la classe.

    Je dirais même qu''il a la super classe. En vrai je suis dégoûté qu''on soit en froid lui et moi. ', 2, 1),
    ('L''article de The Scranton Strangler', 'NO ! NOOOO ! NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO !', 3, 1)
;

COMMIT; -- end transaction
