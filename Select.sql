SELECT name, duration 
FROM tracks 
WHERE duration = (SELECT MAX(duration) FROM tracks);

SELECT name
FROM tracks
WHERE duration >= 210;

SELECT name 
FROM albums 
WHERE year BETWEEN 2018 AND 2020;

SELECT name
FROM performers
WHERE name NOT LIKE '% %';

SELECT name 
FROM tracks 
WHERE LOWER(name) 
LIKE '%мой%' OR LOWER(name) LIKE '%my%';

SELECT g.Name AS Genre, COUNT(pg.Performer_ID) AS Number_Of_Performers
FROM Genres g
LEFT JOIN Performers_Genres pg ON g.Genre_ID = pg.Genre_ID
GROUP BY g.Name;

SELECT a.Year, COUNT(t.Track_ID) AS Number_Of_Tracks
FROM Albums a
JOIN Tracks t ON a.Album_ID = t.Album_ID
WHERE a.Year BETWEEN 2019 AND 2020
GROUP BY a.Year;

SELECT a.Name AS AlbumName, ROUND(AVG(t.Duration), 2) AS Average_Duration
FROM Albums a
JOIN Tracks t ON a.Album_ID = t.Album_ID
GROUP BY a.Name;

SELECT p.Name AS Performer_Name
FROM Performers p
LEFT JOIN Performers_Albums pa ON p.Performer_ID = pa.Performer_ID
LEFT JOIN Albums a ON pa.Album_ID = a.Album_ID
WHERE a.Year <> 2020 OR a.Year IS NULL;

SELECT DISTINCT c.Name
FROM Collections c
INNER JOIN Collections_Tracks ct ON c.Collection_ID = ct.Collection_ID
INNER JOIN Tracks t ON ct.Track_ID = t.Track_ID
INNER JOIN Albums a ON t.Album_ID = a.Album_ID
INNER JOIN Performers_Albums pa ON a.Album_ID = pa.Album_ID
WHERE pa.Performer_ID = 3;

SELECT c.Name 
FROM Collections c 
JOIN Collections_Tracks ct ON c.Collection_ID = ct.Collection_ID 
JOIN Tracks t ON ct.Track_ID = t.Track_ID 
JOIN Albums a ON t.Album_ID = a.Album_ID 
JOIN Performers_Albums pa ON a.Album_ID = pa.Album_ID 
JOIN Performers_Genres pg ON pa.Performer_ID = pg.Performer_ID 
GROUP BY c.Name 
HAVING COUNT(DISTINCT pg.Genre_ID) > 1;

SELECT t.Name 
FROM Tracks t 
WHERE t.Track_ID NOT IN (SELECT Track_ID FROM Collections_Tracks);

SELECT p.Name 
FROM Performers p 
JOIN Performers_Albums pa ON p.Performer_ID = pa.Performer_ID 
JOIN Albums a ON pa.Album_ID = a.Album_ID 
JOIN Tracks t ON a.Album_ID = t.Album_ID 
WHERE t.Duration = (SELECT MIN(Duration) FROM Tracks);

SELECT Name
FROM Albums
WHERE Album_ID IN 
( SELECT Album_ID FROM Tracks GROUP BY Album_ID HAVING COUNT(Track_ID) = 
( SELECT COUNT(Track_ID) FROM Tracks GROUP BY Album_ID ORDER BY COUNT(Track_ID) LIMIT 1 ) );