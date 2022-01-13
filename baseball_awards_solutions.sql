-- Heaviest Hitters

SELECT
  teams.name AS "Name", ROUND(AVG(people.weight),0) AS "AVG Weight"
FROM people
JOIN batting
  ON batting.playerid = people.playerid
JOIN teams
  ON teams.teamid = batting.teamid
WHERE batting.yearid = 1871
GROUP BY teams.name
ORDER BY 2 DESC
LIMIT 1;

Name | AVG Weight
Rockford Forest Citys | 166

-- Shortest Sluggers

SELECT
  teams.name AS "Name", ROUND(AVG(people.height),0) AS "AVG Height"
FROM people
JOIN batting
  ON batting.playerid = people.playerid
JOIN teams
  ON teams.teamid = batting.teamid
WHERE batting.yearid = 1871
GROUP BY teams.name
ORDER BY 2 ASC
LIMIT 1;

Name | AVG Height
Fort Wayne Kekiongas | 68

-- Biggest Spenders

SELECT
  teams.name AS "Name", SUM(salaries.salary) AS "Total Salary"
FROM people
JOIN salaries
  ON salaries.playerid = people.playerid
JOIN teams
  ON teams.teamid = salaries.teamid
WHERE salaries.yearid = 1985
GROUP BY teams.name
ORDER BY 2 DESC
LIMIT 1;

Name | Total Salary
New York Yankees | 1523487828

-- Most Bang For Their Buck In 2010

SELECT
  teams.name AS "Name", 
  ROUND(SUM(salaries.salary/teams.w)) AS "Cost Per Win", 
  teams.w AS "Wins", 
  salaries.yearid AS "Year"
FROM salaries
JOIN teams
  ON teams.teamid = salaries.teamid
  AND teams.yearid = salaries.yearid
WHERE salaries.yearid = 2010
GROUP BY 
  teams.name, 
  teams.w, 
  salaries.yearid
ORDER BY 2 ASC
LIMIT 1;

Name | Cost Per Win | Wins | Year
San Diego Padres | 419992 | 90 |2010

-- Priciest Starter

SELECT
  pitching.yearid AS "Year",
  teams.name AS "Team",
	people.namegiven AS "Name",
  ROUND(SUM(salaries.salary/pitching.gs)) AS "Cost per Game"
FROM people
JOIN pitching
	ON pitching.playerid = people.playerid
JOIN salaries
	ON salaries.yearid = pitching.yearid
JOIN teams
	ON teams.teamid = pitching.teamid
  AND teams.yearid = pitching.yearid
  AND teams.yearid = salaries.yearid
WHERE pitching.gs > 10 AND pitching.yearid = 2000
GROUP BY 
  pitching.yearid, 
  people.namegiven,
  teams.name
ORDER BY 4 DESC
LIMIT 1;

Year | Team | Name | Cost per Game
2000 | Cleveland Indians | Steven Larry | 151466827