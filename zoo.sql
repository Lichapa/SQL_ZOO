-- 0 SELECT BASICS

  /* 0.1  SELECT .. FROM .. WHERE .. = .. */

  SELECT population FROM world
  WHERE name = 'Germany';

  /* 0.2 SELECT .. FROM .. WHERE .. IN (..)  */

  SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

  /* 0.3 SELECT .. BETWEEN .. AND .. */

  SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000 ;

-- 1 SELECT name ( Matching pattern Strings) 

  /* 1.1 Find the country that start with Y*/

  SELECT name FROM world
  WHERE name LIKE 'Y%';

  /* 1.2 Find the countries that end with y */

  SELECT name FROM world
  WHERE name LIKE '%Y';

  /* 1.3 Find the countries that contain the letter x  */
  SELECT name FROM world
  WHERE name LIKE '%x%';

  /* 1.4 Find the countries that end with land */
  SELECT name FROM world
  WHERE name LIKE '%land';

  /* 1.5 Find the countries that start with C and end with ia */
  SELECT name FROM world
  WHERE name LIKE 'C%ia';

  /* 1.6 Find the country that has oo in the name */
  SELECT name FROM world
  WHERE name LIKE '%oo%';

  /* 1.7 Find the countries that have three or more a in the name */
  SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

  /* 1.8 Find the countries that have "t" as the second character. */
  SELECT name FROM world
  WHERE name LIKE '_t%'
  ORDER BY name ;

  /* 1.9 Find the countries that have two "o" characters separated by two others. */
  SELECT name FROM world
  WHERE name LIKE '%o__o%' ;

  /* 1.10 Find the countries that have exactly four characters. */
  SELECT name FROM world
  WHERE name LIKE '____';

  /* 1.11 Find the country where the name is the capital city.*/
  SELECT name
  FROM world
  WHERE name = capital ;

  /* 1.12 Find the country where the capital is the country plus "City". */
  SELECT name
  FROM world
  WHERE capital LIKE concat(name, '%city')

  /* 1.13 Find the capital and the name where the capital includes the name of the country. */
  SELECT capital, name
  FROM world
  WHERE capital LIKE concat(name, '%');

  /* 1.14 Find the capital and the name where the capital is an extension of name of the country. */
  SELECT capital, name
  FROM world
  WHERE capital  LIKE concat (name, '%') AND capital > name ;

  /* 1.15 Show the name and the extension where the capital is an extension of name of the country. */
  SELECT  capital, name
  FROM world
  WHERE capital LIKE CONCAT(name, '%')
  AND capital != name;

