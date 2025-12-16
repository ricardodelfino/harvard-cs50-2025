-- The average energy of songs that are by Drake
SELECT AVG(energy)
FROM songs
-- joins the songs and artists tables
JOIN artists ON songs.artist_id = artists.id
WHERE artists.name = 'Drake';
