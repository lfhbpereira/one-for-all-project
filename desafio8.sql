SELECT
  art.artist_name AS artista,
  alb.album_title AS album
FROM SpotifyClone.artist AS art
INNER JOIN SpotifyClone.album AS alb
ON art.artist_id = alb.artist_id
WHERE art.artist_name = 'Elis Regina'
ORDER BY alb.album_title ASC;