-- 2 SELECT from WORLD
  /* 2.1 Introduction */
  SELECT name, continent, population FROM world

  -- 2.2 Large Countries
  /* Show the name for the countries that have a population of at least 200 million.
   200 million is 200000000, there are eight zeros. */
  SELECT name FROM world
  WHERE population >= 200000000

  -- 2.3 Per capita GDP
  /*Give the name and the per capita GDP for those countries with a 
  population of at least 200 million.  */
  SELECT name, gdp/population AS per_capita
  FROM world
  WHERE population > 200000000

  -- 2.4 South America in Millions
  /*Show the name and population in millions for the countries of the continent 'South America'. 
  Divide the population by 1000000 to get population in millions. */

  SELECT name, population/1000000
  FROM world
  WHERE continent = 'south america'

  -- 2.5 France, Germany, Italy
  /* Show the name and population for France, Germany, Italy  */

  SELECT name, population
  FROM world
  WHERE name IN ('france', 'germany','italy')

  --2.6 UNITED
  /* Show the name and population for France, Germany, Italy  */
  SELECT name
  FROM world
  WHERE name LIKE '%UNITED%'

  -- 2.7 Two Ways to be big
  /* Show the countries that are big by area or big by population. Show name, 
  population and area.  */

  SELECT name, population, area 
  FROM world
  WHERE area >= 3000000
  OR population >= 250000000

  -- 2.8 One or the other (but not both)
  /* Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) 
  or big by population (more than 250 million) but not both. Show name, population and area. */

  SELECT name, population, area
  FROM world
  WHERE population >= 250000000
  XOR area >= 3000000

  -- 2.9 Rounding
  /* For South America show population in millions and GDP in billions both to 2 decimal places. */

  SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
  FROM world
  WHERE continent = 'south america'

  -- 2.10 Trillion dollar economies
  /* Show per-capita GDP for the trillion dollar countries to the nearest $1000. */
  SELECT name, ROUND(gdp/population, -3 ) AS per_capita
  FROM world
  WHERE GDP > 1000000000000

  -- 2.11 Name and capital have the same length
  /* Show the name and capital where the name and the capital have the same number of characters. */
  SELECT name, capital 
  FROM world
  WHERE LENGTH(name) = LENGTH(capital)

  -- 2.12 Matching name and capital
  /* Show the name and the capital where the first letters of each match. 
  Don't include countries where the name and the capital are the same word.*/

  SELECT name, capital
  FROM world
  WHERE LEFT(name,1) = LEFT(capital,1) 
  AND name != capital

  -- 2.13 All the vowels
  /* Find the country that has all the vowels and no spaces in its name. */

  SELECT name FROM world
  WHERE name LIKE '%a%' AND 
  name  LIKE '%e%' AND 
  name  LIKE '%i%' AND 
  name  LIKE '%o%' AND 
  name  LIKE '%u%' AND 
  name NOT LIKE '% %'

-- 3 SELECT FROM nobel
  -- 3.1 Winners from 1950
  /* Change the query shown so that it displays Nobel prizes for 1950. */
  SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1950

  -- 3.2 1962 Literature
  /* Show who won the 1962 prize for Literature.  */
  SELECT winner
  FROM nobel
  WHERE yr = 1962
  AND subject = 'Literature';

  -- 3.3 Albert Einstein
  /* Show the year and subject that won 'Albert Einstein' his prize.  */
  SELECT yr, subject
  FROM nobel
  WHERE winner = 'Albert Einstein'

  -- 3.4 Recent Peace Prizes
  /* Give the name of the 'Peace' winners since the year 2000, including 2000.  */
  SELECT winner
  FROM nobel
  WHERE subject = 'peace' 
  AND yr >= 2000;

  --3.5 Literature in the 1980's
  /* Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive. */
  SELECT *
  FROM nobel
  WHERE subject = 'literature'
  AND yr BETWEEN 1980 AND 1989;

  -- 3.6 Only Presidents
  /* Show all details of the presidential winners:

    Theodore Roosevelt
    Woodrow Wilson
    Jimmy Carter
    Barack Obama */

  SELECT * FROM nobel
  WHERE winner IN
    ('Theodore Roosevelt',
    'Woodrow Wilson',
    'Jimmy Carter',
    'Barack Obama');

  -- 3.7 John
  /* Show the winners with first name John */
  SELECT winner
  FROM nobel
  WHERE winner LIKE 'John%';

  -- 3.8 Chemistry and Physics from different years
  /* Show the year, subject, and name of Physics winners for 1980 
    together with the Chemistry winners for 1984.*/

  SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1980 AND subject = 'Physics'
  OR yr = 1984 AND  subject = 'chemistry';

  -- 3.9 Exclude Chemists and Medics
  /* Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine */
  SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1980 AND
  subject != 'chemistry' AND
  subject != 'Medicine';

  --3.10 Early Medicine, Late Literature
  /* Show year, subject, and name of people who won a 'Medicine' prize in an early year 
    (before 1910, not including 1910) together with winners of a 'Literature' prize in a 
    later year (after 2004, including 2004) */
  SELECT yr, subject, winner
  FROM nobel
  WHERE subject = 'Medicine' AND yr < 1910
  OR subject = 'literature' AND yr >= 2004;

  -- 3.11 Umlaut
  /* Find all details of the prize won by PETER GRÜNBERG */
  SELECT *
  FROM nobel
  WHERE winner LIKE 'peter gr%'

  -- 3.12 Apostrophe
  /* Find all details of the prize won by EUGENE O'NEILL */
  SELECT *
  FROM nobel
  WHERE winner = 'Eugene O''neill'

  -- 3.13 Knights of the realm
  /* List the winners, year and subject where the winner starts with Sir. 
  Show the the most recent first, then by name order. */
  SELECT winner, yr, subject
  FROM nobel
  WHERE winner LIKE 'sir%'
  ORDER BY yr DESC

  -- 3.14 Chemistry and Physics last
  /* Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last. */

  SELECT winner, subject
  FROM nobel
  WHERE yr=1984
  ORDER BY subject IN ('Chemistry', 'physics'),subject, winner

