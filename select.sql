SELECT * FROM genres;
SELECT * FROM artists;
SELECT * FROM albums;
SELECT * FROM tracks;
SELECT * FROM collections;
SELECT * FROM artist_genre;
SELECT * FROM album_artist;
SELECT * FROM collection_track;


-- 2.1
SELECT track_name, track_duration
FROM tracks
WHERE track_duration = (SELECT MAX(track_duration) FROM tracks);

SELECT track_name, track_duration 
FROM tracks 
ORDER BY track_duration DESC 
LIMIT 1;

-- 2.2
SELECT track_name 
FROM tracks
WHERE track_duration >= 210; 

-- 2.3
SELECT collection_name 
FROM collections
WHERE collection_year BETWEEN 2018 AND 2020;

-- 2.4
SELECT artist_name
FROM artists
WHERE artist_name NOT LIKE '% %';

-- 2.5
SELECT track_name 
FROM tracks
WHERE track_name LIKE '%мой%' OR track_name LIKE '%my%';


-- 3.1
SELECT g.genre_name, COUNT(ag.artist_id) AS artist_count
FROM genres g
LEFT JOIN artist_genre ag ON g.genre_id = ag.genre_id
GROUP BY g.genre_name;

-- 3.2
SELECT COUNT(*)
FROM tracks t
JOIN albums a ON a.album_id = t.album_id
WHERE a.album_year BETWEEN 2019 AND 2020;

-- 3.3
SELECT a.album_name, AVG(t.track_duration)
FROM albums a 
JOIN tracks t ON a.album_id = t.album_id 
GROUP BY a.album_name;

-- 3.4
SELECT artists.artist_name
FROM artists
WHERE artist_id NOT IN (
    SELECT aa.artist_id
    FROM album_artist aa
    JOIN albums a ON aa.album_id = a.album_id
    WHERE a.album_year = 2020
);

-- 3.5
SELECT DISTINCT c.collection_name 
FROM collections c 
JOIN collection_track ct ON ct.collection_id = c.collection_id 
JOIN tracks t ON t.track_id = ct.track_id
JOIN albums al ON al.album_id = t.album_id 
JOIN album_artist aa ON aa.album_id = al.album_id 
JOIN artists a ON aa.artist_id = a.artist_id
WHERE a.artist_name = 'Eminem'

-- 4.1
SELECT DISTINCT a.album_name
FROM albums a
JOIN album_artist aa ON a.album_id = aa.album_id
JOIN artist_genre ag ON aa.artist_id = ag.artist_id
WHERE aa.artist_id IN (
    SELECT ag.artist_id
    FROM artist_genre ag
    GROUP BY ag.artist_id
    HAVING COUNT(DISTINCT ag.genre_id) > 1
);

-- 4.2
SELECT t.track_name 
FROM tracks t 
WHERE t.track_id NOT IN (
	SELECT track_id
	FROM collection_track ct
); 

SELECT t.track_name 
FROM tracks t 
LEFT JOIN collection_track ct ON t.track_id = ct.track_id
WHERE ct.track_id IS NULL;


-- 4.3 
SELECT a.artist_name, t.track_name, t.track_duration
FROM tracks t
JOIN album_artist aa ON t.album_id = aa.album_id
JOIN artists a ON aa.artist_id = a.artist_id
WHERE t.track_duration = (SELECT MIN(track_duration) FROM tracks);

-- 4.4
SELECT a.album_name, COUNT(t.track_id) AS track_count
FROM albums a
LEFT JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_id
HAVING COUNT(t.track_id) = (
    SELECT MIN(track_count) 
    FROM (
        SELECT COUNT(track_id) AS track_count
        FROM tracks
        GROUP BY album_id
    ) AS track_counts
);





