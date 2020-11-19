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