/*
1- Selezionare tutte le software house americane (3)
*/

SELECT *
FROM software_houses
WHERE country = 'United States';

/*
2- Selezionare tutti i giocatori della città di 'Rogahnland' (2)
*/

SELECT *
FROM players
WHERE city = 'Rogahnland';

/*
3- Selezionare tutti i giocatori il cui nome finisce per "a" (220)
*/

SELECT *
FROM players
WHERE name LIKE('%a');

/*
4- Selezionare tutte le recensioni scritte dal giocatore con ID = 800 (11)
*/

SELECT *
FROM reviews
WHERE player_id = 800;

/*
5- Contare quanti tornei ci sono stati nell'anno 2015 (9)
*/

SELECT COUNT(*) AS tournament_number
FROM tournaments
WHERE year = 2015;

/*
6- Selezionare tutti i premi che contengono nella descrizione la parola 'facere' (2)
*/

SELECT *
FROM awards
WHERE description LIKE ('%facere%');

/*
7- Selezionare tutti i videogame che hanno la categoria 2 (FPS) o 6 (RPG), mostrandoli una sola volta (del videogioco vogliamo solo l'ID) (287)
*/

SELECT DISTINCT videogame_id
FROM category_videogame
WHERE category_id = 2 OR category_id = 6;

/*
8- Selezionare tutte le recensioni con voto compreso tra 2 e 4 (2947)
*/

SELECT *
FROM reviews
WHERE rating BETWEEN 2 AND 4;

/*
9- Selezionare tutti i dati dei videogiochi rilasciati nell'anno 2020 (46)
*/

SELECT name, overview, software_house_id
FROM videogames
WHERE YEAR(release_date) = 2020;

/*
10- Selezionare gli id dei videogame che hanno ricevuto almeno una recensione da 5 stelle, mostrandoli una sola volta (443)
*/

SELECT DISTINCT videogame_id
FROM reviews
WHERE rating = 5;

/*
--------------------------------------------------------------------------------
*/

/*
1- Contare quante software house ci sono per ogni paese (3)
*/

SELECT country, COUNT(id) as software_house_number
FROM software_houses
GROUP BY country;

/*
2- Contare quante recensioni ha ricevuto ogni videogioco (del videogioco vogliamo solo l'ID) (500)
*/

SELECT videogame_id, COUNT(id) AS rewiews_number
FROM reviews
GROUP BY videogame_id
ORDER BY videogame_id ASC;

/*
3- Contare quanti videogiochi hanno ciascuna classificazione PEGI (della classificazione PEGI vogliamo solo l'ID) (13)
*/

SELECT pegi_label_id, COUNT(videogame_id) AS videogames_number
FROM pegi_label_videogame
GROUP BY pegi_label_id
ORDER BY videogames_number DESC;

/*
4- Mostrare il numero di videogiochi rilasciati ogni anno (11)
*/

SELECT YEAR(release_date), COUNT(id) AS number_of_videogames
FROM videogames
GROUP BY YEAR(release_date);

/*
5- Contare quanti videogiochi sono disponbiili per ciascun device (del device vogliamo solo l'ID) (7)
*/

SELECT device_id, COUNT(videogame_id) AS number_of_videogames
FROM device_videogame
GROUP BY device_id;

/*
6- Ordinare i videogame in base alla media delle recensioni (del videogioco vogliamo solo l'ID) (500)
*/

SELECT videogame_id, AVG(rating) as avarage_rating
FROM reviews
GROUP BY videogame_id
ORDER BY avarage_rating DESC;

/*
----------------------------------------------------------
*/

/*
1- Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)
*/

SELECT DISTINCT players.name, players.lastname, players.nickname, players.city
FROM players
JOIN reviews ON players.id = reviews.player_id;

/*
2- Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)
*/

SELECT DISTINCT videogames.name
FROM videogames
JOIN tournament_videogame ON videogames.id = tournament_videogame.videogame_id
JOIN tournaments ON tournament_videogame.tournament_id = tournaments.id
WHERE tournaments.year = 2016;

/*
3- Mostrare le categorie di ogni videogioco (1718)
*/

SELECT videogames.name, categories.name
FROM videogames
JOIN category_videogame ON videogames.id = category_videogame.videogame_id
JOIN categories ON category_videogame.category_id = categories.id
ORDER BY videogames.name ASC;




