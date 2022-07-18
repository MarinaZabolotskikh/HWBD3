SELECT album_name, release_year FROM album
  WHERE release_year = 2018;

SELECT song_name, song_time FROM song 
  WHERE song_time = (SELECT MAX(song_time) FROM song);

SELECT song_name FROM song
  WHERE NOT song_time < 3.5;

SELECT digest_name FROM digest
  WHERE release_year BETWEEN 2018 AND 2020;

SELECT artist_name FROM artist
  WHERE artist_name NOT LIKE '%% %%';

SELECT song_name FROM song
  WHERE song_name LIKE '%my%';
  
SELECT genre_name, COUNT(artist_name) FROM artist a
  JOIN artist_genre ag ON a.id = ag.artist_id 
  JOIN genre g ON ag.genre_id = g.id 
  GROUP BY g.genre_name;
 
SELECT album_name, release_year, COUNT(song_name) FROM song s
  JOIN album a ON s.album_id = a.id 
  WHERE release_year BETWEEN 2019 AND 2020
  GROUP BY a.album_name, a.release_year;
 
SELECT album_name, AVG(song_time) FROM song s 
  JOIN album a ON s.album_id = a.id 
  GROUP BY a.album_name;
 
SELECT artist_name FROM artist 
  WHERE artist_name NOT IN (SELECT artist_name FROM album a
                              JOIN artist_album aa ON a.id = aa.artist_id 
                              JOIN artist a2 ON aa.artist_id = a2.id 
                              WHERE release_year = 2020);
  
 SELECT digest_name FROM digest d 
   JOIN digest_song ds ON d.id = ds.digest_id 
   JOIN song s ON ds.song_id = s.id  
   JOIN album a ON s.album_id = a.id 
   JOIN artist_album aa ON a.id = aa.album_id
   JOIN artist a2 ON aa.artist_id = a2.id 
   WHERE artist_name LIKE '«вери';
  
 SELECT album_name FROM album a  
   JOIN artist_album aa ON a.id = aa.album_id 
   JOIN artist a2 ON aa.artist_id =a2.id 
   JOIN artist_genre ag ON a2.id = ag.genre_id 
   GROUP BY a.album_name 
   HAVING COUNT(ag.genre_id) > 1; 
  
 SELECT song_name FROM song s 
   LEFT JOIN digest_song ds ON s.id = ds.song_id 
   WHERE song_id IS NULL;
   
 SELECT a.artist_name, song_time FROM artist a 
   JOIN artist_album aa ON a.id = aa.artist_id 
   JOIN album a2 ON aa.album_id = a2.id 
   JOIN song s ON a2.id = s.album_id 
   WHERE song_time = (SELECT MIN(song_time) FROM song);
  
 SELECT album_name FROM album a 
   JOIN song s ON a.id = s.album_id 
   GROUP BY a.album_name
   HAVING COUNT(s.id) IN (SELECT COUNT(s.id) FROM album a
                            JOIN song s ON a.id = s.album_id
                            GROUP BY a.album_name
                            ORDER BY COUNT(s.id)
                            LIMIT 1);
