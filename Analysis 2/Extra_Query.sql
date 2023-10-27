set echo on;
spool Addi.txt


--for actors 

SELECT  NB.NCONST,
        NB.PRIMARYNAME,
        TB.STARTYEAR,COUNT(*) AS MOVIES_COUNT
FROM sharmac.TITLE_PRINCIPALS  TP
INNER JOIN sharmac.TITLE_BASICS TB 
    ON TP.TCONST = tb.tconst
INNER JOIN  sharmac.NAME_BASICS NB
    ON NB.NCONST = tp.nconst
WHERE (TB.STARTYEAR BETWEEN '1926' AND '1930' ) AND (tb.titletype='movie') AND (tp.category = 'actor') 
GROUP BY NB.NCONST,NB.PRIMARYNAME , TB.STARTYEAR
HAVING COUNT(*)=3
ORDER BY COUNT(*) ASC,TB.STARTYEAR ASC,NB.PRIMARYNAME ASC;

--For  actress

SELECT  NB.NCONST,
        NB.PRIMARYNAME,
        TB.STARTYEAR,COUNT(*) AS MOVIES_COUNT
FROM sharmac.TITLE_PRINCIPALS  TP
INNER JOIN sharmac.TITLE_BASICS TB 
    ON TP.TCONST = tb.tconst
INNER JOIN  sharmac.NAME_BASICS NB
    ON NB.NCONST = tp.nconst
WHERE (TB.STARTYEAR BETWEEN '1926' AND '1930') AND (tb.titletype='movie') AND (tp.category = 'actress') 
GROUP BY NB.NCONST,NB.PRIMARYNAME , TB.STARTYEAR
HAVING COUNT(*)=3
ORDER BY COUNT(*) ASC,TB.STARTYEAR ASC,NB.PRIMARYNAME Asc;




set echo off;
spool off;