

--Output to file - make sure you delete the " in the text file
COPY (
  SELECT '[' || string_agg(sqt.xy,',') || ']' AS xys FROM (
    SELECT '[' || trim(to_char(ST_Y(ST_Centroid(geom)), '99D9999')) || ',' || trim(to_char(ST_X(ST_Centroid(geom)), '999D9999')) || ',' || population::text || ']' AS xy FROM mb_2011_aust WHERE geom IS NOT NULL
  ) AS sqt
) TO 'C:\minus34\GitHub\LeafletHeatTest\mbheat\mbpoints.txt' CSV;


-- COPY (
--   SELECT string_agg(sqt.xy,'|') AS xys FROM (
--     SELECT trim(to_char(ST_Y(ST_Centroid(geom)), '99D9999')) || ',' || trim(to_char(ST_X(ST_Centroid(geom)), '999D9999')) || ',' || population::text AS xy FROM mb_2011_aust WHERE geom IS NOT NULL
--   ) AS sqt
-- ) TO 'C:\minus34\GitHub\LeafletHeatTest\mbheat\mbpoints2.txt' CSV;





select max(population) from mb_2011_aust WHERE geom IS NOT NULL; 


SELECT '[' || trim(to_char(ST_Y(ST_Centroid(geom)), '99D9999')) || ',' || trim(to_char(ST_X(ST_Centroid(geom)), '999D9999')) || ',' || population::text || ']' AS xy FROM mb_2011_aust WHERE geom IS NOT NULL
ORDER BY population desc limit 100;