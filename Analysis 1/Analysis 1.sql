
-- ____analysis 1____

-- Query- compute the number (count) of movies Morgan freeman have participated in by year during his career 
-- where The number of rows gives the number of years they have been acting.
-- Morgan freeman unique ID- 'nm0000151'

set echo on;
spool A_P1.txt
SELECT 
    NB.PRIMARYNAME,TB.STARTYEAR,
    COUNT(*) AS YEAR_COUNT
FROM sharmac.TITLE_PRINCIPALS TP
INNER JOIN  sharmac.TITLE_BASICS TB
    ON TP.TCONST = TB.TCONST
INNER JOIN  sharmac.NAME_BASICS NB
    ON TP.NCONST = NB.NCONST
WHERE ((TP.NCONST = 'nm0000151') AND (tb.titletype='movie') AND (tb.startyear!='\N'))
GROUP BY NB.PRIMARYNAME,TB.STARTYEAR
ORDER BY TB.STARTYEAR ASC;


-- Query- compute the number (count) of movies Mila kunis have participated in by year during her career 
-- where The number of rows gives the number of years they have been acting.
-- (Mila kunis unique ID- 'nm0005109')

SELECT 
    NB.PRIMARYNAME,TB.STARTYEAR,
    COUNT(*) AS YEAR_COUNT
FROM sharmac.TITLE_PRINCIPALS TP
INNER JOIN  sharmac.TITLE_BASICS TB
    ON TP.TCONST = TB.TCONST
INNER JOIN  sharmac.NAME_BASICS NB
    ON TP.NCONST = NB.NCONST
WHERE ((TP.NCONST = 'nm0005109') AND (tb.titletype='movie')AND (tb.startyear!='\N'))
GROUP BY NB.PRIMARYNAME,TB.STARTYEAR
ORDER BY TB.STARTYEAR ASC;


-- Query- compute the number (count) of movies shah rukh khan have participated in by year during his career 
-- where The number of rows gives the number of years they have been acting.
-- (shah rukh khan unique ID- 'nm0451321')

SELECT 
    NB.PRIMARYNAME,TB.STARTYEAR,
    COUNT(*) AS YEAR_COUNT
FROM sharmac.TITLE_PRINCIPALS TP
INNER JOIN  sharmac.TITLE_BASICS TB
    ON TP.TCONST = TB.TCONST
INNER JOIN  sharmac.NAME_BASICS NB
    ON TP.NCONST = NB.NCONST
WHERE ((TP.NCONST = 'nm0451321') AND (tb.titletype='movie')AND (tb.startyear!='\N'))
GROUP BY NB.PRIMARYNAME,TB.STARTYEAR
ORDER BY TB.STARTYEAR ASC;


-- Query- compute the number (count) of movies Anushka Shetty have participated in by year during her career 
-- where The number of rows gives the number of years they have been acting.
-- (Anushka Shetty unique ID- 'nm2011932')

SELECT 
    NB.PRIMARYNAME,TB.STARTYEAR,
    COUNT(*) AS YEAR_COUNT
FROM sharmac.TITLE_PRINCIPALS TP
INNER JOIN  sharmac.TITLE_BASICS TB
    ON TP.TCONST = TB.TCONST
INNER JOIN  sharmac.NAME_BASICS NB
    ON TP.NCONST = NB.NCONST
WHERE ((TP.NCONST = 'nm2011932') AND (tb.titletype='movie')AND (tb.startyear!='\N'))
GROUP BY NB.PRIMARYNAME,TB.STARTYEAR
ORDER BY TB.STARTYEAR ASC;

--end of analysis 1

set echo off;
spool off;