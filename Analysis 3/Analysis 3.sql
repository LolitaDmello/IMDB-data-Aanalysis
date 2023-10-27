--Analysis 3
--For Actor
--Query: list the Actors name who have acted in movies with genres (Action, Thriller) between year 1926 and 1930,
-- list the year and count of such movies for each year.

set echo on;
spool analysis3.txt

SELECT 
    TB.STARTYEAR as Year,NB.PRIMARYNAME as ActorName,
    COUNT(*) AS Movie_Count
FROM sharmac.TITLE_PRINCIPALS TP
INNER JOIN  sharmac.TITLE_BASICS TB
    ON TP.TCONST = TB.TCONST
INNER JOIN  sharmac.NAME_BASICS NB
    ON TP.NCONST = NB.NCONST
WHERE (TB.GENRES like '%Action%Thriller%' and TB.startyear between '1926' and '1930' 
AND TB.titletype='movie' AND TP.category LIKE '%actor%' 
AND NOT(TB.startyear like '%\N'))
GROUP BY NB.PRIMARYNAME,TB.STARTYEAR
ORDER BY TB.STARTYEAR ASC;

--For Actress
--Query: list the Actress name who have acted in movies with genres (Action, Thriller) between year 1926 and 1930,
-- list the year and count of such movies for each year.

SELECT 
    TB.STARTYEAR as Year,NB.PRIMARYNAME as ActressName,
    COUNT(*) AS Movie_Count
FROM sharmac.TITLE_PRINCIPALS TP
INNER JOIN  sharmac.TITLE_BASICS TB
    ON TP.TCONST = TB.TCONST
INNER JOIN  sharmac.NAME_BASICS NB
    ON TP.NCONST = NB.NCONST
WHERE (TB.GENRES like '%Action%Thriller%' and TB.startyear between '1926' and '1930' 
AND TB.titletype='movie' AND TP.category LIKE '%actress%' AND 
NOT(TB.startyear like '%\N'))
GROUP BY NB.PRIMARYNAME,TB.STARTYEAR
ORDER BY TB.STARTYEAR ASC;


set echo off;
spool off;