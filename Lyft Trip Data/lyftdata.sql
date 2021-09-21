SELECT * FROM trips;
 
SELECT * FROM riders;
 
SELECT * FROM cars;

-- The primary key for all three tables are id column

/* Cross Join between riders and cars */
SELECT riders.first,
   riders.last,
   cars.model
FROM riders, cars;

-- Not very useful as the data is a combination of each user with every car model.

/* Find the columns to join between trips and riders and combine the two tables using a LEFT JOIN.
Let trips be the left table. */
SELECT trips.date, 
   trips.pickup, 
   trips.dropoff, 
   trips.type, 
   trips.cost,
   riders.first, 
   riders.last,
   riders.username
FROM trips
LEFT JOIN riders 
  ON trips.rider_id = riders.id;

/* Find the columns to join on and combine the trips and cars table using an INNER JOIN */
SELECT *
FROM trips
JOIN cars
  ON trips.car_id = cars.id;

-- JOIN keyword acts as INNER JOIN

/* The new riders data are in! There are three new users this month.
Stack the riders table on top of the new table named riders2 */
SELECT *
FROM riders
UNION
SELECT *
FROM riders2;


/*QUERIES AND AGGREGATES*/

/* Average cost for a trip */
SELECT AVG(cost)
FROM trips;
-- avg cost is 31.915
/*or*/

SELECT ROUND(AVG(cost), 2)
FROM trips;
-- avg cost is 31.92

/* Find all the riders who have used Lyft less than 500 times! */
SELECT *
FROM riders
WHERE total_trips < 500;

--using union
SELECT *
FROM riders
WHERE total_trips < 500
UNION
SELECT *
FROM riders2
WHERE total_trips < 500;

/* Calculate the number of cars that are active */
SELECT COUNT(*)
FROM cars
WHERE status = 'active';

/* Write a query that finds the two cars that have the highest trips completed */
SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;