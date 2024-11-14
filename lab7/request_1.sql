-- Створення таблиці для категорій новин
CREATE TABLE news_categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Створення таблиці для статей
CREATE TABLE news_articles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    headline VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    published_at DATETIME NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES news_categories(id)
);

-- Створення таблиці для коментарів
CREATE TABLE article_comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    article_id INT,
    content TEXT NOT NULL,
    created_at DATETIME NOT NULL,
    user_ip_address VARCHAR(45),
    FOREIGN KEY (article_id) REFERENCES news_articles(id)
);

-- Створення таблиці для оцінок
CREATE TABLE article_ratings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    article_id INT,
    score INT CHECK (score BETWEEN 1 AND 5),
    user_ip_address VARCHAR(45),
    FOREIGN KEY (article_id) REFERENCES news_articles(id),
    UNIQUE (article_id, user_ip_address)
);
