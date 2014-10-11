
--Output to file - make sure you delete the " in the text file -- 14s
COPY (
  SELECT '[' || string_agg(sqt.xy,',') || ']' AS xys FROM (
    SELECT '[' || trim(to_char(ST_Y(ST_Centroid(geom)), '99D9999')) || ',' || trim(to_char(ST_X(ST_Centroid(geom)), '999D9999')) || ',' || population::text || ']' AS xy FROM mb_2011_aust WHERE geom IS NOT NULL
  ) AS sqt
) TO 'C:\minus34\GitHub\LeafletHeatTest\sizzler\points.txt' CSV;

--This code not used
-- ALTER TABLE mb_2011_aust ADD COLUMN area_sq_km double precision;
-- ALTER TABLE mb_2011_aust ADD COLUMN pop_density integer;
-- 
-- --Update Area
-- UPDATE mb_2011_aust SET area_sq_km = ST_Area(ST_Transform(geom, 3577)) / 1000000.0 WHERE geom IS NOT NULL; -- 119099 ms
-- --Update population density
-- UPDATE mb_2011_aust SET pop_density = (population::float / area_sq_km)::int WHERE geom IS NOT NULL; -- 74879  ms
-- 
-- select * from mb_2011_aust WHERE geom IS NOT NULL ORDER BY pop_density DESC; -- 559225.984939983