-- 4 SELECT within SELECT 
  -- 4.1 Bigger than Russia
  /* List each country name where the population is larger than that of 'Russia'. */

  SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

  -- 4.2 Richer than UK
  /* Show the countries in Europe with a per capita GDP greater than 'United Kingdom'. */
  SELECT name
  FROM world
  WHERE continent = 'Europe' AND GDP/population > 
        (SELECT gdp/population
         FROM world
         WHERE name = 'united Kingdom');

  -- 4.3 Neightbours of Argentina and Austalia
  /* List the name and continent of countries in the continents containing either 
    Argentina or Australia. Order by name of the country.*/

  SELECT name, continent
  FROM world
  WHERE continent IN 
     (SELECT continent FROM world
      WHERE name IN ('argentina', 'Australia'))
  ORDER BY name ;

  -- 4.4 Between Canada and Poland
  /* Which country has a population that is more than Canada but less than Poland? 
  Show the name and the population. */

  SELECT name, population
  FROM  world
  WHERE population > (SELECT population FROM world 
           WHERE name = 'canada')
  AND population < (SELECT population FROM world
           WHERE name = 'poland');

  -- 4.5 Percentages of Germany
  /* Show the name and the population of each country in Europe. 
  Show the population as a percentage of the population of Germany. */

  SELECT name, 
    CONCAT(ROUND(population/
          (SELECT population 
          FROM world
          WHERE name = 'germany') * 100), '%')
  FROM world
  WHERE continent = 'Europe';

  -- 4.6 Bigger than every country in Europe
  /* Which countries have a GDP greater than every country in Europe? 
  [Give the name only.] (Some countries may have NULL gdp values) */

  SELECT name
  FROM world
  WHERE gdp > ALL(SELECT gdp 
            FROM world
            WHERE continent = 'Europe' AND gdp >0)

  -- 4.7 Largest in each continent
  /* Find the largest country (by area) in each continent, show the continent, the name and the area:  */

  SELECT continent, name, AREA FROM world x
  WHERE area >= ALL (SELECT area FROM world y
                WHERE y.continent=x.continent
                AND area>0)

  -- 4.8 First country of each continent (alphabetically)
  /*List each continent and the name of the country that comes first alphabetically.*/

  SELECT continent, name
  FROM world a
  WHERE name <= ALL(SELECT name FROM world b
               WHERE a.continent = b.continent)

  -- 4.9 
  /* Find the continents where all countries have a population <= 25000000. 
  Then find the names of the countries 
  associated with these continents. Show name, continent and population. */

  SELECT name,continent, population
  FROM world a
  WHERE 25000000 > ALL(SELECT population
                  FROM world b
                  WHERE a.continent = b.continent)

  -- 4.10 
  /* Some countries have populations more than three times that of any of their 
  neighbours (in the same continent). Give the countries and continents.*/
  SELECT a.name, a.continent
  FROM world a
  WHERE a.population > ALL(SELECT b.population * 3
                    FROM world b
                    WHERE a.continent = b.continent
                    AND a.name != b.name )

