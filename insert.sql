INSERT INTO artists (artist_name) 
VALUES ('The Beatles'), ('Eminem'), ('Pink Floyd'), ('Taylor Swift'), 
('Nirvana'), ('Daft Punk'), ('Miles Davis');

INSERT INTO genres (genre_name) 
VALUES ('Rock'), ('Hip-Hop'), ('Jazz'), ('Electronic'), ('Pop');

INSERT INTO albums (album_name, album_year) 
VALUES ('Abbey Road', 1969), 
       ('The Marshall Mathers LP', 2000), 
       ('The Dark Side of the Moon', 1973), 
       ('Nevermind', 1991), 
       ('Random Access Memories', 2013), 
       ('My Beautiful Dark Twisted Fantasy', 2010), 
       ('My Everything', 2014), 
       ('Fine Line', 2019), 
       ('Future Nostalgia', 2020);

INSERT INTO tracks (track_name, track_duration, album_id) 
VALUES ('Come Together', 259, 1), 
       ('Something', 183, 1), 
       ('Stan', 404, 2), 
       ('The Real Slim Shady', 284, 2), 
       ('Time', 412, 3), 
       ('Money', 382, 3), 
       ('Smells Like Teen Spirit', 301, 4), 
       ('Come as You Are', 219, 4), 
       ('Get Lucky', 369, 5), 
       ('Instant Crush', 337, 5), 
       ('Lucy in the Sky with Diamonds', 207, 1), 
       ('Without Me', 290, 2), 
       ('Us and Them', 462, 3), 
       ('Lithium', 257, 4), 
       ('Lose Yourself', 326, 2),
       ('My Beautiful Dark Twisted Fantasy', 390, 6), 
       ('My Everything', 285, 7), 
       ('Adore You', 240, 8),   
       ('Don’t Start Now', 183, 9);

INSERT INTO collections (collection_name, collection_year) 
VALUES ('Greatest Hits: The Beatles', 2015), 
       ('Best of Eminem', 2018), 
       ('Classic Rock Anthems', 2020), 
       ('Jazz Essentials', 2019), 
       ('Electronic Vibes', 2021);

INSERT INTO artist_genre (artist_id, genre_id) 
VALUES (1, 1), 
       (2, 2), 
       (3, 1), 
       (4, 5), 
       (5, 1), 
       (6, 4), 
       (7, 3);

INSERT INTO album_artist (album_id, artist_id) 
VALUES (1, 1), 
       (2, 2), 
       (3, 3), 
       (4, 5), 
       (5, 6), 
       (6, 2),  
       (7, 4),  
       (8, 5),  
       (9, 4);

INSERT INTO collection_track (collection_id, track_id) 
VALUES (1, 1), 
       (1, 5), 
       (2, 3), 
       (2, 4), 
       (2, 15), 
       (3, 7), 
       (3, 8), 
       (3, 14), 
       (4, 11), 
       (4, 13), 
       (4, 5), 
       (5, 9), 
       (5, 10), 
       (5, 6);

