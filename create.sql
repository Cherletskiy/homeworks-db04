CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE CHECK (LENGTH(genre_name) > 1)
);

CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL UNIQUE CHECK (LENGTH(artist_name) > 1)
);

CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(100) NOT NULL CHECK (LENGTH(album_name) > 1),
    album_year INTEGER NOT NULL CHECK (album_year BETWEEN 1960 AND EXTRACT(YEAR FROM CURRENT_DATE))
);

CREATE TABLE tracks (
    track_id SERIAL PRIMARY KEY,
    track_name VARCHAR(100) NOT NULL CHECK (LENGTH(track_name) > 1),
    track_duration INTEGER NOT NULL CHECK (track_duration > 0),
    album_id INTEGER NOT NULL REFERENCES albums(album_id) ON DELETE CASCADE
);

CREATE TABLE collections (
    collection_id SERIAL PRIMARY KEY,
    collection_name VARCHAR(100) NOT NULL UNIQUE CHECK (LENGTH(collection_name) > 1),
    collection_year INTEGER NOT NULL CHECK (collection_year BETWEEN 1900 AND EXTRACT(YEAR FROM CURRENT_DATE))
);

CREATE TABLE artist_genre (
    genre_id INTEGER NOT NULL REFERENCES genres(genre_id) ON DELETE CASCADE,
    artist_id INTEGER NOT NULL REFERENCES artists(artist_id) ON DELETE CASCADE,
    CONSTRAINT artis_genre_pk PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE album_artist (
    album_id INTEGER NOT NULL REFERENCES albums(album_id) ON DELETE CASCADE,
    artist_id INTEGER NOT NULL REFERENCES artists(artist_id) ON DELETE CASCADE,
    CONSTRAINT album_artist_pk PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE collection_track (
    collection_id INTEGER NOT NULL REFERENCES collections(collection_id) ON DELETE CASCADE,
    track_id INTEGER NOT NULL REFERENCES tracks(track_id) ON DELETE CASCADE,
    CONSTRAINT collection_track_id PRIMARY KEY (collection_id, track_id)
);
