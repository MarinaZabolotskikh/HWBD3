CREATE TABLE IF NOT EXISTS genre (
id SERIAL PRIMARY KEY,
name VARCHAR(40) NOT NULL
);

ALTER TABLE genre ADD UNIQUE (genre_name);

CREATE TABLE IF NOT EXISTS artist (
id SERIAL PRIMARY KEY,
artist_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist_genre (
artist_id INTEGER REFERENCES Artist(id),
genre_id INTEGER REFERENCES Genre(id)
);

ALTER TABLE artist_genre
ADD CONSTRAINT artist_genre_id PRIMARY KEY (artist_id, genre_id);

CREATE TABLE IF NOT EXISTS album (
id INTEGER PRIMARY KEY,
album_name VARCHAR(100) NOT NULL,
release_year INTEGER
);

ALTER TABLE album  ADD CHECK (release_year > 1877);

CREATE TABLE IF NOT EXISTS artist_album (
artist_id INTEGER REFERENCES Artist(id),
album_id INTEGER REFERENCES Album(id)
);

ALTER TABLE artist_album
ADD CONSTRAINT artist_album_id PRIMARY KEY (artist_id, album_id);


CREATE TABLE IF NOT EXISTS song (
id INTEGER PRIMARY KEY,
song_name VARCHAR(100) NOT NULL,
song_time NUMERIC,
album_id INTEGER REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS digest (
id INTEGER PRIMARY KEY,
digest_name VARCHAR(100) NOT NULL,
release_year INTEGER
);

ALTER TABLE digest ADD CHECK (release_year > 1877);

CREATE TABLE IF NOT EXISTS digest_song (
digest_id INTEGER REFERENCES Digest(id),
song_id INTEGER REFERENCES Song(id)
);

ALTER TABLE digest_song
ADD CONSTRAINT digest_song_id PRIMARY KEY (digest_id, song_id);