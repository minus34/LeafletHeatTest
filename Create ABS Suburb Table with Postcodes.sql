
--Create suburbs table with postcode added

DROP TABLE IF EXISTS public.ssc_2011_aust_poa;

CREATE TABLE public.ssc_2011_aust_poa
(
  gid serial,
  ssc_name character varying(45)  NOT NULL,
  postcode character(4) NULL,
  state character varying(3) NOT NULL,
  area_sqkm numeric NOT NULL,
  geom geometry(MULTIPOLYGON, 4283, 2) NOT NULL
) WITH (OIDS=FALSE);
ALTER TABLE public.ssc_2011_aust_poa OWNER TO postgres;

INSERT INTO public.ssc_2011_aust_poa (ssc_name, state, area_sqkm, geom)
SELECT ssc_name
      ,CASE state_code::int
         WHEN 1 THEN 'NSW'
         WHEN 2 THEN 'VIC'
         WHEN 3 THEN 'QLD'
         WHEN 4 THEN 'SA'
         WHEN 5 THEN 'WA'
         WHEN 6 THEN 'TAS'
         WHEN 7 THEN 'NT'
         WHEN 8 THEN 'ACT'
         WHEN 9 THEN 'OT'
       END
      ,area_sqkm
      ,ST_Transform(geom, 4283)
  FROM public.ssc_2011_aust
  WHERE geom IS NOT NULL;


UPDATE public.ssc_2011_aust_poa
  SET ssc_name = left(ssc_name, position('(' in ssc_name) - 2)
  WHERE position('(' in ssc_name) > 0;

CREATE INDEX ssc_2011_aust_poa_geom_gist ON public.ssc_2011_aust_poa USING gist (geom);
ALTER TABLE public.ssc_2011_aust_poa CLUSTER ON ssc_2011_aust_poa_geom_gist;
ANALYSE ssc_2011_aust_poa;


--Update postcode
UPDATE public.ssc_2011_aust_poa AS ssc
  SET postcode = left(poa.poa_name,4)
  FROM public.poa_2011_aust AS poa
  WHERE ST_Within(ST_Centroid(ssc.geom), poa.geom)
  AND poa.poa_code <> 'POA9191';

--Output to javascript file (will need to be edited to get rid of extra quotations)
COPY (
  SELECT 'var subs=[' || string_agg(sqt.jas, ',') || ']' FROM (
    SELECT '{label:"' || replace(ssc_name || ' ' || state || ' ' || COALESCE(postcode, ''), '  ', ' ') || '",value:' ||
           '[' || ST_XMin(ST_Envelope(geom))::text || ',' || ST_YMin(ST_Envelope(geom))::text || ',' || ST_XMax(ST_Envelope(geom))::text || ',' || ST_YMax(ST_Envelope(geom))::text || ']}' as jas
      FROM public.ssc_2011_aust_poa ORDER BY replace(ssc_name || ' ' || state || ' ' || COALESCE(postcode, ''), '  ', ' ')
  ) as sqt
) TO 'C:\minus34\GitHub\LeafletHeatTest\sizzler\suburbs2011.js' CSV;

