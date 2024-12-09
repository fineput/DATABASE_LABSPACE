SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS connections;
CREATE TABLE connections (
    connection_id INT NOT NULL,
    station_from INT NOT NULL,
    station_to INT NOT NULL,
    PRIMARY KEY (connection_id),
    KEY station_from_idx (station_from),
    KEY station_to_idx (station_to),
    CONSTRAINT fk_station_from FOREIGN KEY (station_from) REFERENCES stations (station_id),
    CONSTRAINT fk_station_to FOREIGN KEY (station_to) REFERENCES stations (station_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO connections (connection_id, station_from, station_to) VALUES
(1, 8, 14),
(2, 1, 8),
(3, 2, 1),
(4, 5, 7),
(5, 3, 4),
(6, 15, 13);

DROP TABLE IF EXISTS lines;
CREATE TABLE lines (
    line_id INT NOT NULL,
    line_name VARCHAR(100) NOT NULL,
    line_color VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY (line_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO lines (line_id, line_name, line_color) VALUES
(1, 'Святошинсько-Броварська', 'червоний'),
(2, 'Оболонсько-Теремківська', 'синій'),
(3, 'Сирецько-Печерська', 'зелений');

DROP TABLE IF EXISTS stations;
CREATE TABLE stations (
    station_id INT NOT NULL,
    station_name VARCHAR(100) NOT NULL,
    line_id INT NOT NULL,
    prev_station INT DEFAULT NULL,
    next_station INT DEFAULT NULL,
    PRIMARY KEY (station_id),
    KEY line_idx (line_id),
    KEY prev_station_idx (prev_station),
    KEY next_station_idx (next_station),
    CONSTRAINT fk_line_id FOREIGN KEY (line_id) REFERENCES lines (line_id),
    CONSTRAINT fk_prev_station FOREIGN KEY (prev_station) REFERENCES stations (station_id),
    CONSTRAINT fk_next_station FOREIGN KEY (next_station) REFERENCES stations (station_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO stations (station_id, station_name, line_id, prev_station, next_station) VALUES
(1, 'Академмістечко', 1, NULL, 2),
(2, 'Житомирська', 1, 1, 3),
(3, 'Святошин', 1, 2, 4),
(4, 'Нивки', 1, 3, 5),
(5, 'Берестейська', 1, 4, NULL),
(6, 'Героїв Дніпра', 2, NULL, 7),
(7, 'Мінська', 2, 6, 8),
(8, 'Оболонь', 2, 7, 9),
(9, 'Почайна', 2, 8, 10),
(10, 'Тараса Шевченка', 2, 9, NULL),
(11, 'Сирець', 3, NULL, 12),
(12, 'Дорогожичі', 3, 11, 13),
(13, 'Лук\'янівська', 3, 12, 14),
(14, 'Золоті ворота', 3, 13, 15),
(15, 'Палац спорту', 3, 14, NULL);
