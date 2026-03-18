
-- 11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.
SELECT "amount"
FROM "payment"
ORDER BY "payment_date" DESC
OFFSET 2
LIMIT 1;

--11. Corrección
SELECT "amount"
FROM "rental"
JOIN "payment"
ON "rental"."rental_id" = "payment"."rental_id"
ORDER BY
"rental"."rental_date" DESC,
"rental"."rental_id" DESC
OFFSET 2
LIMIT 1;


-- 41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. ¿Cuál es el nombre más repetido?
SELECT
    "first_name",
    COUNT("actor_id") AS "total_actores"
FROM "actor"
GROUP BY "first_name"
ORDER BY COUNT("actor_id") DESC;

-- 41. Corrección (hay 3 nombres que se repiten 4 veces, por lo que escoje uno de ellos)
SELECT
"first_name",
COUNT("actor_id")
FROM "actor"
GROUP BY "first_name"
ORDER BY COUNT("actor_id") DESC
LIMIT 1;


-- 29. Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible.
SELECT
    "f"."title",
    COUNT("i"."inventory_id") AS "cantidad_disponible"
FROM "film" "f"
LEFT JOIN "inventory" "i" ON "f"."film_id" = "i"."film_id"
GROUP BY "f"."title";

-- 29. Corrección
SELECT
"film"."film_id",
"film"."title",
COUNT("inventory"."inventory_id")
FROM "film"
LEFT JOIN "inventory"
ON "film"."film_id" = "inventory"."film_id"
GROUP BY
"film"."film_id",
"film"."title";


-- 30. Obtener los actores y el número de películas en las que ha actuado.
SELECT
    "a"."first_name",
    "a"."last_name",
    COUNT("fa"."film_id") AS "numero_peliculas"
FROM "actor" "a"
JOIN "film_actor" "fa" ON "a"."actor_id" = "fa"."actor_id"
GROUP BY "a"."first_name", "a"."last_name";


--30. Corrección
SELECT
"actor"."actor_id",
"actor"."first_name",
"actor"."last_name",
COUNT("film_actor"."film_id")
FROM "actor"
JOIN "film_actor"
ON "actor"."actor_id" = "film_actor"."actor_id"
GROUP BY
"actor"."actor_id",
"actor"."first_name",
"actor"."last_name";


-- 47. Selecciona el nombre de los actores y la cantidad de películas en las que han participado.
SELECT
    "a"."first_name",
    "a"."last_name",
    COUNT("fa"."film_id") AS "cantidad_peliculas"
FROM "actor" "a"
LEFT JOIN "film_actor" "fa" ON "a"."actor_id" = "fa"."actor_id"
GROUP BY "a"."first_name", "a"."last_name";


-- 47. Corrección
SELECT
"actor"."actor_id",
"actor"."first_name",
"actor"."last_name",
COUNT("film_actor"."film_id")
FROM "actor"
LEFT JOIN "film_actor"
ON "actor"."actor_id" = "film_actor"."actor_id"
GROUP BY
"actor"."actor_id",
"actor"."first_name",
"actor"."last_name";


