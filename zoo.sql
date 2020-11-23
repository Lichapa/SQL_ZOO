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
  WHERE teamID = 'GER'

  -- 6.2 
  /* Show id, stadium, team1, team2 for just game 1012 */

  SELECT id,stadium,team1,team2
  FROM game
  WHERE id= 1012

  -- 6.3
  /* Modify it to show the player, teamid, 
  stadium and mdate for every German goal.*/

  SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'ger'

  -- 6.4
  /* Show the team1, team2 and player for every 
  goal scored by a player called Mario player LIKE 'Mario%' */

  SELECT team1, team2, player
  FROM game JOIN goal ON (id= matchid)
  WHERE player LIKE 'mario%'

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
  WHERE coach = 'fernando santos'