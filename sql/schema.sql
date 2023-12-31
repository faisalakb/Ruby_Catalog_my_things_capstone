
CREATE DATABASE catalog_of_things;

use catalog_of_things;

-- Create tables

CREATE TABLE author (
    id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);


CREATE TABLE source (
    id INT PRIMARY KEY,
    name TEXT
);


CREATE TABLE label (
    id INT PRIMARY KEY,
    title TEXT,
    color TEXT
);


CREATE TABLE genre (
    id INT PRIMARY KEY,
    name TEXT
);


CREATE TABLE game (
    id INT PRIMARY KEY,
    multiplayer BOOLEAN,
    last_played_at DATE,
    publish_date DATE,
    archived BOOLEAN,
    genre_id INTEGER,
    source_id INTEGER,
    author_id INTEGER,
    label_id INTEGER,
    FOREIGN KEY (genre_id) REFERENCES genre (id),
    FOREIGN KEY (source_id) REFERENCES source (id),
    FOREIGN KEY (author_id) REFERENCES author (id),
    FOREIGN KEY (label_id) REFERENCES label (id)
);

CREATE TABLE movie (
    id INT PRIMARY KEY,
    silent BOOLEAN,
    publish_date DATE,
    archived BOOLEAN,
    genre_id INTEGER,
    source_id INTEGER,
    author_id INTEGER,
    label_id INTEGER,
    FOREIGN KEY (genre_id) REFERENCES genre (id),
    FOREIGN KEY (source_id) REFERENCES source (id),
    FOREIGN KEY (author_id) REFERENCES author (id),
    FOREIGN KEY (label_id) REFERENCES label (id)
);


CREATE TABLE book (
    id INT PRIMARY KEY,
    cover_state TEXT,
    publisher TEXT,
    publish_date DATE,
    archived BOOLEAN,
    genre_id INTEGER,
    source_id INTEGER,
    author_id INTEGER,
    label_id INTEGER,
    FOREIGN KEY (genre_id) REFERENCES genre (id),
    FOREIGN KEY (source_id) REFERENCES source (id),
    FOREIGN KEY (author_id) REFERENCES author (id),
    FOREIGN KEY (label_id) REFERENCES label (id)
);


CREATE TABLE music (
    id INT PRIMARY KEY,
    name TEXT,
    on_spotify BOOLEAN,
    publish_date DATE,
    archived BOOLEAN,
    genre_id INTEGER,
    source_id INTEGER,
    author_id INTEGER,
    label_id INTEGER,
    FOREIGN KEY (genre_id) REFERENCES genre (id),
    FOREIGN KEY (source_id) REFERENCES source (id),
    FOREIGN KEY (author_id) REFERENCES author (id),
    FOREIGN KEY (label_id) REFERENCES label (id)
);
