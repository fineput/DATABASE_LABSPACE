--Крок 1: Створення таблиці Користувачів 
CREATE TABLE UserAccounts (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    email_address VARCHAR(100) UNIQUE NOT NULL
);

--Крок 2: Створення таблиці Проєктів (Projects)
CREATE TABLE ProjectList (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    creator_id INT REFERENCES UserAccounts(id)
);

--Крок 3: Створення таблиці Завдань (Tasks)
CREATE TABLE TaskList (
    id SERIAL PRIMARY KEY,
    project_reference INT REFERENCES ProjectList(id),
    title VARCHAR(100) NOT NULL,
    created_by INT REFERENCES UserAccounts(id),
    assigned_user INT REFERENCES UserAccounts(id),
    details TEXT
);

--Крок 4: Створення таблиці для зв'язку користувачів із проєктами (ProjectUserLinks)
CREATE TABLE ProjectUserLinks (
    project_reference INT REFERENCES ProjectList(id),
    user_reference INT REFERENCES UserAccounts(id),
    PRIMARY KEY (project_reference, user_reference)
);

--Крок 5: Створення таблиці для Файлів (Files)
CREATE TABLE DocumentFiles (
    id SERIAL PRIMARY KEY,
    document_name VARCHAR(255) NOT NULL,
    project_reference INT REFERENCES ProjectList(id),
    task_reference INT REFERENCES TaskList(id),
    link TEXT NOT NULL
);
