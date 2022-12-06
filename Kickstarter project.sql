

SELECT * 
FROM kickstarter..kickstarter_projects;

--How many unique IDs are in the dataset?

SELECT COUNT(DISTINCT ID)
FROM kickstarter..kickstarter_projects;

--How many countries are in the dataset?

SELECT COUNT(DISTINCT Country) AS distinct_countries
FROM kickstarter..kickstarter_projects;

--Unique countries in the dataset

SELECT DISTINCT Country
FROM kickstarter..kickstarter_projects;


--Number of unique project condition

SELECT DISTINCT State
FROM kickstarter..kickstarter_projects;

--Question 1
--Which category has the highest success percentage?

SELECT Category, COUNT(*) AS Success,
ROUND (100*COUNT(*)/SUM(COUNT(*)) OVER (), 2) AS success_pct
FROM kickstarter..kickstarter_projects
WHERE State = 'Successful'
GROUP BY Category
ORDER BY COUNT(*) DESC;

--Question 2
--How many projects have been successful?

SELECT COUNT (State) AS Successful_projects
FROM kickstarter..kickstarter_projects
WHERE State = 'Successful';

--Question 3
--What project with a goal over $1000 USD had the biggest Goal completion percentage? 
--How much money was pledged?

SELECT TOP 1 Name, Category, Goal, Pledged, SUM(Pledged/Goal)*100 AS goal_completion_percentage
FROM kickstarter..kickstarter_projects
WHERE Goal > 1000
GROUP BY Name, Category, Goal, Pledged, Launched
ORDER BY goal_completion_percentage DESC;

--Question 4
--Identify any trends in project success rates over the years?

SELECT DISTINCT(Category), Launched
FROM kickstarter..kickstarter_projects
WHERE State = 'Successful'
GROUP BY Category, Launched;


--Successful projects by country

SELECT DISTINCT(Country), Category
FROM kickstarter..kickstarter_projects
WHERE State = 'Successful'
ORDER BY Country;