-- 5 SUM AND COUNT
  -- 5.1 TOTAL WORLD POPULATION
  /* Show the total population of the world. */
  SELECT SUM(population)
  FROM world;

  -- 5.2 List of Continents
  /* List all the continents - just once each.  */
  SELECT DISTINCT(continent)
  FROM world;

  -- 5.3 GDP of Africa
  /* Give the total GDP of Africa */
  SELECT SUM(gdp)
  FROM world
  WHERE continent = 'africa';

  -- 5.4 Count the big countries
  /* How many countries have an area of at least 1000000 */
  SELECT COUNT(name)
  FROM world
  WHERE area > 1000000;

  -- 5.5 Baltic States population
  /* What is the total population of ('Estonia', 'Latvia', 'Lithuania') */
  SELECT SUM(population)
  FROM world
  WHERE name IN ('Estonia', 'Latvia', 'Lithuania'); 

  /* Using Using GROUP BY and HAVING */

  -- 5.6 Counting the countries of each continent
  /* For each continent show the continent and number of countries. */

  SELECT continent, COUNT(name)
  FROM world
  GROUP BY continent;

  -- 5.7 Counting big countries in each continent
  /* For each continent show the continent and number of 
  countries with populations of at least 10 million. */

  SELECT continent, COUNT(name)
  FROM world
  WHERE population > 10000000
  GROUP BY continent

  -- 5.8 Counting big continents
  /* List the continents that have a total population of at least 100 million. */

  SELECT continent
  FROM world
  GROUP BY continent
  HAVING SUM(population) >= 100000000

