CREATE TABLE finals AS
  SELECT "RSF" AS hall, "61A" as course UNION
  SELECT "Wheeler"    , "61A"           UNION
  SELECT "Pimentel"   , "61A"           UNION
  SELECT "Li Ka Shing", "61A"           UNION
  SELECT "Stanley"    , "61A"           UNION
  SELECT "RSF"        , "61B"           UNION
  SELECT "Wheeler"    , "61B"           UNION
  SELECT "Morgan"     , "61B"           UNION
  SELECT "Wheeler"    , "61C"           UNION
  SELECT "Pimentel"   , "61C"           UNION
  SELECT "Soda 310"   , "61C"           UNION
  SELECT "Soda 306"   , "10"            UNION
  SELECT "RSF"        , "70";

CREATE TABLE sizes AS
  SELECT "RSF" AS room, 900 as seats    UNION
  SELECT "Wheeler"    , 700             UNION
  SELECT "Pimentel"   , 500             UNION
  SELECT "Li Ka Shing", 300             UNION
  SELECT "Stanley"    , 300             UNION
  SELECT "Morgan"     , 100             UNION
  SELECT "Soda 306"   , 80              UNION
  SELECT "Soda 310"   , 40              UNION
  SELECT "Soda 320"   , 30;

CREATE TABLE big AS
  SELECT course 
  FROM Finals, Sizes
  WHERE room = hall
  GROUP BY course
  HAVING sum(seats) >= 1000;

CREATE TABLE remaining AS
  SELECT course, SUM(seats) - MAX(seats)
  FROM Finals, Sizes
  WHERE room = hall
  GROUP BY course;

CREATE TABLE sharing AS
  SELECT A.course, COUNT(DISTINCT A.hall) AS shared
  FROM Finals as A, Finals as B
  WHERE A.hall = B.hall and A.course != B.course
  GROUP BY A.course;

CREATE TABLE pairs AS
  SELECT A.room||" and "||B.room||" together have "||(A.seats + B.seats) || " seats" as sentence
  FROM Sizes as A ,Sizes as B
  WHERE A.room < B.room
  AND A.seats + B.seats >=  1000
  ORDER BY (A.seats + B.seats) desc, A.room;

