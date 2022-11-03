SELECT
  u.user_name AS usuario,
  CASE
    WHEN MAX(h.playback_date >= '2021-01-01') THEN 'Usuário ativo'
    ELSE 'Usuário inativo'
  END AS status_usuario
FROM SpotifyClone.user AS u
LEFT JOIN SpotifyClone.history AS h
ON u.user_id = h.user_id
GROUP BY u.user_id
ORDER BY u.user_name ASC;
