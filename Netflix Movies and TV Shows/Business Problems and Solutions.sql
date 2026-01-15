-- Business Problems and Solutions. 

-- 1. What is the Total Number of Movies and TV Shows on Netflix?

SELECT 
    type, COUNT(*)
FROM
    netflix_titles
GROUP BY type; 

-- 2. Which are the Top 10 Countries by Number of Titles on Netflix?

SELECT 
    country, COUNT(*) AS Total_titles
FROM
    netflix_titles
GROUP BY country
ORDER BY Total_titles DESC
LIMIT 10; 

-- 3. What is the Yearly Trend of Content Releases on Netflix?
SELECT 
    release_year, COUNT(*) Total_titles
FROM
    netflix_titles
GROUP BY release_year
ORDER BY release_year DESC;  
 
 -- 4. What are the Most Popular Genres on Netflix?
SELECT 
    listed_in AS Genre, COUNT(*) AS Total_titles
FROM
    netflix_titles
GROUP BY Genre
ORDER BY Total_titles DESC; 

-- 5. How Many Titles are Available in Each Rating Category on Netflix?
SELECT 
    rating, COUNT(*) AS Total_titles
FROM
    netflix_titles
GROUP BY rating
ORDER BY Total_titles DESC; 

-- 6. Find the Movies or TV Shows by a Specific Director on Netflix?

SELECT 
    title, type, release_year
FROM
    netflix_titles
WHERE
    director = 'Rahul Rawail';
    
-- 7. Find the Titles Containing a Specific Keyword in Their Description on Netflix?. 

SELECT 
    title, description
FROM
    netflix_titles
WHERE
    description LIKE '%love%'
ORDER BY description DESC
LIMIT 10;  

-- 8. What is the Average Duration of Movies on Netflix?
SELECT 
    ROUND(AVG(duration), 2) AS Avg_Duration
FROM
    netflix_titles
WHERE
    type = 'movie';  

-- 9.What is the Average Duration of TV show on Netflix?
SELECT 
    ROUND(AVG(duration)) AS Avg_Duration
FROM
    netflix_titles
WHERE
    type = 'tv show'; 
    
-- 10.  Find the TV Shows with More Than One Season on Netflix?
SELECT 
    title, duration
FROM
    netflix_titles
WHERE
    type = 'TV Show'
        AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 1; 

-- 11. Who are the Top 10 Directors with the Most Titles on Netflix?
SELECT 
    director, COUNT(*) AS total_titles
FROM
    netflix_titles
WHERE
    director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;  

-- 12. Find the Titles with High IMDb Scores (if available) on Netflix?


SELECT 
    title, rating
FROM
    netflix_titles
WHERE
    rating IN ('TV-MA' , 'R', 'PG-13');

-- 13. How Many Titles Were Released Each Month on Netflix?

SELECT 
    MONTHNAME(STR_TO_DATE(date_added, '%M %d, %Y')) AS month_name,
    COUNT(*) AS total_titles
FROM
    netflix_titles
GROUP BY month_name
ORDER BY FIELD(month_name,'January','February','March','April','May',
        'June','July','August','September','October','November','December'); 
        
-- 14. What are the Top 10 Longest Movies Available on Netflix?  

SELECT 
    title, duration
FROM
    netflix_titles
WHERE
    type = 'Movie'
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC
LIMIT 1;  

-- 15.  Find Movies and TV Shows Available in a Specific Country on Netflix?

SELECT 
    title, type
FROM
    netflix_titles
WHERE
    country = 'India'; 
    
-- 16. Count the Movies and TV Shows Available in a Specific Country.
SELECT 
    type, COUNT(title) AS Total_Titles
FROM
    netflix_titles
WHERE
    country = 'India'
GROUP BY type; 







 
 
 
