SELECT
  s.song_title AS nome,
  COUNT(h.song_id) AS reproducoes
FROM SpotifyClone.plan AS p
INNER JOIN SpotifyClone.user AS u
ON p.plan_id = u.plan_id
INNER JOIN SpotifyClone.history AS h
ON u.user_id = h.user_id
INNER JOIN SpotifyClone.song AS s
ON h.song_id = s.song_id
WHERE p.plan_title = 'gratuito' OR p.plan_title = 'pessoal'
GROUP BY s.song_title
ORDER BY s.song_title ASC;
