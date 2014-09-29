
DROP TABLE IF EXISTS public.mb_2011_aust;

CREATE TABLE public.mb_2011_aust
(
  gid serial NOT NULL ,
  mb_code11 character varying(11) NOT NULL,
  mb_cat11 character varying(50),
  sa1_main11 character varying(11),
  sa1_7dig11 character varying(7),
  sa2_main11 character varying(9),
  sa2_5dig11 character varying(5),
  sa2_name11 character varying(50),
  sa3_code11 character varying(5),
  sa3_name11 character varying(50),
  sa4_code11 character varying(3),
  sa4_name11 character varying(50),
  gcc_code11 character varying(5),
  gcc_name11 character varying(50),
  ste_code11 character varying(1),
  ste_name11 character varying(50),
  albers_sqm numeric,
  geom geometry(MultiPolygon,4283),
  CONSTRAINT mb_2011_aust_pkey PRIMARY KEY (mb_code11)
)
WITH (OIDS=FALSE);
ALTER TABLE public.mb_2011_aust OWNER TO postgres;

update public.mb_2011_act set geom = ST_SetSRID(geom, 4283);
update public.mb_2011_nsw set geom = ST_SetSRID(geom, 4283);
update public.mb_2011_nt set geom = ST_SetSRID(geom, 4283);
update public.mb_2011_ot set geom = ST_SetSRID(geom, 4283);
update public.mb_2011_qld set geom = ST_SetSRID(geom, 4283);
update public.mb_2011_sa set geom = ST_SetSRID(geom, 4283);
update public.mb_2011_tas set geom = ST_SetSRID(geom, 4283);
update public.mb_2011_vic set geom = ST_SetSRID(geom, 4283);
update public.mb_2011_wa set geom = ST_SetSRID(geom, 4283);

--delete from public.mb_2011_aust;

INSERT INTO public.mb_2011_aust(mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom)
select mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom from public.mb_2011_act;

INSERT INTO public.mb_2011_aust(mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom)
select mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom from public.mb_2011_nsw;

INSERT INTO public.mb_2011_aust(mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom)
select mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom from public.mb_2011_nt;

INSERT INTO public.mb_2011_aust(mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom)
select mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom from public.mb_2011_ot;

INSERT INTO public.mb_2011_aust(mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom)
select mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom from public.mb_2011_qld;

INSERT INTO public.mb_2011_aust(mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom)
select mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom from public.mb_2011_sa;

INSERT INTO public.mb_2011_aust(mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom)
select mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom from public.mb_2011_tas;

INSERT INTO public.mb_2011_aust(mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom)
select mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom from public.mb_2011_vic;

INSERT INTO public.mb_2011_aust(mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom)
select mb_code11, mb_cat11, sa1_main11, sa1_7dig11, sa2_main11, sa2_5dig11, sa2_name11, sa3_code11, sa3_name11, sa4_code11, sa4_name11, gcc_code11, gcc_name11, ste_code11, ste_name11, albers_sqm, geom from public.mb_2011_wa;

CREATE INDEX mb_2011_aust_geom_gist ON public.mb_2011_aust USING gist (geom);
ALTER TABLE public.mb_2011_aust CLUSTER ON mb_2011_aust_geom_gist;

VACUUM ANALYSE public.mb_2011_aust;

select Count(*) from public.mb_2011_aust;