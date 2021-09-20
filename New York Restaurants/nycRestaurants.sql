SELECT *
FROM nomnom;

/* the distinct neighborhood */
SELECT DISTINCT neighborhood
FROM nomnom;

/* distinct cuisine */
SELECT DISTINCT cuisine
FROM nomnom;

/* chinese takeout options */
SELECT *
FROM nomnom
WHERE cuisine = 'Chinese';

/* Return all the restaurants with reviews of 4 and above. */
SELECT * 
FROM nomnom
WHERE review >= 4;

/* Return all the restaurants that are Italian and $$$. */
SELECT * 
FROM nomnom
WHERE cuisine = 'Italian' AND price = '$$$';

/* Trey can’t remember the exact name of a restaurant he went to but he knows it contains the word ‘meatball’ in it. */
SELECT *
FROM nomnom
WHERE name LIKE '%meatball%';

/* Find all the close by spots in Midtown, Downtown or Chinatown. */
SELECT *
FROM nomnom
WHERE neighborhood = 'Midtown'
   OR neighborhood = 'Downtown'
   OR neighborhood = 'Chinatown'; 

/* Find all the health grade pending restaurants (empty values). */
SELECT *
FROM nomnom
WHERE health IS NULL;

/* Create a Top 10 Restaurants Ranking based on review */
SELECT *
FROM nomnom
ORDER BY review DESC
LIMIT 10;

/* Use CASE to change rating system */
SELECT name,
 CASE
  WHEN review > 4.5 THEN 'Extraordinary'
  WHEN review > 4 THEN 'Excellent'
  WHEN review > 3 THEN 'Good'
  WHEN review > 2 THEN 'Fair'
  ELSE 'Poor'
 END AS 'Review'
FROM nomnom;
