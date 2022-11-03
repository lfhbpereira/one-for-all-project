SELECT
  art.artist_name AS artista,
  alb.album_title AS album,
  COUNT(fol.artist_id) AS seguidores
FROM SpotifyClone.following AS fol
INNER JOIN SpotifyClone.artist AS art
ON fol.artist_id = art.artist_id
INNER JOIN SpotifyClone.album AS alb
ON art.artist_id = alb.artist_id
GROUP BY art.artist_name, alb.album_title
ORDER BY seguidores DESC, artista ASC, album ASC;
