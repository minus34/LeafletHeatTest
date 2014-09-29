
select max(population) from mb_2011_aust WHERE geom IS NOT NULL; 


--Select bdy centroid coords and format them as JSON objects [y, x, id]
SELECT '[' || trim(to_char(ST_Y(ST_Centroid(geom)), '99D9999')) || ',' || trim(to_char(ST_X(ST_Centroid(geom)), '999D9999')) || ',0' || trim(to_char((population::float/2339.0), '9D999')) || '],' FROM mb_2011_aust WHERE geom IS NOT NULL AND population > 0;
