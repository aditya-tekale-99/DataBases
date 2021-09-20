/*UNDERSTANDING THE DATASET*/

/* Query to see whats in the table */
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5; 

/*HACKER NEWS MODERATING*/

/* find the total score of all the stories. */
SELECT SUM(score)
FROM hacker_news;

/* Find the individual users who have gotten combined scores of more than 200, and their combined scores */
SELECT user, SUM(score)
FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY 2 DESC;

/* add the users’ scores together and divide by the total to get the percentage */
SELECT (517 + 309 + 304 + 282) / 6366.0;

/* The url of the video is:
https://www.youtube.com/watch?v=dQw4w9WgXcQ
How many times has each offending user posted this link? */
SELECT user,
   COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY 1
ORDER BY 2 DESC;

/*WHICH SITES FEED HACKER NEWS?*/

/* Which of these sites feed Hacker News the most:
GitHub, Medium, or New York Times?
First, we want to categorize each story based on their source.
We can do this using a CASE statement */
SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source'
FROM hacker_news;

/* build on the previous query:
Add a column for the number of stories from each URL using COUNT().
Also, GROUP BY the CASE statement.
Remember that you can refer to a column in GROUP BY using a number */
-- Which sites feed hacker news?
SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source',
  COUNT(*)
FROM hacker_news
GROUP BY 1;

/*WHAT'S THE BEST TIME TO POST A STORY?*/

/* What’s the best time of the day to post a story on Hacker News? */
SELECT timestamp
FROM hacker_news
LIMIT 10;

/* SQLite comes with a strftime() function - a very powerful function that allows you to return a formatted date.
It takes two arguments:
strftime(format, column) */
SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

/* now we understand how strftime() works. Let’s write a query that returns three columns:
 - The hours of the timestamp
 - The average score for each hour
 - The count of stories for each hour */
 SELECT strftime('%H', timestamp), 
   AVG(score),
   COUNT(*)
FROM hacker_news
GROUP BY 1
ORDER BY 1;

/* What are the best hours to post a story on Hacker News? */
SELECT strftime('%H', timestamp) AS 'Hour', 
   ROUND(AVG(score), 1) AS 'Average Score', 
   COUNT(*) AS 'Number of Stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 1;

-- The best hours are in the morning around 7 am and afternoon around 6 - 8 pm! Monster difference!
