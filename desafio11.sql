SELECT
  song_title AS nome_musica,
  CASE
    WHEN song_title = 'The Bard’s Song' THEN REPLACE(song_title, 'Bard', 'QA')
    WHEN song_title = 'O Medo de Amar é o Medo de Ser Livre' THEN REPLACE(song_title, 'Amar', 'Code Review')
    WHEN song_title = 'Como Nossos Pais' THEN REPLACE(song_title, 'Pais', 'Pull Requests')
    WHEN song_title = 'BREAK MY SOUL' THEN REPLACE(song_title, 'SOUL', 'CODE')
    WHEN song_title = 'ALIEN SUPERSTAR' THEN REPLACE(song_title, 'SUPERSTAR', 'SUPERDEV')
    ELSE song_title
  END AS novo_nome
FROM SpotifyClone.song
WHERE
  song_title = 'The Bard’s Song'
  OR song_title = 'O Medo de Amar é o Medo de Ser Livre'
  OR song_title = 'Como Nossos Pais'
  OR song_title = 'BREAK MY SOUL'
  OR song_title = 'ALIEN SUPERSTAR'
ORDER BY novo_nome DESC;
