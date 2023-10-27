set echo on;
spool cor.txt
--analysis 1 
SELECT 
    NB.PRIMARYNAME,
    tb.primarytitle,
    TB.STARTYEAR
FROM sharmac.TITLE_PRINCIPALS TP
INNER JOIN  sharmac.TITLE_BASICS TB
    ON TP.TCONST = TB.TCONST
INNER JOIN  sharmac.NAME_BASICS NB
    ON TP.NCONST = NB.NCONST
WHERE ((TP.NCONST = 'nm0000151') AND (tb.titletype='movie') AND (tb.startyear!='\N'))
ORDER BY TB.STARTYEAR ASC;
-- Anlysis 2 

SELECT  
NB.PRIMARYNAME,
    tb.primarytitle
FROM sharmac.TITLE_PRINCIPALS  TP
INNER JOIN sharmac.TITLE_BASICS TB 
    ON TP.TCONST = tb.tconst
INNER JOIN  sharmac.NAME_BASICS NB
    ON NB.NCONST = tp.nconst
WHERE (TB.STARTYEAR ='1926') AND (tb.titletype='movie') AND (tp.category = 'actor') AND (NB.PRIMARYNAME='Taisuke Matsumoto');


-- Analysis 3 
SELECT 
    TB.STARTYEAR as Year,NB.PRIMARYNAME as ActorName,
    COUNT(*) AS Movie_Count
FROM sharmac.TITLE_PRINCIPALS TP
INNER JOIN  sharmac.TITLE_BASICS TB
    ON TP.TCONST = TB.TCONST
INNER JOIN  sharmac.NAME_BASICS NB
    ON TP.NCONST = NB.NCONST
WHERE (TB.GENRES like '%Action%Thriller%' 
AND TB.titletype='movie' AND TP.category LIKE '%actor%' 
AND NOT(TB.startyear like '%\N'))
GROUP BY NB.PRIMARYNAME,TB.STARTYEAR
ORDER BY TB.STARTYEAR ASC
FETCH FIRST 10 ROWS ONLY;

set echo off;
spool off;