-- 6 JOIN
  -- 6.1
  /* Modify it to show the matchid and player name for all goals 
  scored by Germany. To identify German players, check for: teamid = 'GER' */

  SELECT matchid, player FROM goal 
  WHERE teamID = 'GER';

  -- 6.2 
  /* Show id, stadium, team1, team2 for just game 1012 */

  SELECT id,stadium,team1,team2
  FROM game
  WHERE id= 1012;

  -- 6.3
  /* Modify it to show the player, teamid, 
  stadium and mdate for every German goal.*/

  SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'ger';

  -- 6.4
  /* Show the team1, team2 and player for every 
  goal scored by a player called Mario player LIKE 'Mario%' */

  SELECT team1, team2, player
  FROM game JOIN goal ON (id= matchid)
  WHERE player LIKE 'mario%';

  -- 6.5
  /* Show player, teamid, coach, gtime for all goals
   scored in the first 10 minutes gtime<=10 */

  SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid = id)
  WHERE gtime<=10

  -- 6.6
  /* List the dates of the matches and the name of the team in which 
  'Fernando Santos' was the team1 coach. */

  SELECT mdate, teamname
  FROM game JOIN eteam ON (team1 = eteam.id)
  WHERE coach = 'fernando santos';

  -- 6.7
  /* List the player for every goal scored in a game where the 
  stadium was 'National Stadium, Warsaw'*/

  SELECT player 
  FROM goal JOIN game ON (goal.matchid = game.id)
  WHERE stadium = 'National Stadium, Warsaw';

  -- 6.8
  /* Instead show the name of all players who scored a goal against Germany. */

  SELECT DISTINCT(player)
  FROM game JOIN goal ON matchid = id 
    WHERE goal.teamid != 'GER'
    AND (game.team1 = 'GER' OR game.team2 = 'GER');

  -- 6.9 
  /* Show teamname and the total number of goals scored. */
  
  SELECT teamname, COUNT(teamid) AS Number_of_Goals
  FROM eteam JOIN goal ON id=teamid
  GROUP BY teamname;

  -- 6.10
  /* Show the stadium and the number of goals scored in each stadium. */
  
  SELECT stadium, COUNT(matchid)
  FROM game
  JOIN goal ON (matchid = game.id)
  GROUP BY Stadium

  -- 6.11 
  /* For every match involving 'POL', show the matchid, 
  date and the number of goals scored. */

  SELECT DISTINCT(matchid), mdate, COUNT(matchid) AS Goals
  FROM game JOIN goal ON (matchid = id) 
  WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY matchid, mdate

  -- 6.12
  /* For every match where 'GER' scored, show matchid, 
  match date and the number of goals scored by 'GER' */

  SELECT DISTINCT(matchid), mdate, COUNT(matchid)
  FROM game JOIN goal ON (matchid = id)
  WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER'
  GROUP BY matchid, mdate

  -- 6.12 FROM (https://github.com/jisaw/sqlzoo-solutions/blob/master/join.sql)

  /* List every match with the goals scored by each team as shown. This will use "CASE WHEN" 
  which has not been explained in any previous exercises.
  mdate	team1	score1	team2	score2
  1 July 2012	ESP	4	ITA	0
  10 June 2012	ESP	1	ITA	1
  10 June 2012	IRL	1	CRO	3
  ...
  Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0.
  You could SUM this column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2.
  */

  SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 FROM
    game LEFT JOIN goal ON (id = matchid)
    GROUP BY mdate,team1,team2
    ORDER BY mdate, matchid, team1, team2

-- 7 More JOIN Operations
  -- 7.1 1962 movies
  /* List the films where the yr is 1962 [Show id, title] */
  SELECT id, title
  FROM movie
  WHERE yr=1962;

  -- 7.2 When was Citizen Kane released?
  /* Give year of 'Citizen Kane'. */
  SELECT yr
  FROM movie
  WHERE title = 'Citizen Kane';

  -- 7.3 Star Trek movies
  /* List all of the Star Trek movies, include the id, title and yr 
  (all of these movies include the words Star Trek in the title). Order results by year. */

  SELECT id, title, yr
  FROM movie
  WHERE title LIKE 'star trek%'
  ORDER BY yr;

  -- 7.4 id for actor Glenn Close
  /* What id number does the actor 'Glenn Close' have?  */

  SELECT ID
  FROM actor
  WHERE name = 'Glenn Close'

  -- 7.5 id for Casablanca
  /* What is the id of the film 'Casablanca'  */

  SELECT id
  FROM movie
  WHERE title = 'Casablanca'

  -- 7.6 Cast list for Casablanca
  /* Obtain the cast list for 'Casablanca'.
  what is a cast list?

  Use movieid=11768, (or whatever value you got from the previous question)  */
  SELECT name
  FROM actor JOIN casting ON (casting.actorid = actor.id)
  WHERE movieid = 11768;

  -- 7.7 Alien Cast List
  /* Obtain the cast list for the film 'Alien' */

  SELECT name
  FROM actor JOIN casting ON (actorid = actor.id)
  WHERE movieid = (SELECT movie.id
                   FROM movie 
                   WHERE title = 'Alien')

  -- 7.8 Harrison Ford movies
  /* List the films in which 'Harrison Ford' has appeared  */

  SELECT title
  FROM movie JOIN casting ON (movie.id = casting.movieid)
  WHERE actorid = (SELECT actor.id FROM actor
                 WHERE actor.name = 'harrison ford')

  -- 7.9 Harrison Ford as a supporting actor
  /* List the films where 'Harrison Ford' has appeared - but not in the starring role.
   [Note: the ord field of casting gives the position of the actor. 
   If ord=1 then this actor is in the starring role]  */

  SELECT title
  FROM movie JOIN casting ON (movie.id = casting.movieid)
  WHERE actorid = (SELECT id FROM actor
                WHERE name = 'Harrison Ford')
  AND ord!=1

  -- 7.10 Lead actors in 1962 movies
  /* List the films together with the leading star for all 1962 films.  */
  SELECT title, name
  FROM movie 
  JOIN casting 
  ON casting.movieid = movie.id
  JOIN actor
  ON casting.actorid = actor.id
  WHERE movie.yr = 1962
  AND ord = 1;

  -- 7.11 Busy years for Rock Hudson
  /* Which were the busiest years for 'Rock Hudson', show the year and the number of 
  movies he made each year for any year in which he made more than 2 movies. */

  SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
  WHERE name='Rock Hudson'
  GROUP BY yr
  HAVING COUNT(title) > 2;

  -- 7.12 Lead actor in Julie Andrews movies
  /* List the film title and the leading actor for all of the films 'Julie Andrews' played in. */

  SELECT title, name
  FROM movie
     JOIN casting ON (movie.id = casting.movieid AND ord = 1)
     JOIN actor ON (actor.id = actorid)
  WHERE movie.id IN (SELECT movieid FROM casting
                  WHERE actorid IN 
                  (SELECT actor.id FROM actor 
                    WHERE name = 'julie Andrews'))

  -- 7.13 Actors with 15 leading roles
  /* Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles. */

  SELECT name
  FROM actor JOIN casting ON (actor.id = actorid AND ord = 1)
  GROUP BY name
  HAVING COUNT(actorid) >=15

  -- 7.14 
  /* List the films released in the year 1978 ordered by the number of actors in the cast, then by title. */

  SELECT title, COUNT(actorid)
  FROM movie JOIN casting ON (movie.id = movieid)
  WHERE yr = 1978
  GROUP BY title
  ORDER BY COUNT(actorid) DESC, title

  -- 7.15 
  /* List all the people who have worked with 'Art Garfunkel'. */

  SELECT DISTINCT(name)
  FROM actor JOIN casting ON (actor.id = actorid)
  WHERE movieid IN (SELECT movieid FROM casting
                     WHERE actorid IN (SELECT actor.id FROM actor 
                                        WHERE name = 'Art Garfunkel'))
  AND actor.name != 'Art Garfunkel';

-- 8 USING NULL

  -- 8.1 
    /* List the teachers who have NULL for their department. */

    SELECT name FROM teacher
    WHERE dept IS NULL;

  -- 8.2
    /* Note the INNER JOIN misses the teachers with no department and 
    the departments with no teacher. */

    SELECT teacher.name, dept.name
    FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id);


  -- 8.3
    /* Use a different JOIN so that all teachers are listed. */

    SELECT teacher.name, dept.name
    FROM teacher LEFT JOIN dept
            ON (teacher.dept=dept.id);

  -- 8.4
    /* Use a different JOIN so that all departments are listed. */

    SELECT teacher.name, dept.name
    FROM teacher RIGHT JOIN dept 
           ON (teacher.dept= dept.id);

  -- 8.5 
    /* Show teacher name and mobile number or '07986 444 2266' */
    SELECT name, COALESCE (mobile, '07986 444 2266') AS mobile
    FROM teacher;

  -- 8.6
    /* Use the COALESCE function and a LEFT JOIN to print the teacher name 
    and department name. Use the string 'None' where there is no department. */
    
    SELECT teacher.name, COALESCE(dept.name, 'None') AS dept
    FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id);

  -- 8.7 
    /* Use COUNT to show the number of teachers and the number of mobile phones.  */

    SELECT COUNT(id) AS No_Of_Teacher, COUNT(mobile) AS mobile
    FROM teacher

  -- 8.8
    /* Use COUNT and GROUP BY dept.name to show each department and the number of staff. 
    Use a RIGHT JOIN to ensure that the Engineering department is listed.  */

    SELECT dept.name, COUNT(teacher.dept)
    FROM teacher
    RIGHT JOIN dept ON (teacher.dept = dept.id)
    GROUP BY dept.name

  -- 8.9
    /* Use CASE to show the name of each teacher followed by 'Sci' if the 
    teacher is in dept 1 or 2 and 'Art' otherwise. */

    SELECT name,
       CASE WHEN dept = 1 OR dept = 2
            THEN 'Sci'
            ELSE 'Art'
       END
    FROM teacher

  -- 8.10
    /* Use CASE to show the name of each teacher followed by 'Sci' if the 
    teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise. */

    SELECT name,
       CASE WHEN dept = 1 OR dept = 2
            THEN 'Sci'
            WHEN dept = 3
            THEN 'Art'
            ELSE 'None'
       END
    FROM teacher