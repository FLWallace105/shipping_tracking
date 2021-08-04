--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.20
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: ellie_dev_team
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO ellie_dev_team;

--
-- Name: container_milestones; Type: TABLE; Schema: public; Owner: ellie_dev_team
--

CREATE TABLE public.container_milestones (
    id bigint NOT NULL,
    container_id character varying,
    milestone_timestamp timestamp without time zone,
    location_name character varying,
    location_city character varying,
    location_country character varying,
    location_unlocode character varying,
    location_facility character varying,
    description character varying,
    raw_descripition character varying,
    vessel_imo character varying,
    vessel_mmsi character varying,
    voyage character varying,
    mode character varying,
    vessel character varying,
    latitude character varying,
    longitude character varying,
    estimated_time_arrival boolean DEFAULT false,
    planned boolean DEFAULT false
);


ALTER TABLE public.container_milestones OWNER TO ellie_dev_team;

--
-- Name: container_milestones_id_seq; Type: SEQUENCE; Schema: public; Owner: ellie_dev_team
--

CREATE SEQUENCE public.container_milestones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.container_milestones_id_seq OWNER TO ellie_dev_team;

--
-- Name: container_milestones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ellie_dev_team
--

ALTER SEQUENCE public.container_milestones_id_seq OWNED BY public.container_milestones.id;


--
-- Name: container_trackings; Type: TABLE; Schema: public; Owner: ellie_dev_team
--

CREATE TABLE public.container_trackings (
    id bigint NOT NULL,
    container_id character varying,
    shipping_company character varying,
    vizion_reference_id character varying,
    vision_organization_id character varying,
    bill_of_lading character varying,
    latest_status jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    finished_journey boolean DEFAULT false,
    uploaded boolean DEFAULT false
);


ALTER TABLE public.container_trackings OWNER TO ellie_dev_team;

--
-- Name: container_trackings_id_seq; Type: SEQUENCE; Schema: public; Owner: ellie_dev_team
--

CREATE SEQUENCE public.container_trackings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.container_trackings_id_seq OWNER TO ellie_dev_team;

--
-- Name: container_trackings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ellie_dev_team
--

ALTER SEQUENCE public.container_trackings_id_seq OWNED BY public.container_trackings.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ellie_dev_team
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO ellie_dev_team;

--
-- Name: shipping_lines_carrier_codes; Type: TABLE; Schema: public; Owner: ellie_dev_team
--

CREATE TABLE public.shipping_lines_carrier_codes (
    id bigint NOT NULL,
    carrier_name character varying,
    carrier_id bigint,
    carrier_code character varying
);


ALTER TABLE public.shipping_lines_carrier_codes OWNER TO ellie_dev_team;

--
-- Name: shipping_lines_carrier_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: ellie_dev_team
--

CREATE SEQUENCE public.shipping_lines_carrier_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_lines_carrier_codes_id_seq OWNER TO ellie_dev_team;

--
-- Name: shipping_lines_carrier_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ellie_dev_team
--

ALTER SEQUENCE public.shipping_lines_carrier_codes_id_seq OWNED BY public.shipping_lines_carrier_codes.id;


--
-- Name: shipping_lines_scac_codes; Type: TABLE; Schema: public; Owner: ellie_dev_team
--

CREATE TABLE public.shipping_lines_scac_codes (
    id bigint NOT NULL,
    carrier_code bigint,
    scac_code character varying
);


ALTER TABLE public.shipping_lines_scac_codes OWNER TO ellie_dev_team;

--
-- Name: shipping_lines_scac_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: ellie_dev_team
--

CREATE SEQUENCE public.shipping_lines_scac_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_lines_scac_codes_id_seq OWNER TO ellie_dev_team;

--
-- Name: shipping_lines_scac_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ellie_dev_team
--

ALTER SEQUENCE public.shipping_lines_scac_codes_id_seq OWNED BY public.shipping_lines_scac_codes.id;


--
-- Name: container_milestones id; Type: DEFAULT; Schema: public; Owner: ellie_dev_team
--

ALTER TABLE ONLY public.container_milestones ALTER COLUMN id SET DEFAULT nextval('public.container_milestones_id_seq'::regclass);


--
-- Name: container_trackings id; Type: DEFAULT; Schema: public; Owner: ellie_dev_team
--

ALTER TABLE ONLY public.container_trackings ALTER COLUMN id SET DEFAULT nextval('public.container_trackings_id_seq'::regclass);


--
-- Name: shipping_lines_carrier_codes id; Type: DEFAULT; Schema: public; Owner: ellie_dev_team
--

ALTER TABLE ONLY public.shipping_lines_carrier_codes ALTER COLUMN id SET DEFAULT nextval('public.shipping_lines_carrier_codes_id_seq'::regclass);


--
-- Name: shipping_lines_scac_codes id; Type: DEFAULT; Schema: public; Owner: ellie_dev_team
--

ALTER TABLE ONLY public.shipping_lines_scac_codes ALTER COLUMN id SET DEFAULT nextval('public.shipping_lines_scac_codes_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: ellie_dev_team
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	default_env	2021-07-27 00:03:56.43201	2021-07-27 00:03:56.43201
\.


--
-- Data for Name: container_milestones; Type: TABLE DATA; Schema: public; Owner: ellie_dev_team
--

COPY public.container_milestones (id, container_id, milestone_timestamp, location_name, location_city, location_country, location_unlocode, location_facility, description, raw_descripition, vessel_imo, vessel_mmsi, voyage, mode, vessel, latitude, longitude, estimated_time_arrival, planned) FROM stdin;
295325	ECMU4670610	2021-05-24 00:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
295326	ECMU4670610	2021-05-25 00:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in at origin port	Ready to be loaded	8987670	353032000	430A5S	Vessel	WINNER	22.30049832559382	91.79452471970988	f	f
295327	ECMU4670610	2021-05-27 00:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded on board	8987670	353032000	430A5S	Vessel	WINNER	22.30049832559382	91.79452471970988	f	f
295328	ECMU4670610	2021-05-31 00:00:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged transshipment	Discharged in transhipment	8987670	353032000	435A5N	Vessel	WINNER	1.271978728313698	103.768308722207	f	f
295329	ECMU4670610	2021-06-10 00:00:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Loaded on board	9454400	235076499	0TUHVE1MA	Vessel	CMA CGM CORTE REAL	1.271978728313698	103.768308722207	f	f
295330	ECMU4670610	2021-07-23 07:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Discharged from vessel	Discharged	9454400	235076499	0TUHWW1MA	Vessel	CMA CGM CORTE REAL	34.0522342	-118.2436849	f	f
295331	ECMU4670610	2021-07-29 07:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Gate out to consignee	Container to consignee	9454400	235076499	0TUHWW1MA	Vessel	CMA CGM CORTE REAL	34.0522342	-118.2436849	f	f
295332	ECMU4670610	2021-08-03 07:00:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Gate in empty return	Empty in depot	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
295555	APZU4512494	2021-08-03 07:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Gate out empty	Empty to shipper	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
295556	APZU4512494	2021-05-24 00:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
295557	APZU4512494	2021-05-25 00:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in at origin port	Ready to be loaded	8987670	353032000	430A5S	Vessel	WINNER	22.30049832559382	91.79452471970988	f	f
295558	APZU4512494	2021-05-27 00:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded on board	8987670	353032000	430A5S	Vessel	WINNER	22.30049832559382	91.79452471970988	f	f
295559	APZU4512494	2021-05-31 00:00:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged transshipment	Discharged in transhipment	8987670	353032000	435A5N	Vessel	WINNER	1.271978728313698	103.768308722207	f	f
295560	APZU4512494	2021-06-10 00:00:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Loaded on board	9454400	235076499	0TUHVE1MA	Vessel	CMA CGM CORTE REAL	1.271978728313698	103.768308722207	f	f
295561	APZU4512494	2021-07-23 07:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Discharged from vessel	Discharged	9454400	235076499	0TUHWW1MA	Vessel	CMA CGM CORTE REAL	34.0522342	-118.2436849	f	f
295562	APZU4512494	2021-07-30 07:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Gate out to consignee	Container to consignee	9454400	235076499	0TUHWW1MA	Vessel	CMA CGM CORTE REAL	34.0522342	-118.2436849	f	f
295781	CAIU9339738	2021-05-09 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
295782	CAIU9339738	2021-05-09 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
295783	CAIU9339738	2021-05-15 23:40:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
295784	CAIU9339738	2021-05-15 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
295785	CAIU9339738	2021-05-17 12:45:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	0022S	\N	SAHARE	22.30049832559382	91.79452471970988	f	f
295786	CAIU9339738	2021-05-22 08:32:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	0022S	\N	SAHARE	1.271978728313698	103.768308722207	f	f
295787	CAIU9339738	2021-05-25 01:04:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	\N	\N	FJ116E	\N	MSC MINA	1.271978728313698	103.768308722207	f	f
295788	CAIU9339738	2021-06-15 14:30:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	FJ116	\N	MSC MINA	26.85	119.86666666666666	f	f
295789	CAIU9339738	2021-06-28 23:01:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	7820394	352890000	QJ122N	Vessel	MSC CLORINDA	26.85	119.86666666666666	f	f
295790	CAIU9339738	2021-07-13 00:02:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7820394	352890000	122N	Vessel	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
295791	CAIU9339738	2021-07-20 07:26:00	LONG BEACH	Long Beach	United States	USLGB	\N	Discharged from vessel	Discharged	7820394	352890000	122N	Vessel	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
295792	CAIU9339738	2021-07-29 16:18:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate out	Gate Out Full	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
295793	CAIU9339738	2021-07-31 19:42:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate in empty return	Empty in Container Yard	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
296131	MEDU8303623	2021-05-09 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
296132	MEDU8303623	2021-05-09 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
296133	MEDU8303623	2021-05-15 23:40:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
296134	MEDU8303623	2021-05-15 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
296135	MEDU8303623	2021-05-17 12:45:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	0022S	\N	SAHARE	22.30049832559382	91.79452471970988	f	f
296136	MEDU8303623	2021-05-22 08:11:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	0022S	\N	SAHARE	1.271978728313698	103.768308722207	f	f
296137	MEDU8303623	2021-05-25 00:40:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	\N	\N	FJ116E	\N	MSC MINA	1.271978728313698	103.768308722207	f	f
296138	MEDU8303623	2021-06-15 14:30:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	FJ116	\N	MSC MINA	26.85	119.86666666666666	f	f
296139	MEDU8303623	2021-06-28 23:01:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	7820394	352890000	QJ122N	Vessel	MSC CLORINDA	26.85	119.86666666666666	f	f
296140	MEDU8303623	2021-07-13 00:02:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7820394	352890000	122N	Vessel	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
296141	MEDU8303623	2021-07-23 18:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Discharged from vessel	Discharged	7820394	352890000	122N	Vessel	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
296142	MEDU8303623	2021-07-31 20:39:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate out	Gate Out Full	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
296455	MSCU8293196	2021-05-06 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
296456	MSCU8293196	2021-05-06 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
296457	MSCU8293196	2021-05-07 23:40:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
296458	MSCU8293196	2021-05-07 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
296459	MSCU8293196	2021-05-08 23:25:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	039	\N	CALA PAGURO	22.30049832559382	91.79452471970988	f	f
296460	MSCU8293196	2021-05-15 18:55:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	S039	\N	CALA PAGURO	1.271978728313698	103.768308722207	f	f
296461	MSCU8293196	2021-05-21 08:36:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9755933	636017433	FJ114E	Vessel	MSC DIANA	1.271978728313698	103.768308722207	f	f
296462	MSCU8293196	2021-06-11 17:00:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9755933	636017433	FJ114	Vessel	MSC DIANA	26.85	119.86666666666666	f	f
296463	MSCU8293196	2021-06-20 11:21:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	9501239	351021000	121N	Vessel	MAERSK EUREKA	26.85	119.86666666666666	f	f
296464	MSCU8293196	2021-07-08 18:05:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	9501239	351021000	121N	Vessel	MAERSK EUREKA	33.766666666666666	-118.18333333333334	f	f
296465	MSCU8293196	2021-07-18 08:47:00	LONG BEACH	Long Beach	United States	USLGB	\N	Discharged from vessel	Discharged	9501239	351021000	121N	Vessel	MAERSK EUREKA	33.766666666666666	-118.18333333333334	f	f
296466	MSCU8293196	2021-07-22 07:20:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate out	Gate Out Full	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
296467	MSCU8293196	2021-07-23 17:01:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate in empty return	Empty in Container Yard	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
296845	MEDU3637377	2021-07-27 18:18:00	LOS ANGELES	Los Angeles	United States	USLAX	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
296846	MEDU3637377	2021-07-30 06:28:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
296865	MEDU3637377	2021-05-06 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
296866	MEDU3637377	2021-05-06 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
296867	MEDU3637377	2021-05-07 23:40:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
296868	MEDU3637377	2021-05-07 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
296869	MEDU3637377	2021-05-08 23:25:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	039	\N	CALA PAGURO	22.30049832559382	91.79452471970988	f	f
296870	MEDU3637377	2021-05-15 22:44:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	S039	\N	CALA PAGURO	1.271978728313698	103.768308722207	f	f
296871	MEDU3637377	2021-05-20 23:02:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9755933	636017433	FJ114E	Vessel	MSC DIANA	1.271978728313698	103.768308722207	f	f
296872	MEDU3637377	2021-06-11 17:00:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9755933	636017433	FJ114	Vessel	MSC DIANA	26.85	119.86666666666666	f	f
296873	MEDU3637377	2021-06-20 11:21:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	9501239	351021000	121N	Vessel	MAERSK EUREKA	26.85	119.86666666666666	f	f
296874	MEDU3637377	2021-07-08 18:01:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	9501239	351021000	121N	Vessel	MAERSK EUREKA	33.766666666666666	-118.18333333333334	f	f
296875	MEDU3637377	2021-07-20 18:44:00	LONG BEACH	Long Beach	United States	USLGB	\N	Discharged from vessel	Discharged	9501239	351021000	121N	Vessel	MAERSK EUREKA	33.766666666666666	-118.18333333333334	f	f
296876	MEDU3637377	2021-07-26 16:25:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate out	Gate Out Full	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
297123	TGHU9117649	2021-05-11 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297124	TGHU9117649	2021-05-11 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297125	TGHU9117649	2021-05-16 23:47:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297126	TGHU9117649	2021-05-16 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297127	TGHU9117649	2021-05-18 15:35:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	068S	\N	HAIAN EAST	22.30049832559382	91.79452471970988	f	f
297128	TGHU9117649	2021-05-26 18:32:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	068S	\N	HAIAN EAST	1.271978728313698	103.768308722207	f	f
297129	TGHU9117649	2021-05-29 16:39:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9755957	636017435	FJ117E	Vessel	MSC ELOANE	1.271978728313698	103.768308722207	f	f
297130	TGHU9117649	2021-06-23 08:00:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9755957	636017435	FJ117	Vessel	MSC ELOANE	26.85	119.86666666666666	f	f
297131	TGHU9117649	2021-06-28 23:01:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	7820394	352890000	QJ122N	Vessel	MSC CLORINDA	26.85	119.86666666666666	f	f
297132	TGHU9117649	2021-07-13 00:01:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7820394	352890000	122N	Vessel	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
297133	TGHU9117649	2021-07-20 17:33:00	LONG BEACH	Long Beach	United States	USLGB	\N	Discharged from vessel	Discharged	7820394	352890000	122N	Vessel	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
297134	TGHU9117649	2021-07-26 16:36:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate out	Gate Out Full	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
297135	TGHU9117649	2021-07-30 14:32:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate in empty return	Empty in Container Yard	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
297493	TCLU7537047	2021-06-01 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297494	TCLU7537047	2021-06-01 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297495	TCLU7537047	2021-06-02 23:40:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297496	TCLU7537047	2021-06-02 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297497	TCLU7537047	2021-06-03 22:27:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	9123582	564065000	104S	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
297498	TCLU7537047	2021-06-09 12:36:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9123582	564065000	0077E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
297499	TCLU7537047	2021-06-16 21:37:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9777216	636017882	FT119E	Vessel	MSC VIVIANA	1.271978728313698	103.768308722207	f	f
297500	TCLU7537047	2021-06-24 21:00:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9777216	636017882	FT119E	Vessel	MSC VIVIANA	22.483333333333334	113.91666666666667	f	f
297501	TCLU7537047	2021-06-27 10:01:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	22.483333333333334	113.91666666666667	f	f
297502	TCLU7537047	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
297653	DFSU6679443	2021-05-27 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297654	DFSU6679443	2021-05-27 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297655	DFSU6679443	2021-05-29 23:40:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297656	DFSU6679443	2021-05-29 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297657	DFSU6679443	2021-05-30 22:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	0023S	\N	SARERA	22.30049832559382	91.79452471970988	f	f
297658	DFSU6679443	2021-06-06 02:36:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	0023S	\N	SARERA	1.271978728313698	103.768308722207	f	f
297659	DFSU6679443	2021-06-08 18:58:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	\N	\N	117E	\N	MOSCOW MAERSK	1.271978728313698	103.768308722207	f	f
297660	DFSU6679443	2021-06-28 15:10:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	117E	\N	MOSCOW MAERSK	26.85	119.86666666666666	f	f
297661	DFSU6679443	2021-07-10 12:01:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	26.85	119.86666666666666	f	f
297662	DFSU6679443	2021-08-02 19:07:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7434444	353056000	125N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	f	f
297663	DFSU6679443	2021-08-05 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
297694	DFSU6679443	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
297997	MSCU7160162	2021-05-27 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297998	MSCU7160162	2021-05-27 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
297999	MSCU7160162	2021-05-29 23:40:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298000	MSCU7160162	2021-05-29 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298001	MSCU7160162	2021-05-30 22:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	0023S	\N	SARERA	22.30049832559382	91.79452471970988	f	f
298002	MSCU7160162	2021-06-06 02:55:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	0023S	\N	SARERA	1.271978728313698	103.768308722207	f	f
298003	MSCU7160162	2021-06-08 19:00:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	\N	\N	117E	\N	MOSCOW MAERSK	1.271978728313698	103.768308722207	f	f
298004	MSCU7160162	2021-06-28 15:10:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	117E	\N	MOSCOW MAERSK	26.85	119.86666666666666	f	f
298005	MSCU7160162	2021-07-10 12:01:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	26.85	119.86666666666666	f	f
298006	MSCU7160162	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
298237	CXDU2162167	2021-05-27 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298238	CXDU2162167	2021-05-27 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298239	CXDU2162167	2021-05-29 23:40:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298240	CXDU2162167	2021-05-29 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298241	CXDU2162167	2021-05-30 22:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	0023S	\N	SARERA	22.30049832559382	91.79452471970988	f	f
299219	TCLU5578026	2021-06-06 23:44:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298242	CXDU2162167	2021-06-06 03:00:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	0023S	\N	SARERA	1.271978728313698	103.768308722207	f	f
298243	CXDU2162167	2021-06-09 03:45:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	\N	\N	117E	\N	MOSCOW MAERSK	1.271978728313698	103.768308722207	f	f
298244	CXDU2162167	2021-06-28 15:10:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	117E	\N	MOSCOW MAERSK	26.85	119.86666666666666	f	f
298245	CXDU2162167	2021-07-10 12:01:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	26.85	119.86666666666666	f	f
298246	CXDU2162167	2021-08-05 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
298256	CXDU2162167	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
298517	FFAU2714334	2021-05-27 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298518	FFAU2714334	2021-05-27 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298519	FFAU2714334	2021-05-29 23:40:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298520	FFAU2714334	2021-05-29 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298521	FFAU2714334	2021-05-30 22:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	0023S	\N	SARERA	22.30049832559382	91.79452471970988	f	f
298522	FFAU2714334	2021-06-06 03:03:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	0023S	\N	SARERA	1.271978728313698	103.768308722207	f	f
298523	FFAU2714334	2021-06-08 18:55:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	\N	\N	117E	\N	MOSCOW MAERSK	1.271978728313698	103.768308722207	f	f
298524	FFAU2714334	2021-06-28 15:10:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	117E	\N	MOSCOW MAERSK	26.85	119.86666666666666	f	f
298525	FFAU2714334	2021-07-10 12:01:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	26.85	119.86666666666666	f	f
298526	FFAU2714334	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
298737	INKU2382856	2021-05-27 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298738	INKU2382856	2021-05-27 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298739	INKU2382856	2021-05-29 23:40:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298740	INKU2382856	2021-05-29 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
298741	INKU2382856	2021-05-30 22:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	0023S	\N	SARERA	22.30049832559382	91.79452471970988	f	f
298742	INKU2382856	2021-06-06 03:07:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	0023S	\N	SARERA	1.271978728313698	103.768308722207	f	f
298743	INKU2382856	2021-06-08 19:02:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	\N	\N	117E	\N	MOSCOW MAERSK	1.271978728313698	103.768308722207	f	f
298744	INKU2382856	2021-06-28 15:10:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	117E	\N	MOSCOW MAERSK	26.85	119.86666666666666	f	f
298745	INKU2382856	2021-07-10 12:01:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	26.85	119.86666666666666	f	f
298746	INKU2382856	2021-08-05 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
298756	INKU2382856	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
299017	MEDU8017039	2021-06-02 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
299018	MEDU8017039	2021-06-02 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
299019	MEDU8017039	2021-06-06 23:44:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
299020	MEDU8017039	2021-06-06 23:48:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
299021	MEDU8017039	2021-06-08 22:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	069S	\N	HAIAN EAST	22.30049832559382	91.79452471970988	f	f
299022	MEDU8017039	2021-06-14 16:52:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	069S	\N	HAIAN EAST	1.271978728313698	103.768308722207	f	f
299023	MEDU8017039	2021-06-19 04:50:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9754965	636017577	FT120E	Vessel	MSC REEF	1.271978728313698	103.768308722207	f	f
299024	MEDU8017039	2021-06-26 16:00:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9754965	636017577	FT120E	Vessel	MSC REEF	22.45994033143178	113.8929109645951	f	f
299025	MEDU8017039	2021-06-27 10:01:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	22.45994033143178	113.8929109645951	f	f
299026	MEDU8017039	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
299217	TCLU5578026	2021-06-02 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
299218	TCLU5578026	2021-06-02 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
299220	TCLU5578026	2021-06-06 23:48:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
299221	TCLU5578026	2021-06-08 22:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	069S	\N	HAIAN EAST	22.30049832559382	91.79452471970988	f	f
299222	TCLU5578026	2021-06-14 16:57:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	069S	\N	HAIAN EAST	1.271978728313698	103.768308722207	f	f
299223	TCLU5578026	2021-06-18 18:13:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9754965	636017577	FT120E	Vessel	MSC REEF	1.271978728313698	103.768308722207	f	f
299224	TCLU5578026	2021-06-26 16:00:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9754965	636017577	FT120E	Vessel	MSC REEF	22.45994033143178	113.8929109645951	f	f
299225	TCLU5578026	2021-06-27 10:01:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	22.45994033143178	113.8929109645951	f	f
299226	TCLU5578026	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
299337	GESU6799250	2021-07-28 15:16:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
299338	GESU6799250	2021-07-30 14:09:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
299339	GESU6799250	2021-08-12 11:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Loaded on vessel	Loaded on 'YM WHOLESOME 028W' at Port of Loading	9704611	477524700	028W	Vessel	YM WHOLESOME	33.766666666666666	-118.18333333333334	f	t
299341	GESU6799250	2021-09-01 20:00:00	LAEM CHABANG ,THAILAND	Laem Chabang	Thailand	THLCH	HUTCHISON LAEMCHABANG TML D1-3 (2840)	Vessel arrival	'YM WHOLESOME 028W' Arrival at Port of Discharging	9704611	477524700	028W	Vessel	YM WHOLESOME	13.06530238577126	100.8968310420525	f	t
299342	GESU6799250	2021-09-01 22:00:00	LAEM CHABANG ,THAILAND	Laem Chabang	Thailand	THLCH	HUTCHISON LAEMCHABANG TML D1-3 (2840)	Vessel berthed in port	'YM WHOLESOME 028W' POD Berthing Destination	9704611	477524700	028W	Vessel	YM WHOLESOME	13.06530238577126	100.8968310420525	f	t
299343	GESU6799250	2021-09-01 23:30:00	LAEM CHABANG ,THAILAND	Laem Chabang	Thailand	THLCH	HUTCHISON LAEMCHABANG TML D1-3 (2840)	Discharged from vessel	Unloaded from 'YM WHOLESOME 028W' at Port of Discharging	9704611	477524700	028W	Vessel	YM WHOLESOME	13.06530238577126	100.8968310420525	f	t
299344	GESU6799250	2021-09-02 04:00:00	LAEM CHABANG ,THAILAND	Laem Chabang	Thailand	THLCH	HUTCHISON LAEMCHABANG TML D1-3 (2840)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	13.06530238577126	100.8968310420525	f	t
299345	GESU6799250	2021-09-02 10:00:00	LAEM CHABANG ,THAILAND	Laem Chabang	Thailand	THLCH	K.R.C. TRANSPORT AND SERVICE CO.  LTD	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	13.06530238577126	100.8968310420525	f	t
299355	GESU6799250	2019-02-07 09:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Loaded on Vessel at Port of Loading	Loaded on Vessel at Port of Loading	\N	\N	001E	\N	\N	34.0522342	-118.2436849	f	t
299356	GESU6799250	2019-02-07 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel Departure from Port of Loading	Vessel Departure from Port of Loading	\N	\N	001E	\N	\N	34.0522342	-118.2436849	f	t
299357	GESU6799250	2019-02-27 19:00:00	SHANGHAI, SHANGHAI ,CHINA	Shanghai	China	CNSHA	SIPG (SHANGHAI INTL PORT GROUP) - WAIGAOQIAO	Vessel Arrival at Port of Discharging	Vessel Arrival at Port of Discharging	\N	\N	001E	\N	\N	31.233333333333334	121.48333333333333	f	t
299359	GESU6799250	2019-02-27 20:30:00	SHANGHAI, SHANGHAI ,CHINA	Shanghai	China	CNSHA	SIPG (SHANGHAI INTL PORT GROUP) - WAIGAOQIAO	Unloaded from Vessel at Port of Discharging	Unloaded from Vessel at Port of Discharging	\N	\N	001E	\N	\N	31.233333333333334	121.48333333333333	f	t
299360	GESU6799250	2019-02-28 01:00:00	SHANGHAI, SHANGHAI ,CHINA	Shanghai	China	CNSHA	SIPG (SHANGHAI INTL PORT GROUP) - WAIGAOQIAO	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	31.233333333333334	121.48333333333333	f	t
299361	GESU6799250	2019-02-28 07:00:00	SHANGHAI, SHANGHAI ,CHINA	Shanghai	China	CNSHA	SHANGHAI HUAFA TENGFEI INTL TRANSPO	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	31.233333333333334	121.48333333333333	f	t
299362	GESU6799250	2021-07-29 18:11:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	LAX STREET TURN	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
299363	GESU6799250	2021-07-31 10:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
299454	GESU6799250	2021-06-10 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
299455	GESU6799250	2021-06-10 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
299456	GESU6799250	2021-06-14 12:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'MAERSK MONGLA 121Y' at Port of Loading	\N	\N	121E	Vessel	MAERSK MONGLA	22.30049832559382	91.79452471970988	f	f
299457	GESU6799250	2021-06-14 13:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'MAERSK MONGLA 121Y' Departure from Port of Loading	\N	\N	121E	Vessel	MAERSK MONGLA	22.30049832559382	91.79452471970988	f	f
299458	GESU6799250	2021-06-19 16:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'MAERSK MONGLA 121Y' Arrival at Transhipment Port	\N	\N	121E	Vessel	MAERSK MONGLA	1.271978728313698	103.768308722207	f	f
299459	GESU6799250	2021-06-20 00:23:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'MAERSK MONGLA 121Y' at Transhipment Port	\N	\N	121E	Vessel	MAERSK MONGLA	1.271978728313698	103.768308722207	f	f
299460	GESU6799250	2021-06-25 14:35:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'SEASPAN ADONIS 063E' at Transhipment Port	\N	\N	063E	Vessel	SEASPAN ADONIS	1.271978728313698	103.768308722207	f	f
300661	TRHU4989620	2019-02-07 09:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Loaded on Vessel at Port of Loading	Loaded on Vessel at Port of Loading	\N	\N	001E	\N	\N	34.0522342	-118.2436849	f	t
299461	GESU6799250	2021-06-26 02:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	063E	Vessel	SEASPAN ADONIS	1.271978728313698	103.768308722207	f	f
299462	GESU6799250	2021-07-18 20:42:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'SEASPAN ADONIS 063E' Arrival at Port of Discharging	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
299464	GESU6799250	2021-07-18 22:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'SEASPAN ADONIS 063E' POD Berthing Destination	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
299465	GESU6799250	2021-07-23 02:22:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'SEASPAN ADONIS 063E' at Port of Discharging	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
299466	GESU6799250	2021-07-24 16:04:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
299467	GESU6799250	2021-07-24 22:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
299739	TCNU4833757	2019-02-07 09:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Loaded on Vessel at Port of Loading	Loaded on Vessel at Port of Loading	\N	\N	001E	\N	\N	34.0522342	-118.2436849	f	t
299740	TCNU4833757	2019-02-07 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel Departure from Port of Loading	Vessel Departure from Port of Loading	\N	\N	001E	\N	\N	34.0522342	-118.2436849	f	t
299741	TCNU4833757	2019-02-27 19:00:00	SHANGHAI, SHANGHAI ,CHINA	Shanghai	China	CNSHA	SIPG (SHANGHAI INTL PORT GROUP) - WAIGAOQIAO	Vessel Arrival at Port of Discharging	Vessel Arrival at Port of Discharging	\N	\N	001E	\N	\N	31.233333333333334	121.48333333333333	f	t
299743	TCNU4833757	2019-02-27 20:30:00	SHANGHAI, SHANGHAI ,CHINA	Shanghai	China	CNSHA	SIPG (SHANGHAI INTL PORT GROUP) - WAIGAOQIAO	Unloaded from Vessel at Port of Discharging	Unloaded from Vessel at Port of Discharging	\N	\N	001E	\N	\N	31.233333333333334	121.48333333333333	f	t
299744	TCNU4833757	2019-02-28 01:00:00	SHANGHAI, SHANGHAI ,CHINA	Shanghai	China	CNSHA	SIPG (SHANGHAI INTL PORT GROUP) - WAIGAOQIAO	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	31.233333333333334	121.48333333333333	f	t
299745	TCNU4833757	2019-02-28 07:00:00	SHANGHAI, SHANGHAI ,CHINA	Shanghai	China	CNSHA	SHANGHAI HUAFA TENGFEI INTL TRANSPO	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	31.233333333333334	121.48333333333333	f	t
299746	TCNU4833757	2021-07-30 16:04:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	LAX STREET TURN	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
299747	TCNU4833757	2021-08-01 08:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
299829	TCNU4833757	2021-06-10 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
299830	TCNU4833757	2021-06-10 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
299831	TCNU4833757	2021-06-14 12:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'MAERSK MONGLA 121Y' at Port of Loading	\N	\N	121E	Vessel	MAERSK MONGLA	22.30049832559382	91.79452471970988	f	f
299832	TCNU4833757	2021-06-14 13:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'MAERSK MONGLA 121Y' Departure from Port of Loading	\N	\N	121E	Vessel	MAERSK MONGLA	22.30049832559382	91.79452471970988	f	f
299833	TCNU4833757	2021-06-19 16:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'MAERSK MONGLA 121Y' Arrival at Transhipment Port	\N	\N	121E	Vessel	MAERSK MONGLA	1.271978728313698	103.768308722207	f	f
299834	TCNU4833757	2021-06-20 12:51:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'MAERSK MONGLA 121Y' at Transhipment Port	\N	\N	121E	Vessel	MAERSK MONGLA	1.271978728313698	103.768308722207	f	f
299835	TCNU4833757	2021-06-25 14:32:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'SEASPAN ADONIS 063E' at Transhipment Port	\N	\N	063E	Vessel	SEASPAN ADONIS	1.271978728313698	103.768308722207	f	f
299836	TCNU4833757	2021-06-26 02:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	063E	Vessel	SEASPAN ADONIS	1.271978728313698	103.768308722207	f	f
299837	TCNU4833757	2021-07-18 20:42:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'SEASPAN ADONIS 063E' Arrival at Port of Discharging	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
299839	TCNU4833757	2021-07-18 22:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'SEASPAN ADONIS 063E' POD Berthing Destination	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
299840	TCNU4833757	2021-07-23 16:33:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'SEASPAN ADONIS 063E' at Port of Discharging	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
299841	TCNU4833757	2021-07-24 16:03:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
299842	TCNU4833757	2021-07-24 22:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
300171	SEGU5856874	2021-07-30 15:12:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	LAX STREET TURN	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
300172	SEGU5856874	2021-07-30 19:19:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	PIER T - TTI (TOTAL TERMINALS INTL)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
300173	SEGU5856874	2021-08-08 07:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	PIER T - TTI (TOTAL TERMINALS INTL)	Loaded on vessel	Loaded on 'HYUNDAI EARTH 028W' at Port of Loading	\N	\N	028W	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	t
300174	SEGU5856874	2021-08-08 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	PIER T - TTI (TOTAL TERMINALS INTL)	Vessel departed	'HYUNDAI EARTH 028W' Departure from Port of Loading	\N	\N	028W	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	t
300175	SEGU5856874	2021-08-21 04:00:00	PUSAN ,KOREA REPUBLIC OF	Busan	South Korea	KRPUS	HANJIN BUSAN NEW PORT COMPANY(HJNC)	Vessel arrival at transshipment port	'HYUNDAI EARTH 028W' Arrival at Transhipment Port	\N	\N	028W	Vessel	HYUNDAI EARTH	-25.2989444732666	-57.6291160583496	f	t
300176	SEGU5856874	2021-08-21 05:00:00	PUSAN ,KOREA REPUBLIC OF	Busan	South Korea	KRPUS	HANJIN BUSAN NEW PORT COMPANY(HJNC)	Vessel berthed in port	'HYUNDAI EARTH 028W' T/S Berthing Destination	\N	\N	028W	Vessel	HYUNDAI EARTH	-25.2989444732666	-57.6291160583496	f	t
300177	SEGU5856874	2021-08-22 22:00:00	PUSAN ,KOREA REPUBLIC OF	Busan	South Korea	KRPUS	HANJIN BUSAN NEW PORT COMPANY(HJNC)	Discharged transshipment	Unloaded from 'HYUNDAI EARTH 028W' at Transhipment Port	\N	\N	028W	Vessel	HYUNDAI EARTH	-25.2989444732666	-57.6291160583496	f	t
300178	SEGU5856874	2021-08-27 16:00:00	PUSAN ,KOREA REPUBLIC OF	Busan	South Korea	KRPUS	HANJIN BUSAN NEW PORT COMPANY(HJNC)	Loaded on vessel at transshipment port	Loaded on 'LOS ANDES BRIDGE 168S' at Transhipment Port	9451472	354118000	168S	Vessel	LOS ANDES BRIDGE	-25.2989444732666	-57.6291160583496	f	t
300179	SEGU5856874	2021-08-28 00:00:00	PUSAN ,KOREA REPUBLIC OF	Busan	South Korea	KRPUS	HANJIN BUSAN NEW PORT COMPANY(HJNC)	Vessel departure from transshipment port	Departure from Transhipment Port	9451472	354118000	168S	Vessel	LOS ANDES BRIDGE	-25.2989444732666	-57.6291160583496	f	t
300180	SEGU5856874	2021-09-04 21:00:00	LAEM CHABANG ,THAILAND	Laem Chabang	Thailand	THLCH	HUTCHISON LAEMCHABANG TML C1C2 (2836)	Vessel arrival	'LOS ANDES BRIDGE 168S' Arrival at Port of Discharging	9451472	354118000	168S	Vessel	LOS ANDES BRIDGE	13.06530238577126	100.8968310420525	f	t
300182	SEGU5856874	2021-09-04 23:00:00	LAEM CHABANG ,THAILAND	Laem Chabang	Thailand	THLCH	HUTCHISON LAEMCHABANG TML C1C2 (2836)	Vessel berthed in port	'LOS ANDES BRIDGE 168S' POD Berthing Destination	9451472	354118000	168S	Vessel	LOS ANDES BRIDGE	13.06530238577126	100.8968310420525	f	t
300183	SEGU5856874	2021-09-05 00:30:00	LAEM CHABANG ,THAILAND	Laem Chabang	Thailand	THLCH	HUTCHISON LAEMCHABANG TML C1C2 (2836)	Discharged from vessel	Unloaded from 'LOS ANDES BRIDGE 168S' at Port of Discharging	9451472	354118000	168S	Vessel	LOS ANDES BRIDGE	13.06530238577126	100.8968310420525	f	t
300184	SEGU5856874	2021-09-05 05:00:00	LAEM CHABANG ,THAILAND	Laem Chabang	Thailand	THLCH	HUTCHISON LAEMCHABANG TML C1C2 (2836)	Water POD Loading Origin	Water POD Loading Origin	\N	\N	\N	\N	\N	13.06530238577126	100.8968310420525	f	t
300186	SEGU5856874	2021-09-05 13:00:00	BANGKOK ,THAILAND	Bangkok	Thailand	THBKK	PAT	Feeder arrived	Feeder Arrival at I/B Inland Port	\N	\N	\N	\N	\N	13.60488469563593	100.5744454784888	f	t
300187	SEGU5856874	2021-09-05 14:30:00	BANGKOK ,THAILAND	Bangkok	Thailand	THBKK	PAT	Discharged from feeder	Feeder Unloading at I/B Inland Port	\N	\N	\N	\N	\N	13.60488469563593	100.5744454784888	f	t
300188	SEGU5856874	2021-09-05 19:00:00	BANGKOK ,THAILAND	Bangkok	Thailand	THBKK	PAT	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	13.60488469563593	100.5744454784888	f	t
300189	SEGU5856874	2021-09-06 19:00:00	BANGKOK ,THAILAND	Bangkok	Thailand	THBKK	BANGKOK CONTAINER SERVICE CO. LTD	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	13.60488469563593	100.5744454784888	f	t
300254	SEGU5856874	2021-08-27 21:00:00	PUSAN ,KOREA REPUBLIC OF	Busan	South Korea	KRPUS	HANJIN BUSAN NEW PORT COMPANY(HJNC)	Loaded on vessel at transshipment port	Loaded on 'LOS ANDES BRIDGE 168S' at Transhipment Port	9451472	354118000	168S	Vessel	LOS ANDES BRIDGE	-25.2989444732666	-57.6291160583496	f	t
300255	SEGU5856874	2021-08-28 05:00:00	PUSAN ,KOREA REPUBLIC OF	Busan	South Korea	KRPUS	HANJIN BUSAN NEW PORT COMPANY(HJNC)	Vessel departure from transshipment port	Departure from Transhipment Port	9451472	354118000	168S	Vessel	LOS ANDES BRIDGE	-25.2989444732666	-57.6291160583496	f	t
300304	SEGU5856874	2021-06-10 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
300305	SEGU5856874	2021-06-10 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
300306	SEGU5856874	2021-06-14 12:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'MAERSK MONGLA 121Y' at Port of Loading	\N	\N	121E	Vessel	MAERSK MONGLA	22.30049832559382	91.79452471970988	f	f
300307	SEGU5856874	2021-06-14 13:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'MAERSK MONGLA 121Y' Departure from Port of Loading	\N	\N	121E	Vessel	MAERSK MONGLA	22.30049832559382	91.79452471970988	f	f
300308	SEGU5856874	2021-06-19 16:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'MAERSK MONGLA 121Y' Arrival at Transhipment Port	\N	\N	121E	Vessel	MAERSK MONGLA	1.271978728313698	103.768308722207	f	f
300309	SEGU5856874	2021-06-20 13:09:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'MAERSK MONGLA 121Y' at Transhipment Port	\N	\N	121E	Vessel	MAERSK MONGLA	1.271978728313698	103.768308722207	f	f
300310	SEGU5856874	2021-06-25 14:33:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'SEASPAN ADONIS 063E' at Transhipment Port	\N	\N	063E	Vessel	SEASPAN ADONIS	1.271978728313698	103.768308722207	f	f
300311	SEGU5856874	2021-06-26 02:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	063E	Vessel	SEASPAN ADONIS	1.271978728313698	103.768308722207	f	f
300312	SEGU5856874	2021-07-18 20:42:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'SEASPAN ADONIS 063E' Arrival at Port of Discharging	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
300314	SEGU5856874	2021-07-18 22:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'SEASPAN ADONIS 063E' POD Berthing Destination	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
300315	SEGU5856874	2021-07-23 06:14:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'SEASPAN ADONIS 063E' at Port of Discharging	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
300316	SEGU5856874	2021-07-24 00:15:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
300317	SEGU5856874	2021-07-24 06:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
300662	TRHU4989620	2019-02-07 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel Departure from Port of Loading	Vessel Departure from Port of Loading	\N	\N	001E	\N	\N	34.0522342	-118.2436849	f	t
300663	TRHU4989620	2019-02-27 19:00:00	SHANGHAI, SHANGHAI ,CHINA	Shanghai	China	CNSHA	SIPG (SHANGHAI INTL PORT GROUP) - WAIGAOQIAO	Vessel Arrival at Port of Discharging	Vessel Arrival at Port of Discharging	\N	\N	001E	\N	\N	31.233333333333334	121.48333333333333	f	t
300665	TRHU4989620	2019-02-27 20:30:00	SHANGHAI, SHANGHAI ,CHINA	Shanghai	China	CNSHA	SIPG (SHANGHAI INTL PORT GROUP) - WAIGAOQIAO	Unloaded from Vessel at Port of Discharging	Unloaded from Vessel at Port of Discharging	\N	\N	001E	\N	\N	31.233333333333334	121.48333333333333	f	t
300666	TRHU4989620	2019-02-28 01:00:00	SHANGHAI, SHANGHAI ,CHINA	Shanghai	China	CNSHA	SIPG (SHANGHAI INTL PORT GROUP) - WAIGAOQIAO	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	31.233333333333334	121.48333333333333	f	t
300667	TRHU4989620	2019-02-28 07:00:00	SHANGHAI, SHANGHAI ,CHINA	Shanghai	China	CNSHA	SHANGHAI HUAFA TENGFEI INTL TRANSPO	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	31.233333333333334	121.48333333333333	f	t
300668	TRHU4989620	2021-07-30 16:04:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	LAX STREET TURN	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
300669	TRHU4989620	2021-08-01 08:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
300724	TRHU4989620	2021-06-10 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
300725	TRHU4989620	2021-06-10 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
300726	TRHU4989620	2021-06-14 12:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'MAERSK MONGLA 121Y' at Port of Loading	\N	\N	121E	Vessel	MAERSK MONGLA	22.30049832559382	91.79452471970988	f	f
300727	TRHU4989620	2021-06-14 13:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'MAERSK MONGLA 121Y' Departure from Port of Loading	\N	\N	121E	Vessel	MAERSK MONGLA	22.30049832559382	91.79452471970988	f	f
300728	TRHU4989620	2021-06-19 16:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'MAERSK MONGLA 121Y' Arrival at Transhipment Port	\N	\N	121E	Vessel	MAERSK MONGLA	1.271978728313698	103.768308722207	f	f
300729	TRHU4989620	2021-06-20 14:44:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'MAERSK MONGLA 121Y' at Transhipment Port	\N	\N	121E	Vessel	MAERSK MONGLA	1.271978728313698	103.768308722207	f	f
300730	TRHU4989620	2021-06-25 14:07:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'SEASPAN ADONIS 063E' at Transhipment Port	\N	\N	063E	Vessel	SEASPAN ADONIS	1.271978728313698	103.768308722207	f	f
300731	TRHU4989620	2021-06-26 02:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	063E	Vessel	SEASPAN ADONIS	1.271978728313698	103.768308722207	f	f
300732	TRHU4989620	2021-07-18 20:42:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'SEASPAN ADONIS 063E' Arrival at Port of Discharging	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
300734	TRHU4989620	2021-07-18 22:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'SEASPAN ADONIS 063E' POD Berthing Destination	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
300735	TRHU4989620	2021-07-22 23:20:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'SEASPAN ADONIS 063E' at Port of Discharging	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
300736	TRHU4989620	2021-07-24 20:51:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
300737	TRHU4989620	2021-07-25 03:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
301011	TCNU4573449	2021-06-22 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
301013	TCNU4573449	2021-07-02 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel	Loaded (FCL) on vessel	9249245	235700000	0011-325N	Vessel	EVER PRIMA	20.8449115	106.6880841	f	f
301014	TCNU4573449	2021-07-05 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9249245	235700000	0011-325N	Vessel	EVER PRIMA	22.6272784	120.3014353	f	f
301015	TCNU4573449	2021-07-16 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9247546	636016106	0031-013E	Vessel	ENSENADA	22.6272784	120.3014353	f	f
301016	TCNU4573449	2021-08-05 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
301035	CAIU8160877	2021-05-11 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301036	CAIU8160877	2021-05-11 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301037	CAIU8160877	2021-05-16 23:47:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301038	CAIU8160877	2021-05-16 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301039	CAIU8160877	2021-05-18 15:35:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	068S	\N	HAIAN EAST	22.30049832559382	91.79452471970988	f	f
301040	CAIU8160877	2021-05-26 17:29:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	068S	\N	HAIAN EAST	1.271978728313698	103.768308722207	f	f
301041	CAIU8160877	2021-05-29 17:58:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9755957	636017435	FJ117E	Vessel	MSC ELOANE	1.271978728313698	103.768308722207	f	f
306012	UACU5342430	2021-07-05 10:54:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Vessel arrived	Vessel arrived	\N	\N	0025S	Vessel	SARERA	1.271978728313698	103.768308722207	f	f
301042	CAIU8160877	2021-06-23 08:00:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9755957	636017435	FJ117	Vessel	MSC ELOANE	26.85	119.86666666666666	f	f
301043	CAIU8160877	2021-06-28 23:01:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	7820394	352890000	QJ122N	Vessel	MSC CLORINDA	26.85	119.86666666666666	f	f
301044	CAIU8160877	2021-07-13 00:00:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7820394	352890000	122N	Vessel	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
301045	CAIU8160877	2021-07-23 18:35:00	LONG BEACH	Long Beach	United States	USLGB	\N	Discharged from vessel	Discharged	7820394	352890000	122N	Vessel	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
301046	CAIU8160877	2021-07-31 20:42:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate out	Gate Out Full	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
301307	MSCU5248038	2021-05-31 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301308	MSCU5248038	2021-05-31 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301309	MSCU5248038	2021-06-01 23:47:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301310	MSCU5248038	2021-06-01 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301311	MSCU5248038	2021-06-03 22:27:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	9123582	564065000	104S	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
301312	MSCU5248038	2021-06-09 08:35:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9123582	564065000	0077E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
301313	MSCU5248038	2021-06-16 18:58:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9777216	636017882	FT119E	Vessel	MSC VIVIANA	1.271978728313698	103.768308722207	f	f
301314	MSCU5248038	2021-06-24 21:00:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9777216	636017882	FT119E	Vessel	MSC VIVIANA	22.483333333333334	113.91666666666667	f	f
301315	MSCU5248038	2021-06-27 10:01:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	22.483333333333334	113.91666666666667	f	f
301316	MSCU5248038	2021-08-02 19:00:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7434444	353056000	125N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	f	f
301317	MSCU5248038	2021-08-05 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
301348	MSCU5248038	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
301491	SZLU9560138	2021-05-30 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CGP ESACK BROTHERS INDUSTRIES	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301492	SZLU9560138	2021-05-30 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301493	SZLU9560138	2021-06-03 16:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'ALION 006S' at Port of Loading	16	244700446	006S	Vessel	ALION	22.30049832559382	91.79452471970988	f	f
301494	SZLU9560138	2021-06-03 16:50:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'ALION 006S' Departure from Port of Loading	16	244700446	006S	Vessel	ALION	22.30049832559382	91.79452471970988	f	f
301495	SZLU9560138	2021-06-12 04:00:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	JCT (COLOMBO JAYA CONTAINER TERMINAL)	Vessel arrival at transshipment port	'ALION 006S' Arrival at Transhipment Port	16	244700446	006S	Vessel	ALION	6.916666666666667	79.85	f	f
301496	SZLU9560138	2021-06-12 04:20:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	JCT (COLOMBO JAYA CONTAINER TERMINAL)	Vessel berthed in port	'ALION 006S' T/S Berthing Destination	16	244700446	006S	Vessel	ALION	6.916666666666667	79.85	f	f
301497	SZLU9560138	2021-06-12 16:02:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	JCT (COLOMBO JAYA CONTAINER TERMINAL)	Discharged transshipment	Unloaded from 'ALION 006S' at Transhipment Port	16	244700446	006S	Vessel	ALION	6.916666666666667	79.85	f	f
301498	SZLU9560138	2021-06-23 12:20:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	JCT (COLOMBO JAYA CONTAINER TERMINAL)	Truck departed	T/S Truck Terminal Departure	\N	\N	\N	\N	\N	6.916666666666667	79.85	f	f
301499	SZLU9560138	2021-06-23 12:45:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Truck arrived	T/S Truck Terminal Arrival	\N	\N	\N	\N	\N	6.916666666666667	79.85	f	f
301500	SZLU9560138	2021-07-11 10:33:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Loaded on vessel at transshipment port	Loaded on 'ONE HELSINKI 045E' at Transhipment Port	\N	\N	045E	Vessel	ONE HELSINKI	6.916666666666667	79.85	f	f
301501	SZLU9560138	2021-07-11 14:54:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	045E	Vessel	ONE HELSINKI	6.916666666666667	79.85	f	f
301502	SZLU9560138	2021-07-30 18:20:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Vessel arrival	'ONE HELSINKI 045E' Arrival at Port of Discharging	\N	\N	045E	Vessel	ONE HELSINKI	44.64876350000001	-63.5752387	f	f
301504	SZLU9560138	2021-07-30 21:18:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Vessel berthed in port	'ONE HELSINKI 045E' POD Berthing Destination	\N	\N	045E	Vessel	ONE HELSINKI	44.64876350000001	-63.5752387	f	f
301505	SZLU9560138	2021-07-30 21:45:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Discharged from vessel	Unloaded from 'ONE HELSINKI 045E' at Port of Discharging	\N	\N	045E	Vessel	ONE HELSINKI	44.64876350000001	-63.5752387	f	f
301506	SZLU9560138	2021-08-02 19:58:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Loaded on rail	Loaded on rail at inbound rail origin	\N	\N	\N	\N	\N	44.64876350000001	-63.5752387	f	f
301507	SZLU9560138	2021-08-05 20:30:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Rail departed	Inbound Rail Departure	\N	\N	\N	\N	\N	44.64876350000001	-63.5752387	f	t
301508	SZLU9560138	2021-08-07 22:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Rail arrived	Inbound Rail Arrival	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301509	SZLU9560138	2021-08-08 00:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Discharged from rail	Unloaded from rail at inbound rail destination	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301510	SZLU9560138	2021-08-08 05:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Gate out to consignee	Gate Out from Inbound CY for Delivery to Consignee	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301511	SZLU9560138	2021-08-09 05:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	TREALSHIP SERVICES INC (WESTMINSTER)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301611	SZLU9560138	2021-07-31 02:00:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Loaded on rail	Loaded on rail at inbound rail origin	\N	\N	\N	\N	\N	44.64876350000001	-63.5752387	f	t
301612	SZLU9560138	2021-08-03 02:30:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Rail departed	Inbound Rail Departure	\N	\N	\N	\N	\N	44.64876350000001	-63.5752387	f	t
301613	SZLU9560138	2021-08-05 04:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Rail arrived	Inbound Rail Arrival	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301614	SZLU9560138	2021-08-05 06:00:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Discharged from rail	Unloaded from rail at inbound rail destination	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301615	SZLU9560138	2021-08-05 11:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Gate out to consignee	Gate Out from Inbound CY for Delivery to Consignee	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301616	SZLU9560138	2021-08-06 11:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	TREALSHIP SERVICES INC (WESTMINSTER)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301633	SZLU9560138	2021-08-02 02:30:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Rail departed	Inbound Rail Departure	\N	\N	\N	\N	\N	44.64876350000001	-63.5752387	f	t
301634	SZLU9560138	2021-08-04 04:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Rail arrived	Inbound Rail Arrival	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301635	SZLU9560138	2021-08-04 06:00:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Discharged from rail	Unloaded from rail at inbound rail destination	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301636	SZLU9560138	2021-08-04 11:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Gate out to consignee	Gate Out from Inbound CY for Delivery to Consignee	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301675	SZLU9560138	2021-08-01 02:30:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Rail departed	Inbound Rail Departure	\N	\N	\N	\N	\N	44.64876350000001	-63.5752387	f	t
301676	SZLU9560138	2021-08-03 04:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Rail arrived	Inbound Rail Arrival	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301677	SZLU9560138	2021-08-03 06:00:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Discharged from rail	Unloaded from rail at inbound rail destination	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301678	SZLU9560138	2021-08-03 11:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Gate out to consignee	Gate Out from Inbound CY for Delivery to Consignee	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301717	SZLU9560138	2021-07-31 02:30:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Rail departed	Inbound Rail Departure	\N	\N	\N	\N	\N	44.64876350000001	-63.5752387	f	t
301718	SZLU9560138	2021-08-02 04:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Rail arrived	Inbound Rail Arrival	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301719	SZLU9560138	2021-08-02 06:00:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Discharged from rail	Unloaded from rail at inbound rail destination	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301720	SZLU9560138	2021-08-02 11:30:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Gate out to consignee	Gate Out from Inbound CY for Delivery to Consignee	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301733	SZLU9560138	2021-07-30 18:00:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Vessel arrival	'ONE HELSINKI 045E' Arrival at Port of Discharging	\N	\N	045E	Vessel	ONE HELSINKI	44.64876350000001	-63.5752387	f	t
301735	SZLU9560138	2021-07-30 20:00:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Vessel berthed in port	'ONE HELSINKI 045E' POD Berthing Destination	\N	\N	045E	Vessel	ONE HELSINKI	44.64876350000001	-63.5752387	f	t
301736	SZLU9560138	2021-07-30 21:30:00	HALIFAX, NS ,CANADA	Halifax	Canada	CAHAL	2025 FAIRVIEW COVE CONTAINER TERMINAL (CERES)	Discharged from vessel	Unloaded from 'ONE HELSINKI 045E' at Port of Discharging	\N	\N	045E	Vessel	ONE HELSINKI	44.64876350000001	-63.5752387	f	t
301739	SZLU9560138	2021-08-02 04:00:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Rail arrived	Inbound Rail Arrival	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301741	SZLU9560138	2021-08-02 11:00:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	2414 CN RAIL - TASCHEREAU (RAILRAMP)	Gate out to consignee	Gate Out from Inbound CY for Delivery to Consignee	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301742	SZLU9560138	2021-08-03 11:00:00	MONTREAL, QC ,CANADA	Montreal	Canada	CAMTR	TREALSHIP SERVICES INC (WESTMINSTER)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	45.5016889	-73.567256	f	t
301764	MEDU6555930	2021-05-31 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301765	MEDU6555930	2021-05-31 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301766	MEDU6555930	2021-06-01 23:47:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301767	MEDU6555930	2021-06-01 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
301768	MEDU6555930	2021-06-03 22:27:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	9123582	564065000	104S	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
301769	MEDU6555930	2021-06-09 11:24:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9123582	564065000	0077E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
301770	MEDU6555930	2021-06-16 21:51:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9777216	636017882	FT119E	Vessel	MSC VIVIANA	1.271978728313698	103.768308722207	f	f
304354	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
301771	MEDU6555930	2021-06-24 21:00:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9777216	636017882	FT119E	Vessel	MSC VIVIANA	22.483333333333334	113.91666666666667	f	f
301772	MEDU6555930	2021-06-27 10:01:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	22.483333333333334	113.91666666666667	f	f
301773	MEDU6555930	2021-08-02 19:07:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7434444	353056000	125N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	f	f
301774	MEDU6555930	2021-08-05 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
301794	MEDU6555930	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
302148	MSCU1268695	2021-06-02 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
302149	MSCU1268695	2021-06-02 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
302150	MSCU1268695	2021-06-02 23:40:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
302151	MSCU1268695	2021-06-02 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
302152	MSCU1268695	2021-06-03 22:27:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	9123582	564065000	104S	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
302153	MSCU1268695	2021-06-09 11:59:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9123582	564065000	0077E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
302154	MSCU1268695	2021-06-16 21:46:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9777216	636017882	FT119E	Vessel	MSC VIVIANA	1.271978728313698	103.768308722207	f	f
302155	MSCU1268695	2021-06-24 21:00:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9777216	636017882	FT119E	Vessel	MSC VIVIANA	22.483333333333334	113.91666666666667	f	f
302156	MSCU1268695	2021-06-27 10:01:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	22.483333333333334	113.91666666666667	f	f
302157	MSCU1268695	2021-08-02 19:01:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7434444	353056000	125N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	f	f
302158	MSCU1268695	2021-08-05 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
302189	MSCU1268695	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
302361	HLBU2194717	2021-06-06 23:00:00	CHITTAGONG	Chattogram	Bangladesh	\N	\N	Gate out empty	Gate out empty	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
302362	HLBU2194717	2021-06-10 23:30:00	CHITTAGONG	Chattogram	Bangladesh	\N	\N	Gate in at origin port	Arrival in	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
302363	HLBU2194717	2021-06-11 11:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Vessel departed	Vessel departed	8987670	353032000	005S	Vessel	WINNER	22.30049832559382	91.79452471970988	f	f
302364	HLBU2194717	2021-06-11 23:27:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel at origin port	Loaded	8987670	353032000	005S	Vessel	WINNER	22.30049832559382	91.79452471970988	f	f
302365	HLBU2194717	2021-06-15 01:24:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Vessel arrived	Vessel arrived	8987670	353032000	005S	Vessel	WINNER	6.916666666666667	79.85	f	f
302366	HLBU2194717	2021-06-15 06:58:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Discharged from vessel	Discharged	8987670	353032000	005S	Vessel	WINNER	6.916666666666667	79.85	f	f
302367	HLBU2194717	2021-06-29 14:24:00	COLOMBO	Colombo	Sri Lanka	\N	\N	Gate in	Arrival in	\N	\N	\N	Truck	\N	6.9270786	79.861243	f	f
302368	HLBU2194717	2021-07-11 08:36:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Loaded on vessel	Loaded	\N	\N	045E	Vessel	ONE HELSINKI	6.916666666666667	79.85	f	f
302369	HLBU2194717	2021-07-11 15:00:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Vessel departed	Vessel departed	\N	\N	045E	Vessel	ONE HELSINKI	6.916666666666667	79.85	f	f
302370	HLBU2194717	2021-07-30 21:06:00	HALIFAX, NS	Halifax	Canada	CAHAL	\N	Vessel arrived at destination port	Vessel arrived	\N	\N	045E	Vessel	ONE HELSINKI	44.6475811	-63.5727683	f	f
302371	HLBU2194717	2021-07-30 21:45:00	HALIFAX, NS	Halifax	Canada	CAHAL	\N	Discharged from vessel	Discharged	\N	\N	045E	Vessel	ONE HELSINKI	44.6475811	-63.5727683	f	f
302372	HLBU2194717	2021-08-02 16:23:00	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.6475811	-63.5727683	f	f
302373	HLBU2194717	2021-08-03 04:00:00	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
302411	HLBU2194717	2021-08-01 03:00:00	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.6475811	-63.5727683	f	t
302435	HLBU2194717	2021-07-30 20:00:00	HALIFAX, NS	Halifax	Canada	CAHAL	\N	Vessel arrival	Vessel arrival	\N	\N	045E	Vessel	ONE HELSINKI	44.6475811	-63.5727683	f	t
302552	TCLU4660335	2021-06-07 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
302553	TCLU4660335	2021-06-07 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
302554	TCLU4660335	2021-06-08 08:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'TAICHUNG 068S' at Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302555	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302556	TCLU4660335	2021-06-13 01:15:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'TAICHUNG 068S' Arrival at Transhipment Port	9359727	416023000	868E	Vessel	TAICHUNG	1.271978728313698	103.768308722207	f	f
304364	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
302557	TCLU4660335	2021-06-13 06:39:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'TAICHUNG 068S' at Transhipment Port	9359727	416023000	868E	Vessel	TAICHUNG	1.271978728313698	103.768308722207	f	f
302558	TCLU4660335	2021-06-25 16:29:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'SEASPAN ADONIS 063E' at Transhipment Port	\N	\N	063E	Vessel	SEASPAN ADONIS	1.271978728313698	103.768308722207	f	f
302559	TCLU4660335	2021-06-26 02:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	063E	Vessel	SEASPAN ADONIS	1.271978728313698	103.768308722207	f	f
302560	TCLU4660335	2021-07-18 20:42:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'SEASPAN ADONIS 063E' Arrival at Port of Discharging	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
302562	TCLU4660335	2021-07-18 22:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'SEASPAN ADONIS 063E' POD Berthing Destination	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
302563	TCLU4660335	2021-07-25 02:10:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'SEASPAN ADONIS 063E' at Port of Discharging	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
302564	TCLU4660335	2021-08-02 17:47:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
302565	TCLU4660335	2021-08-03 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
302569	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302583	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302597	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302611	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302620	TCLU4660335	2021-07-25 07:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
302621	TCLU4660335	2021-07-25 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
302625	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302639	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302653	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302667	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302681	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302695	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302709	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302812	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302826	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302840	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302854	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302868	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302882	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302896	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302910	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302924	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302938	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302952	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302966	TCLU4660335	\N	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'TAICHUNG 068S' Departure from Port of Loading	9359727	416023000	868E	Vessel	TAICHUNG	22.30049832559382	91.79452471970988	f	f
302977	TCLU1529677	2021-06-11 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
302978	TCLU1529677	2021-06-11 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
302979	TCLU1529677	2021-06-14 11:15:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'SOL DELTA 2108S' at Port of Loading	\N	\N	108E	Vessel	SOL DELTA	22.30049832559382	91.79452471970988	f	f
302980	TCLU1529677	2021-06-14 11:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'SOL DELTA 2108S' Departure from Port of Loading	\N	\N	108E	Vessel	SOL DELTA	22.30049832559382	91.79452471970988	f	f
302981	TCLU1529677	2021-06-20 05:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'SOL DELTA 2108S' Arrival at Transhipment Port	\N	\N	108E	Vessel	SOL DELTA	1.271978728313698	103.768308722207	f	f
302982	TCLU1529677	2021-06-20 09:56:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'SOL DELTA 2108S' at Transhipment Port	\N	\N	108E	Vessel	SOL DELTA	1.271978728313698	103.768308722207	f	f
302983	TCLU1529677	2021-06-25 13:03:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'NYK VESTA 072E' at Transhipment Port	9312808	372531000	072E	Vessel	NYK VESTA	1.271978728313698	103.768308722207	f	f
302984	TCLU1529677	2021-06-25 18:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9312808	372531000	072E	Vessel	NYK VESTA	1.271978728313698	103.768308722207	f	f
302985	TCLU1529677	2021-07-20 20:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'NYK VESTA 072E' Arrival at Port of Discharging	9312808	372531000	072E	Vessel	NYK VESTA	34.0522342	-118.2436849	f	f
302987	TCLU1529677	2021-07-24 11:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'NYK VESTA 072E' POD Berthing Destination	9312808	372531000	072E	Vessel	NYK VESTA	34.0522342	-118.2436849	f	f
302988	TCLU1529677	2021-07-26 04:10:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'NYK VESTA 072E' at Port of Discharging	9312808	372531000	072E	Vessel	NYK VESTA	34.0522342	-118.2436849	f	f
302989	TCLU1529677	2021-07-26 09:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
302990	TCLU1529677	2021-07-26 15:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
303145	TGHU4212155	2021-06-08 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
303146	TGHU4212155	2021-06-08 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
303147	TGHU4212155	2021-06-13 23:47:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
303148	TGHU4212155	2021-06-13 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
303149	TGHU4212155	2021-06-15 23:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	XA119A	\N	MSC KYMEA	22.30049832559382	91.79452471970988	f	f
303150	TGHU4212155	2021-06-20 02:16:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	XA121A	\N	MSC KYMEA	6.916666666666667	79.85	f	f
303151	TGHU4212155	2021-06-22 06:05:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Loaded on vessel	Transshipment Loaded	1348342	247102472	IV124A	Vessel	MSC RITA	6.916666666666667	79.85	f	f
303152	TGHU4212155	2021-07-13 23:04:00	NEW YORK	New York	United States	USNYC	\N	Carrier release	Carrier Release	1348342	247102472	124A	Vessel	MSC RITA	40.7	-74	f	f
303153	TGHU4212155	2021-07-21 17:18:00	NEW YORK	New York	United States	USNYC	\N	Discharged from vessel	Discharged	1348342	247102472	124A	Vessel	MSC RITA	40.7	-74	f	f
303154	TGHU4212155	2021-07-27 14:24:00	NEW YORK	New York	United States	USNYC	\N	Gate out	Gate Out Full	\N	\N	\N	\N	\N	40.7	-74	f	f
303428	MEDU1907391	2021-06-08 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
303429	MEDU1907391	2021-06-08 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
303430	MEDU1907391	2021-06-13 23:47:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
303431	MEDU1907391	2021-06-13 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
303432	MEDU1907391	2021-06-15 23:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	XA119A	\N	MSC KYMEA	22.30049832559382	91.79452471970988	f	f
303433	MEDU1907391	2021-06-20 03:22:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	XA121A	\N	MSC KYMEA	6.916666666666667	79.85	f	f
303434	MEDU1907391	2021-06-22 01:55:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Loaded on vessel	Transshipment Loaded	1348342	247102472	IV124A	Vessel	MSC RITA	6.916666666666667	79.85	f	f
303435	MEDU1907391	2021-07-13 23:04:00	NEW YORK	New York	United States	USNYC	\N	Carrier release	Carrier Release	1348342	247102472	124A	Vessel	MSC RITA	40.7	-74	f	f
303436	MEDU1907391	2021-07-21 16:17:00	NEW YORK	New York	United States	USNYC	\N	Discharged from vessel	Discharged	1348342	247102472	124A	Vessel	MSC RITA	40.7	-74	f	f
303437	MEDU1907391	2021-07-23 18:16:00	NEW YORK	New York	United States	USNYC	\N	Gate out	Gate Out Full	\N	\N	\N	\N	\N	40.7	-74	f	f
303438	MEDU1907391	2021-07-29 12:02:00	NEW YORK	New York	United States	USNYC	\N	Gate in empty return	Empty in Container Yard	\N	\N	\N	\N	\N	40.7	-74	f	f
303637	SEGU4468196	2021-06-13 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
303638	SEGU4468196	2021-06-13 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
304367	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
303639	SEGU4468196	2021-06-17 12:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'SOL BANGLADESH 2110S' at Port of Loading	\N	\N	110S	Vessel	SOL BANGLADESH	22.30049832559382	91.79452471970988	f	f
303640	SEGU4468196	2021-06-17 13:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'SOL BANGLADESH 2110S' Departure from Port of Loading	\N	\N	110S	Vessel	SOL BANGLADESH	22.30049832559382	91.79452471970988	f	f
303641	SEGU4468196	2021-06-22 18:10:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Vessel arrival at transshipment port	'SOL BANGLADESH 2110S' Arrival at Transhipment Port	\N	\N	110S	Vessel	SOL BANGLADESH	6.916666666666667	79.85	f	f
303642	SEGU4468196	2021-06-22 20:10:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Vessel berthed in port	'SOL BANGLADESH 2110S' T/S Berthing Destination	\N	\N	110S	Vessel	SOL BANGLADESH	6.916666666666667	79.85	f	f
303643	SEGU4468196	2021-06-23 03:07:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Discharged transshipment	Unloaded from 'SOL BANGLADESH 2110S' at Transhipment Port	\N	\N	110S	Vessel	SOL BANGLADESH	6.916666666666667	79.85	f	f
303644	SEGU4468196	2021-07-11 07:43:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Loaded on vessel at transshipment port	Loaded on 'ONE HELSINKI 045E' at Transhipment Port	\N	\N	045E	Vessel	ONE HELSINKI	6.916666666666667	79.85	f	f
303645	SEGU4468196	2021-07-11 14:54:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	045E	Vessel	ONE HELSINKI	6.916666666666667	79.85	f	f
303646	SEGU4468196	2021-08-02 07:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel arrival	'ONE HELSINKI 045E' Arrival at Port of Discharging	\N	\N	045E	Vessel	ONE HELSINKI	40.7	-74	f	f
303648	SEGU4468196	2021-08-02 10:24:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel berthed in port	'ONE HELSINKI 045E' POD Berthing Destination	\N	\N	045E	Vessel	ONE HELSINKI	40.7	-74	f	f
303649	SEGU4468196	2021-08-02 14:38:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Discharged from vessel	Unloaded from 'ONE HELSINKI 045E' at Port of Discharging	\N	\N	045E	Vessel	ONE HELSINKI	40.7	-74	f	f
303650	SEGU4468196	2021-08-04 11:21:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	f
303651	SEGU4468196	2021-08-04 17:30:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
303665	SEGU4468196	2021-08-02 19:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
303666	SEGU4468196	2021-08-03 01:30:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
303706	SEGU4468196	2021-08-02 04:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel berthed in port	'ONE HELSINKI 045E' POD Berthing Destination	\N	\N	045E	Vessel	ONE HELSINKI	40.7	-74	f	t
303707	SEGU4468196	2021-08-02 06:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Discharged from vessel	Unloaded from 'ONE HELSINKI 045E' at Port of Discharging	\N	\N	045E	Vessel	ONE HELSINKI	40.7	-74	f	t
303710	SEGU4468196	2021-08-02 10:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
303711	SEGU4468196	2021-08-02 16:30:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
303721	SEGU4468196	2021-08-02 01:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel arrival	'ONE HELSINKI 045E' Arrival at Port of Discharging	\N	\N	045E	Vessel	ONE HELSINKI	40.7	-74	f	t
303911	GCXU2210170	2021-06-13 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
303912	GCXU2210170	2021-06-13 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
303913	GCXU2210170	2021-06-17 12:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'SOL BANGLADESH 2110S' at Port of Loading	\N	\N	110S	Vessel	SOL BANGLADESH	22.30049832559382	91.79452471970988	f	f
303914	GCXU2210170	2021-06-17 13:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'SOL BANGLADESH 2110S' Departure from Port of Loading	\N	\N	110S	Vessel	SOL BANGLADESH	22.30049832559382	91.79452471970988	f	f
303915	GCXU2210170	2021-06-22 18:10:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Vessel arrival at transshipment port	'SOL BANGLADESH 2110S' Arrival at Transhipment Port	\N	\N	110S	Vessel	SOL BANGLADESH	6.916666666666667	79.85	f	f
303916	GCXU2210170	2021-06-22 20:10:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Vessel berthed in port	'SOL BANGLADESH 2110S' T/S Berthing Destination	\N	\N	110S	Vessel	SOL BANGLADESH	6.916666666666667	79.85	f	f
303917	GCXU2210170	2021-06-22 22:33:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Discharged transshipment	Unloaded from 'SOL BANGLADESH 2110S' at Transhipment Port	\N	\N	110S	Vessel	SOL BANGLADESH	6.916666666666667	79.85	f	f
303918	GCXU2210170	2021-07-11 11:19:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Loaded on vessel at transshipment port	Loaded on 'ONE HELSINKI 045E' at Transhipment Port	\N	\N	045E	Vessel	ONE HELSINKI	6.916666666666667	79.85	f	f
303919	GCXU2210170	2021-07-11 14:54:00	COLOMBO ,SRI LANKA	Colombo	Sri Lanka	LKCMB	SAGT (SOUTH ASIA GATEWAY TERMINAL)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	045E	Vessel	ONE HELSINKI	6.916666666666667	79.85	f	f
303920	GCXU2210170	2021-08-02 07:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel arrival	'ONE HELSINKI 045E' Arrival at Port of Discharging	\N	\N	045E	Vessel	ONE HELSINKI	40.7	-74	f	f
303922	GCXU2210170	2021-08-02 10:24:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel berthed in port	'ONE HELSINKI 045E' POD Berthing Destination	\N	\N	045E	Vessel	ONE HELSINKI	40.7	-74	f	f
303923	GCXU2210170	2021-08-02 14:06:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Discharged from vessel	Unloaded from 'ONE HELSINKI 045E' at Port of Discharging	\N	\N	045E	Vessel	ONE HELSINKI	40.7	-74	f	f
303924	GCXU2210170	2021-08-02 19:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
303925	GCXU2210170	2021-08-03 01:00:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
303980	GCXU2210170	2021-08-02 04:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel berthed in port	'ONE HELSINKI 045E' POD Berthing Destination	\N	\N	045E	Vessel	ONE HELSINKI	40.7	-74	f	t
303981	GCXU2210170	2021-08-02 06:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Discharged from vessel	Unloaded from 'ONE HELSINKI 045E' at Port of Discharging	\N	\N	045E	Vessel	ONE HELSINKI	40.7	-74	f	t
303984	GCXU2210170	2021-08-02 10:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
303985	GCXU2210170	2021-08-02 16:30:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
303995	GCXU2210170	2021-08-02 01:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel arrival	'ONE HELSINKI 045E' Arrival at Port of Discharging	\N	\N	045E	Vessel	ONE HELSINKI	40.7	-74	f	t
304271	GESU6157476	2021-06-21 12:00:00	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304272	GESU6157476	2021-06-21 12:03:00	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304273	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304274	GESU6157476	2021-07-01 09:12:00	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Feeder departed	Feeder Departure from O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304275	GESU6157476	2021-07-02 02:06:00	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Feeder arrived	Outbound Feeder Arrival at Inland Port	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304276	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304277	GESU6157476	2021-07-02 13:56:00	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Loaded on vessel	Loaded on 'SEASPAN ADONIS 063E' at Port of Loading	\N	\N	063E	Vessel	SEASPAN ADONIS	10.383333333333333	107.08333333333333	f	f
304278	GESU6157476	2021-07-02 20:15:00	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Vessel departed	'SEASPAN ADONIS 063E' Departure from Port of Loading	\N	\N	063E	Vessel	SEASPAN ADONIS	10.383333333333333	107.08333333333333	f	f
304279	GESU6157476	2021-07-18 20:42:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'SEASPAN ADONIS 063E' Arrival at Port of Discharging	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
304280	GESU6157476	2021-07-18 22:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'SEASPAN ADONIS 063E' POD Berthing Destination	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
304281	GESU6157476	2021-07-24 02:09:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'SEASPAN ADONIS 063E' at Port of Discharging	\N	\N	063E	Vessel	SEASPAN ADONIS	34.0522342	-118.2436849	f	f
304282	GESU6157476	2021-07-29 17:48:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
304283	GESU6157476	2021-08-04 08:10:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
304286	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304289	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304296	GESU6157476	2021-07-30 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
304299	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304302	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304312	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304315	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304325	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304328	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304338	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304341	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304351	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304377	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304380	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304390	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304393	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304403	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304406	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304416	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh City	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304419	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304609	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304612	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304622	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304625	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304635	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304638	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304648	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304651	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304661	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304664	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304674	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304677	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304687	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304690	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304700	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304703	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304713	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304716	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304726	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304729	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304739	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304742	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304752	GESU6157476	\N	HO CHI MINH ,VIETNAM	Ho Chi Minh City	Vietnam	VNSGN	CAT LAI TERMINAL	Loaded on feeder	Feeder Loading at O/B Inland Port	\N	\N	\N	\N	\N	10.766666666666667	106.66666666666667	f	f
304755	GESU6157476	\N	CAI MEP ,VIETNAM	Cai Mep	Vietnam	VNCMP	TCIT (TAN CANG CAIMEP INTL TERMINAL)	Discharged from feeder	Water POL Unloading Destination	\N	\N	\N	\N	\N	10.383333333333333	107.08333333333333	f	f
304763	TLLU4443549	2021-06-30 08:26:00	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty container dispatched from Port of Loading to Customer	9366421	565865000	46	Vessel	ASIATIC MOON	20.8449115	106.6880841	f	f
304764	TLLU4443549	2021-06-30 08:27:00	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Export Gate-In to Port of Loading 	Export Gate-In to Port of Loading 	9366421	565865000	46	Vessel	ASIATIC MOON	20.8449115	106.6880841	f	f
304765	TLLU4443549	2021-07-11 04:39:00	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel at origin port	Container was loaded at Port of Loading to Transshipment Port	9366421	565865000	46	Vessel	ASIATIC MOON	20.8449115	106.6880841	f	f
304766	TLLU4443549	2021-07-11 12:50:01	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Vessel departed	Vessel departure from Port of Loading to Transshipment Port	9366421	565865000	46	Vessel	ASIATIC MOON	20.8449115	106.6880841	f	f
304767	TLLU4443549	2021-07-14 07:07:00	DA CHAN BAY (GD), CHINA. PEOPLE'S REPUBLIC	Da Chan Bay (Gd)	China	CNDCB	\N	Vessel arrived	Vessel arrival to Transshipment Port	9366421	565865000	46	Vessel	ASIATIC MOON	22.533333333333335	113.86666666666666	f	f
304768	TLLU4443549	2021-07-14 16:59:00	DA CHAN BAY (GD), CHINA. PEOPLE'S REPUBLIC	Da Chan Bay (Gd)	China	CNDCB	\N	Discharged from vessel at transshipment port	Container was discharged at Transshipment Port	9366421	565865000	46	Vessel	ASIATIC MOON	22.533333333333335	113.86666666666666	f	f
304769	TLLU4443549	2021-07-19 09:48:42	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Carrier release	Carrier Release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
304770	TLLU4443549	2021-07-22 14:40:00	DA CHAN BAY (GD), CHINA. PEOPLE'S REPUBLIC	Da Chan Bay (Gd)	China	CNDCB	\N	Loaded transshipment	Container was loaded at Transsihipment Port to Port of Discharge	\N	\N	4	Vessel	SPYROS V	22.533333333333335	113.86666666666666	f	f
304771	TLLU4443549	2021-07-23 10:45:00	DA CHAN BAY (GD), CHINA. PEOPLE'S REPUBLIC	Da Chan Bay (Gd)	China	CNDCB	\N	Vessel departed	Vessel departure from Transshipment Port to Port of Discharge	\N	\N	4	Vessel	SPYROS V	22.533333333333335	113.86666666666666	f	f
304772	TLLU4443549	2021-08-06 08:00:00	LOS ANGELES (CA), CHINA. PEOPLE'S REPUBLIC	Washington	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	38.9428097	-77.0663637	t	f
304863	TGHU9708791	2021-07-01 21:32:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Gate out empty	Empty container dispatched from inland point to Customer	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
304864	TGHU9708791	2021-07-02 21:09:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Export gate-in from Customer to Port of Loading 	Export gate-in from Customer to Port of Loading 	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
304865	TGHU9708791	2021-07-06 14:14:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Loaded on vessel at origin port	Container was loaded at Port of Loading to Port of Discharge	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
304866	TGHU9708791	2021-07-07 00:12:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Vessel departed	Vessel departure from Port of Loading to Port of Discharge	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
304867	TGHU9708791	2021-07-12 14:21:21	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Carrier release	Carrier Release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
304868	TGHU9708791	2021-07-19 16:11:32	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Customs release	Customs release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
304869	TGHU9708791	2021-07-19 19:07:00	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrival to Port of Discharge	9324863	538007622	10	Vessel	NAVIOS VERDE	34.0522342	-118.2436849	f	f
304870	TGHU9708791	2021-07-20 05:00:00	LOS ANGELES (CA), CHINA. PEOPLE'S REPUBLIC	Washington	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	38.9428097	-77.0663637	t	f
305043	ZCSU7106355	2021-07-01 20:48:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Gate out empty	Empty container dispatched from inland point to Customer	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
305044	ZCSU7106355	2021-07-02 18:16:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Export gate-in from Customer to Port of Loading 	Export gate-in from Customer to Port of Loading 	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
305045	ZCSU7106355	2021-07-06 16:01:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Loaded on vessel at origin port	Container was loaded at Port of Loading to Port of Discharge	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
305046	ZCSU7106355	2021-07-07 00:12:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Vessel departed	Vessel departure from Port of Loading to Port of Discharge	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
305047	ZCSU7106355	2021-07-12 14:21:22	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Carrier release	Carrier Release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
305048	ZCSU7106355	2021-07-19 19:07:00	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrival to Port of Discharge	9324863	538007622	10	Vessel	NAVIOS VERDE	34.0522342	-118.2436849	f	f
305049	ZCSU7106355	2021-07-20 05:00:00	LOS ANGELES (CA), CHINA. PEOPLE'S REPUBLIC	Washington	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	38.9428097	-77.0663637	t	f
305050	ZCSU7106355	2021-07-20 06:01:38	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Customs release	Customs release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
305196	TGBU7240673	2021-07-01 22:49:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Gate out empty	Empty container dispatched from inland point to Customer	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
305197	TGBU7240673	2021-07-02 21:50:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Export gate-in from Customer to Port of Loading 	Export gate-in from Customer to Port of Loading 	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
305198	TGBU7240673	2021-07-06 14:43:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Loaded on vessel at origin port	Container was loaded at Port of Loading to Port of Discharge	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
305199	TGBU7240673	2021-07-07 00:12:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Vessel departed	Vessel departure from Port of Loading to Port of Discharge	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
305200	TGBU7240673	2021-07-12 14:21:53	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Carrier release	Carrier Release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
305201	TGBU7240673	2021-07-19 19:07:00	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrival to Port of Discharge	9324863	538007622	10	Vessel	NAVIOS VERDE	34.0522342	-118.2436849	f	f
305202	TGBU7240673	2021-07-20 05:00:00	LOS ANGELES (CA), CHINA. PEOPLE'S REPUBLIC	Washington	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	38.9428097	-77.0663637	t	f
305203	TGBU7240673	2021-07-20 06:01:38	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Customs release	Customs release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
305349	ZCSU7381803	2021-07-02 08:24:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Gate out empty	Empty container dispatched from inland point to Customer	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
306011	UACU5342430	2021-06-29 23:53:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel at origin port	Loaded	\N	\N	0025S	Vessel	SARERA	22.30049832559382	91.79452471970988	f	f
305350	ZCSU7381803	2021-07-03 17:48:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Export gate-in from Customer to Port of Loading 	Export gate-in from Customer to Port of Loading 	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
305351	ZCSU7381803	2021-07-06 09:37:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Loaded on vessel at origin port	Container was loaded at Port of Loading to Port of Discharge	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
305352	ZCSU7381803	2021-07-07 00:12:00	NINGBO (ZJ), CHINA. PEOPLE'S REPUBLIC	Ningbo	China	CNNBO	\N	Vessel departed	Vessel departure from Port of Loading to Port of Discharge	9324863	538007622	10	Vessel	NAVIOS VERDE	29.866666666666667	121.55	f	f
305353	ZCSU7381803	2021-07-12 14:21:53	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Carrier release	Carrier Release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
305354	ZCSU7381803	2021-07-19 19:07:00	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrival to Port of Discharge	9324863	538007622	10	Vessel	NAVIOS VERDE	34.0522342	-118.2436849	f	f
305355	ZCSU7381803	2021-07-20 05:00:00	LOS ANGELES (CA), CHINA. PEOPLE'S REPUBLIC	Washington	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	38.9428097	-77.0663637	t	f
305356	ZCSU7381803	2021-07-20 06:11:32	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Customs release	Customs release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
305509	TCLU5458442	2021-06-15 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
305510	TCLU5458442	2021-06-15 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
305511	TCLU5458442	2021-06-22 06:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'KOTA WANGI 0078E' at Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
305512	TCLU5458442	2021-06-22 09:15:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'KOTA WANGI 0078E' Departure from Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
305513	TCLU5458442	2021-06-29 13:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'KOTA WANGI 0078E' Arrival at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
305514	TCLU5458442	2021-06-29 15:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'KOTA WANGI 0078E' T/S Berthing Destination	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
305515	TCLU5458442	2021-06-30 07:01:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'KOTA WANGI 0078E' at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
305516	TCLU5458442	2021-07-19 17:04:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE HARBOUR 088E' at Transhipment Port	\N	\N	088E	Vessel	ONE HARBOUR	1.271978728313698	103.768308722207	f	f
305517	TCLU5458442	2021-07-20 00:50:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	088E	Vessel	ONE HARBOUR	1.271978728313698	103.768308722207	f	f
305518	TCLU5458442	2021-08-11 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'ONE HARBOUR 088E' Arrival at Port of Discharging	\N	\N	088E	Vessel	ONE HARBOUR	34.0522342	-118.2436849	f	t
305520	TCLU5458442	2021-08-13 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HARBOUR 088E' POD Berthing Destination	\N	\N	088E	Vessel	ONE HARBOUR	34.0522342	-118.2436849	f	t
305521	TCLU5458442	2021-08-13 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HARBOUR 088E' at Port of Discharging	\N	\N	088E	Vessel	ONE HARBOUR	34.0522342	-118.2436849	f	t
305522	TCLU5458442	2021-08-13 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
305523	TCLU5458442	2021-08-14 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
305619	SEGU2284991	2021-05-27 00:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
305621	SEGU2284991	2021-05-28 00:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded on board	\N	\N	59SA5S	Vessel	CALA PAGURO	22.30049832559382	91.79452471970988	f	f
305622	SEGU2284991	2021-06-03 00:00:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged transshipment	Discharged in transhipment	\N	\N	60SA5N	Vessel	CALA PAGURO	1.271978728313698	103.768308722207	f	f
305623	SEGU2284991	2021-06-10 00:00:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Loaded on board	9454400	235076499	0TUHVE1MA	Vessel	CMA CGM CORTE REAL	1.271978728313698	103.768308722207	f	f
305624	SEGU2284991	2021-07-22 07:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Discharged from vessel	Discharged	9454400	235076499	0TUHWW1MA	Vessel	CMA CGM CORTE REAL	34.0522342	-118.2436849	f	f
305625	SEGU2284991	2021-07-30 07:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Gate out to consignee	Container to consignee	9454400	235076499	0TUHWW1MA	Vessel	CMA CGM CORTE REAL	34.0522342	-118.2436849	f	f
305705	TCNU4564914	2021-05-27 00:00:00	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty container dispatched from inland point to Customer	\N	\N	46	Vessel	TC SYMPHONY	20.8449115	106.6880841	f	f
305706	TCNU4564914	2021-05-27 21:51:00	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Export gate-in from Customer to Port of Loading 	Export gate-in from Customer to Port of Loading 	\N	\N	46	Vessel	TC SYMPHONY	20.8449115	106.6880841	f	f
305707	TCNU4564914	2021-05-28 10:54:00	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel at origin port	Container was loaded at Port of Loading to Transshipment Port	\N	\N	46	Vessel	TC SYMPHONY	20.8449115	106.6880841	f	f
305708	TCNU4564914	2021-05-28 22:40:05	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Vessel departed	Vessel departure from Port of Loading to Transshipment Port	\N	\N	46	Vessel	TC SYMPHONY	20.8449115	106.6880841	f	f
305709	TCNU4564914	2021-06-12 01:15:17	SHANGHAI (SH), CHINA. PEOPLE'S REPUBLIC	Shanghai	China	CNSGH	\N	Vessel arrived	Vessel arrival to Transshipment Port	\N	\N	47	Vessel	TC SYMPHONY	31.233333333333334	121.48333333333333	f	f
305710	TCNU4564914	2021-06-12 12:47:00	SHANGHAI (SH), CHINA. PEOPLE'S REPUBLIC	Shanghai	China	CNSGH	\N	Discharged from vessel at transshipment port	Container was discharged at Transshipment Port	\N	\N	47	Vessel	TC SYMPHONY	31.233333333333334	121.48333333333333	f	f
305712	TCNU4564914	2021-06-24 01:00:00	SHANGHAI (SH), CHINA. PEOPLE'S REPUBLIC	Shanghai	China	CNSGH	\N	Loaded transshipment	Container was loaded at Transsihipment Port to Port of Discharge	\N	\N	9	Vessel	NAVIOS CHRYSALIS	31.233333333333334	121.48333333333333	f	f
305713	TCNU4564914	2021-06-24 05:00:00	SHANGHAI (SH), CHINA. PEOPLE'S REPUBLIC	Shanghai	China	CNSGH	\N	Vessel departed	Vessel departure from Transshipment Port to Port of Discharge	\N	\N	9	Vessel	NAVIOS CHRYSALIS	31.233333333333334	121.48333333333333	f	f
305714	TCNU4564914	2021-07-06 16:22:49	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Customs release	Customs release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
305715	TCNU4564914	2021-07-09 16:07:00	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrival to Port of Discharge	\N	\N	9	Vessel	NAVIOS CHRYSALIS	34.0522342	-118.2436849	f	f
305716	TCNU4564914	2021-07-10 02:00:00	LOS ANGELES (CA), CHINA. PEOPLE'S REPUBLIC	Washington	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	38.9428097	-77.0663637	t	f
305717	TCNU4564914	2021-07-13 08:26:11	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Carrier release	Carrier Release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
305718	TCNU4564914	2021-07-24 13:57:00	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Available for release / delivery	Container is available to be released / delivered	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
305719	TCNU4564914	2021-07-24 20:57:00	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Discharged from vessel	Container was discharged at Port of Destination	\N	\N	9	Vessel	NAVIOS CHRYSALIS	34.0522342	-118.2436849	f	f
305791	NYKU4627364	2021-06-16 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
305792	NYKU4627364	2021-06-16 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
305793	NYKU4627364	2021-06-22 06:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'KOTA WANGI 0078E' at Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
305794	NYKU4627364	2021-06-22 09:15:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'KOTA WANGI 0078E' Departure from Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
305795	NYKU4627364	2021-06-29 13:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'KOTA WANGI 0078E' Arrival at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
305796	NYKU4627364	2021-06-29 15:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'KOTA WANGI 0078E' T/S Berthing Destination	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
305797	NYKU4627364	2021-06-30 08:25:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'KOTA WANGI 0078E' at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
305798	NYKU4627364	2021-07-11 20:49:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'YM WELLNESS 028E' at Transhipment Port	9704623	477737600	028E	Vessel	YM WELLNESS	1.271978728313698	103.768308722207	f	f
305799	NYKU4627364	2021-07-11 21:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9704623	477737600	028E	Vessel	YM WELLNESS	1.271978728313698	103.768308722207	f	f
305800	NYKU4627364	2021-08-12 11:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'YM WELLNESS 028E' Arrival at Port of Discharging	9704623	477737600	028E	Vessel	YM WELLNESS	33.766666666666666	-118.18333333333334	f	t
305802	NYKU4627364	2021-08-12 13:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'YM WELLNESS 028E' POD Berthing Destination	9704623	477737600	028E	Vessel	YM WELLNESS	33.766666666666666	-118.18333333333334	f	t
305803	NYKU4627364	2021-08-12 14:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'YM WELLNESS 028E' at Port of Discharging	9704623	477737600	028E	Vessel	YM WELLNESS	33.766666666666666	-118.18333333333334	f	t
305804	NYKU4627364	2021-08-12 19:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
305805	NYKU4627364	2021-08-13 01:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
305851	NYKU5238686	2021-06-16 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
305852	NYKU5238686	2021-06-16 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
305853	NYKU5238686	2021-06-22 06:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'KOTA WANGI 0078E' at Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
305854	NYKU5238686	2021-06-22 09:15:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'KOTA WANGI 0078E' Departure from Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
305855	NYKU5238686	2021-06-29 13:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'KOTA WANGI 0078E' Arrival at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
305856	NYKU5238686	2021-06-29 15:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'KOTA WANGI 0078E' T/S Berthing Destination	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
305857	NYKU5238686	2021-06-30 04:19:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'KOTA WANGI 0078E' at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
305858	NYKU5238686	2021-07-17 16:57:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
305859	NYKU5238686	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
305860	NYKU5238686	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
305862	NYKU5238686	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
305863	NYKU5238686	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
305864	NYKU5238686	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
305865	NYKU5238686	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
305911	AXIU1365550	2021-06-16 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
305912	AXIU1365550	2021-06-16 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
305913	AXIU1365550	2021-06-22 06:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'KOTA WANGI 0078E' at Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
305914	AXIU1365550	2021-06-22 09:15:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'KOTA WANGI 0078E' Departure from Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
305915	AXIU1365550	2021-06-29 13:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'KOTA WANGI 0078E' Arrival at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
305916	AXIU1365550	2021-06-29 15:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'KOTA WANGI 0078E' T/S Berthing Destination	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
305917	AXIU1365550	2021-06-30 10:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'KOTA WANGI 0078E' at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
305918	AXIU1365550	2021-07-17 18:41:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
305919	AXIU1365550	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
305920	AXIU1365550	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
305922	AXIU1365550	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
305923	AXIU1365550	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
305924	AXIU1365550	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
305925	AXIU1365550	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
305971	OOCU7821056	2021-07-02 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
305972	OOCU7821056	2021-07-02 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
305974	OOCU7821056	2021-07-05 18:30:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
305975	OOCU7821056	2021-07-12 09:08:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
305976	OOCU7821056	2021-07-30 01:56:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	\N	244750455	0TUINE1MA	Vessel	EDISON	1.271978728313698	103.768308722207	f	f
305977	OOCU7821056	2021-08-25 23:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
306008	UACU5342430	2021-06-27 23:00:00	CHITTAGONG	Chattogram	Bangladesh	\N	\N	Gate out empty	Gate out empty	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306009	UACU5342430	2021-06-29 14:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Vessel departed	Vessel departed	\N	\N	0025S	Vessel	SARERA	22.30049832559382	91.79452471970988	f	f
306010	UACU5342430	2021-06-29 23:30:00	CHITTAGONG	Chattogram	Bangladesh	\N	\N	Gate in at origin port	Arrival in	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306092	OOCU7443038	2021-08-21 08:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
306013	UACU5342430	2021-07-06 04:46:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel	Discharged	\N	\N	0025S	Vessel	SARERA	1.271978728313698	103.768308722207	f	f
306014	UACU5342430	2021-07-18 17:05:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Loaded	9286255	636092883	010E	Vessel	CONTI ANNAPURNA	1.271978728313698	103.768308722207	f	f
306015	UACU5342430	2021-07-19 06:36:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Vessel departed	Vessel departed	9286255	636092883	010E	Vessel	CONTI ANNAPURNA	1.271978728313698	103.768308722207	f	f
306016	UACU5342430	2021-08-09 20:00:00	HALIFAX, NS	Halifax	Canada	CAHAL	\N	Vessel arrival	Vessel arrival	9286255	636092883	010E	Vessel	CONTI ANNAPURNA	44.64876350000001	-63.5752387	f	t
306017	UACU5342430	2021-08-11 03:00:00	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.64876350000001	-63.5752387	f	t
306018	UACU5342430	2021-08-12 04:00:00	MONTREAL, QC	Montreal	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	45.5016889	-73.567256	f	t
306026	CAIU9428331	2021-07-02 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306027	CAIU9428331	2021-07-02 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306029	CAIU9428331	2021-07-05 06:30:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
306030	CAIU9428331	2021-07-12 12:12:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
306031	CAIU9428331	2021-07-30 00:48:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	\N	244750455	0TUINE1MA	Vessel	EDISON	1.271978728313698	103.768308722207	f	f
306032	CAIU9428331	2021-08-25 23:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
306044	CSLU6182287	2021-07-02 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306045	CSLU6182287	2021-07-02 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306047	CSLU6182287	2021-07-05 18:30:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
306048	CSLU6182287	2021-07-13 09:06:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
306049	CSLU6182287	2021-07-29 20:24:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	\N	244750455	0TUINE1MA	Vessel	EDISON	1.271978728313698	103.768308722207	f	f
306050	CSLU6182287	2021-08-25 23:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
306058	CBHU5816262	2021-07-02 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306059	CBHU5816262	2021-07-02 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306061	CBHU5816262	2021-07-05 18:30:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
306062	CBHU5816262	2021-07-12 06:57:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
306063	CBHU5816262	2021-07-29 10:39:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	\N	244750455	0TUINE1MA	Vessel	EDISON	1.271978728313698	103.768308722207	f	f
306064	CBHU5816262	2021-08-25 23:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
306072	BEAU2044860	2021-06-22 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306073	BEAU2044860	2021-06-22 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306075	BEAU2044860	2021-06-25 09:25:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
306076	BEAU2044860	2021-07-03 16:27:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
306077	BEAU2044860	2021-07-14 17:09:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	\N	\N	0TUIFE1MA	Vessel	CMA CGM T. JEFFERSON	1.271978728313698	103.768308722207	f	f
306078	BEAU2044860	2021-08-21 08:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
306086	OOCU7443038	2021-06-22 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306087	OOCU7443038	2021-06-22 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306089	OOCU7443038	2021-06-25 09:25:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
306090	OOCU7443038	2021-07-03 03:44:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
306091	OOCU7443038	2021-07-14 09:23:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	\N	\N	0TUIFE1MA	Vessel	CMA CGM T. JEFFERSON	1.271978728313698	103.768308722207	f	f
306100	OOLU1245915	2021-07-02 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306101	OOLU1245915	2021-07-02 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306103	OOLU1245915	2021-07-05 18:30:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
306104	OOLU1245915	2021-07-12 20:04:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
306105	OOLU1245915	2021-07-29 10:39:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	\N	244750455	0TUINE1MA	Vessel	EDISON	1.271978728313698	103.768308722207	f	f
306106	OOLU1245915	2021-08-25 23:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
306114	CCLU7975366	2021-07-02 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306115	CCLU7975366	2021-07-02 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306117	CCLU7975366	2021-07-05 18:30:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
306118	CCLU7975366	2021-07-12 09:05:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
306119	CCLU7975366	2021-07-29 13:23:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	\N	244750455	0TUINE1MA	Vessel	EDISON	1.271978728313698	103.768308722207	f	f
306120	CCLU7975366	2021-08-25 23:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
306128	DFSU7284047	2021-07-02 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306129	DFSU7284047	2021-07-02 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306131	DFSU7284047	2021-07-05 18:30:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
306132	DFSU7284047	2021-07-12 18:14:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
306133	DFSU7284047	2021-07-29 13:28:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	\N	244750455	0TUINE1MA	Vessel	EDISON	1.271978728313698	103.768308722207	f	f
306134	DFSU7284047	2021-08-25 23:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
306142	CAIU8016495	2021-07-03 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306143	CAIU8016495	2021-07-03 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306144	CAIU8016495	2021-07-06 23:47:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306145	CAIU8016495	2021-07-06 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306146	CAIU8016495	2021-07-07 21:43:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	SC122R	\N	MSC JUANITA F	22.30049832559382	91.79452471970988	f	f
306147	CAIU8016495	2021-07-13 05:40:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	SC123A	\N	MSC JUANITA F	6.916666666666667	79.85	f	f
306148	CAIU8016495	2021-07-19 22:53:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Loaded on vessel	Transshipment Loaded	\N	\N	IV128A	\N	MSC TOMOKO	6.916666666666667	79.85	f	f
306149	CAIU8016495	2021-08-16 23:00:00	NEW YORK	New York	United States	USNYC	\N	Vessel arrived at destination port	Estimated Time of Arrival	\N	\N	\N	\N	MSC TOMOKO	40.7	-74	t	t
306165	TGCU5008699	2021-07-03 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306166	TGCU5008699	2021-07-03 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306167	TGCU5008699	2021-07-06 23:47:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306168	TGCU5008699	2021-07-06 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306169	TGCU5008699	2021-07-07 21:43:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	SC122R	\N	MSC JUANITA F	22.30049832559382	91.79452471970988	f	f
306170	TGCU5008699	2021-07-13 06:46:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	SC123A	\N	MSC JUANITA F	6.916666666666667	79.85	f	f
306171	TGCU5008699	2021-07-20 07:59:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Loaded on vessel	Transshipment Loaded	\N	\N	IV128A	\N	MSC TOMOKO	6.916666666666667	79.85	f	f
306172	TGCU5008699	2021-08-16 23:00:00	NEW YORK	New York	United States	USNYC	\N	Vessel arrived at destination port	Estimated Time of Arrival	\N	\N	\N	\N	MSC TOMOKO	40.7	-74	t	t
306197	TRHU6250958	2021-07-03 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306198	TRHU6250958	2021-07-03 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306199	TRHU6250958	2021-07-05 23:45:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306200	TRHU6250958	2021-07-05 23:48:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306201	TRHU6250958	2021-07-07 21:43:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	SC122R	\N	MSC JUANITA F	22.30049832559382	91.79452471970988	f	f
306202	TRHU6250958	2021-07-13 06:44:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	SC123A	\N	MSC JUANITA F	6.916666666666667	79.85	f	f
306203	TRHU6250958	2021-07-20 08:54:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Loaded on vessel	Transshipment Loaded	\N	\N	IV128A	\N	MSC TOMOKO	6.916666666666667	79.85	f	f
306204	TRHU6250958	2021-08-16 23:00:00	NEW YORK	New York	United States	USNYC	\N	Vessel arrived at destination port	Estimated Time of Arrival	\N	\N	\N	\N	MSC TOMOKO	40.7	-74	t	t
306229	CBHU6290980	2021-06-29 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306230	CBHU6290980	2021-06-29 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306232	CBHU6290980	2021-07-06 06:30:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
306233	CBHU6290980	2021-07-15 01:21:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
306234	CBHU6290980	2021-07-29 12:46:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	\N	244750455	0TUINE1MA	Vessel	EDISON	1.271978728313698	103.768308722207	f	f
306235	CBHU6290980	2021-08-25 23:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
306252	CSNU1076762	2021-07-09 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306253	CSNU1076762	2021-07-09 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306255	CSNU1076762	2021-07-13 13:18:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
306256	CSNU1076762	2021-07-20 05:39:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
306257	CSNU1076762	2021-09-02 11:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
306265	TEMU0096163	2021-07-06 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306266	TEMU0096163	2021-07-06 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
306268	TEMU0096163	2021-07-11 10:15:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
306269	TEMU0096163	2021-07-17 21:49:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
306270	TEMU0096163	2021-09-02 11:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
306277	TRHU2656450	2021-07-15 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306278	TRHU2656450	2021-07-15 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
306279	TRHU2656450	2021-07-19 05:12:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'HAIAN EAST 0071E' at Port of Loading	\N	\N	071E	Vessel	HAIAN EAST	22.30049832559382	91.79452471970988	f	f
306280	TRHU2656450	2021-07-19 06:50:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'HAIAN EAST 0071E' Departure from Port of Loading	\N	\N	071E	Vessel	HAIAN EAST	22.30049832559382	91.79452471970988	f	f
306281	TRHU2656450	2021-07-27 21:35:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'HAIAN EAST 0071E' Arrival at Transhipment Port	\N	\N	071E	Vessel	HAIAN EAST	1.271978728313698	103.768308722207	f	f
306282	TRHU2656450	2021-07-29 05:03:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'HAIAN EAST 0071E' at Transhipment Port	\N	\N	071E	Vessel	HAIAN EAST	1.271978728313698	103.768308722207	f	f
306283	TRHU2656450	2021-08-07 03:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'NYK ORION 067E' at Transhipment Port	\N	\N	067E	Vessel	NYK ORION	1.271978728313698	103.768308722207	f	t
306284	TRHU2656450	2021-08-07 18:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	067E	Vessel	NYK ORION	1.271978728313698	103.768308722207	f	t
306285	TRHU2656450	2021-08-31 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'NYK ORION 067E' Arrival at Port of Discharging	\N	\N	067E	Vessel	NYK ORION	34.0522342	-118.2436849	f	t
306287	TRHU2656450	2021-09-02 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'NYK ORION 067E' POD Berthing Destination	\N	\N	067E	Vessel	NYK ORION	34.0522342	-118.2436849	f	t
306288	TRHU2656450	2021-09-02 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'NYK ORION 067E' at Port of Discharging	\N	\N	067E	Vessel	NYK ORION	34.0522342	-118.2436849	f	t
306289	TRHU2656450	2021-09-02 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
306290	TRHU2656450	2021-09-03 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
306297	TRHU2656450	2021-08-07 11:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'NYK ORION 067E' at Transhipment Port	\N	\N	067E	Vessel	NYK ORION	1.271978728313698	103.768308722207	f	t
306298	TRHU2656450	2021-08-08 02:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	067E	Vessel	NYK ORION	1.271978728313698	103.768308722207	f	t
306299	TRHU2656450	2021-08-29 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'NYK ORION 067E' Arrival at Port of Discharging	\N	\N	067E	Vessel	NYK ORION	34.0522342	-118.2436849	f	t
306311	CAIU7405595	2021-06-04 19:45:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
306312	CAIU7405595	2021-06-06 04:09:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
306313	CAIU7405595	2021-06-07 19:58:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	9326768	371110000	0042N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
306314	CAIU7405595	2021-06-08 04:35:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	9326768	371110000	0042N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
306315	CAIU7405595	2021-06-18 17:00:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	9326768	371110000	0042N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
306316	CAIU7405595	2021-06-18 18:00:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel berthed in port	Vessel Berthing at T/S Port	9326768	371110000	0042N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
306317	CAIU7405595	2021-07-11 21:50:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	35.13333333333333	129.05	f	f
306318	CAIU7405595	2021-07-12 13:55:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	35.13333333333333	129.05	f	f
306319	CAIU7405595	2021-07-23 22:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Vessel Arrival at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
306320	CAIU7405595	2021-08-03 10:54:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel berthed in port	Vessel Berthing at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
306321	CAIU7405595	2021-08-04 04:10:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel Unloading at POD	Vessel Unloading at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
306395	HMMU6008101	2021-06-05 01:22:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
306396	HMMU6008101	2021-06-06 04:14:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
306397	HMMU6008101	2021-06-07 20:06:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	9326768	371110000	0042N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
306398	HMMU6008101	2021-06-08 04:35:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	9326768	371110000	0042N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
306399	HMMU6008101	2021-06-18 17:00:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	9326768	371110000	0042N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
306400	HMMU6008101	2021-06-18 18:00:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel berthed in port	Vessel Berthing at T/S Port	9326768	371110000	0042N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
306401	HMMU6008101	2021-07-12 05:34:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	35.13333333333333	129.05	f	f
306402	HMMU6008101	2021-07-12 13:55:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	35.13333333333333	129.05	f	f
306403	HMMU6008101	2021-07-23 22:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Vessel Arrival at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
306404	HMMU6008101	2021-08-03 10:54:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel berthed in port	Vessel Berthing at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
306507	BSIU9264228	2021-06-10 22:20:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
306508	BSIU9264228	2021-06-11 21:49:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
306509	BSIU9264228	2021-06-16 11:21:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	\N	\N	0061N	Vessel	HONGKONG BRIDGE	-6.133333333333334	106.83333333333333	f	f
306510	BSIU9264228	2021-06-17 02:12:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	\N	\N	0061N	Vessel	HONGKONG BRIDGE	-6.133333333333334	106.83333333333333	f	f
306511	BSIU9264228	2021-07-01 23:04:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	\N	\N	0061N	Vessel	HONGKONG BRIDGE	34.93333333333333	127.7	f	f
306512	BSIU9264228	2021-07-02 01:04:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel berthed in port	Vessel Berthing at T/S Port	\N	\N	0061N	Vessel	HONGKONG BRIDGE	34.93333333333333	127.7	f	f
306513	BSIU9264228	2021-07-09 17:50:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate Out from T/S Terminal	Truck Gate Out from T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
306514	BSIU9264228	2021-07-09 17:54:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate In to T/S Terminal	Truck Gate In to T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
306515	BSIU9264228	2021-07-10 14:13:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	34.93333333333333	127.7	f	f
306516	BSIU9264228	2021-07-10 19:00:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	34.93333333333333	127.7	f	f
306517	BSIU9264228	2021-07-23 22:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Vessel Arrival at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
306518	BSIU9264228	2021-08-03 10:54:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel berthed in port	Vessel Berthing at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
306630	KOCU4209016	2021-06-10 22:35:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
306631	KOCU4209016	2021-06-11 21:46:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
306632	KOCU4209016	2021-06-16 22:06:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	\N	\N	0061N	Vessel	HONGKONG BRIDGE	-6.133333333333334	106.83333333333333	f	f
306633	KOCU4209016	2021-06-17 02:12:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	\N	\N	0061N	Vessel	HONGKONG BRIDGE	-6.133333333333334	106.83333333333333	f	f
306634	KOCU4209016	2021-07-01 23:04:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	\N	\N	0061N	Vessel	HONGKONG BRIDGE	34.93333333333333	127.7	f	f
306635	KOCU4209016	2021-07-02 01:04:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel berthed in port	Vessel Berthing at T/S Port	\N	\N	0061N	Vessel	HONGKONG BRIDGE	34.93333333333333	127.7	f	f
306636	KOCU4209016	2021-07-09 16:52:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate Out from T/S Terminal	Truck Gate Out from T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
306637	KOCU4209016	2021-07-09 16:56:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate In to T/S Terminal	Truck Gate In to T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
306638	KOCU4209016	2021-07-10 14:10:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	34.93333333333333	127.7	f	f
306639	KOCU4209016	2021-07-10 19:00:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	34.93333333333333	127.7	f	f
306640	KOCU4209016	2021-07-23 22:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Vessel Arrival at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
306641	KOCU4209016	2021-08-03 10:54:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel berthed in port	Vessel Berthing at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
306776	HMMU6243292	2021-06-11 01:31:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
306777	HMMU6243292	2021-06-11 21:54:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
306778	HMMU6243292	2021-06-16 11:24:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	\N	\N	0061N	Vessel	HONGKONG BRIDGE	-6.098516936064017	106.9023760515587	f	f
306779	HMMU6243292	2021-06-17 02:12:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	\N	\N	0061N	Vessel	HONGKONG BRIDGE	-6.098516936064017	106.9023760515587	f	f
306780	HMMU6243292	2021-07-01 23:04:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	\N	\N	0061N	Vessel	HONGKONG BRIDGE	34.93333333333333	127.7	f	f
306781	HMMU6243292	2021-07-02 01:04:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel berthed in port	Vessel Berthing at T/S Port	\N	\N	0061N	Vessel	HONGKONG BRIDGE	34.93333333333333	127.7	f	f
306782	HMMU6243292	2021-07-08 15:39:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate Out from T/S Terminal	Truck Gate Out from T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
306783	HMMU6243292	2021-07-08 15:41:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate In to T/S Terminal	Truck Gate In to T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
306784	HMMU6243292	2021-07-10 11:15:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	34.93333333333333	127.7	f	f
306785	HMMU6243292	2021-07-10 19:00:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	34.93333333333333	127.7	f	f
306786	HMMU6243292	2021-07-23 22:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Vessel Arrival at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
306910	HMMU6084523	2021-06-16 23:30:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
306911	HMMU6084523	2021-06-17 21:33:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
306912	HMMU6084523	2021-06-23 05:31:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	8412144	548752000	0015N	Vessel	ALABAMA	-6.133333333333334	106.83333333333333	f	f
306913	HMMU6084523	2021-06-23 15:30:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	8412144	548752000	0015N	Vessel	ALABAMA	-6.133333333333334	106.83333333333333	f	f
306914	HMMU6084523	2021-07-06 00:00:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	8412144	548752000	0015N	Vessel	ALABAMA	34.93333333333333	127.7	f	f
306915	HMMU6084523	2021-07-06 01:30:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel berthed in port	Vessel Berthing at T/S Port	8412144	548752000	0015N	Vessel	ALABAMA	34.93333333333333	127.7	f	f
306916	HMMU6084523	2021-07-06 13:23:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate Out from T/S Terminal	Truck Gate Out from T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
306917	HMMU6084523	2021-07-06 13:25:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate In to T/S Terminal	Truck Gate In to T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
306918	HMMU6084523	2021-07-30 14:52:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
306919	HMMU6084523	2021-07-30 17:48:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
306920	HMMU6084523	2021-08-27 13:00:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
306942	HMMU6084523	2021-08-24 09:12:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
322709	HAMU1269494	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.6475811	-63.5727683	f	t
306963	HMMU6084523	2021-07-30 17:54:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
306964	HMMU6084523	2021-08-24 06:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
306985	HMMU6084523	2021-07-30 17:30:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
306986	HMMU6084523	2021-08-24 03:30:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
307053	TCNU5067609	2021-06-17 03:43:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
307054	TCNU5067609	2021-06-17 21:35:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
307055	TCNU5067609	2021-06-23 05:46:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	8412144	548752000	0015N	Vessel	ALABAMA	-6.098516936064017	106.9023760515587	f	f
307056	TCNU5067609	2021-06-23 15:30:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	8412144	548752000	0015N	Vessel	ALABAMA	-6.098516936064017	106.9023760515587	f	f
307057	TCNU5067609	2021-07-06 00:00:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	8412144	548752000	0015N	Vessel	ALABAMA	34.93333333333333	127.7	f	f
307058	TCNU5067609	2021-07-06 01:30:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel berthed in port	Vessel Berthing at T/S Port	8412144	548752000	0015N	Vessel	ALABAMA	34.93333333333333	127.7	f	f
307059	TCNU5067609	2021-07-06 17:16:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate Out from T/S Terminal	Truck Gate Out from T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
307060	TCNU5067609	2021-07-06 17:18:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate In to T/S Terminal	Truck Gate In to T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
307061	TCNU5067609	2021-07-30 14:42:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
307062	TCNU5067609	2021-07-30 17:48:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
307063	TCNU5067609	2021-08-27 13:00:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
307074	TCNU5067609	2021-08-24 09:12:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
307084	TCNU5067609	2021-07-30 17:54:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
307085	TCNU5067609	2021-08-24 06:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
307106	TCNU5067609	2021-07-30 17:30:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
307107	TCNU5067609	2021-08-24 03:30:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
307207	KOCU4318254	2021-06-17 22:52:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
307208	KOCU4318254	2021-06-18 20:46:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
307209	KOCU4318254	2021-06-23 05:40:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	8412144	548752000	0015N	Vessel	ALABAMA	-6.098516936064017	106.9023760515587	f	f
307210	KOCU4318254	2021-06-23 15:30:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	8412144	548752000	0015N	Vessel	ALABAMA	-6.098516936064017	106.9023760515587	f	f
307211	KOCU4318254	2021-07-06 00:00:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	8412144	548752000	0015N	Vessel	ALABAMA	34.93333333333333	127.7	f	f
307212	KOCU4318254	2021-07-06 01:30:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel berthed in port	Vessel Berthing at T/S Port	8412144	548752000	0015N	Vessel	ALABAMA	34.93333333333333	127.7	f	f
307213	KOCU4318254	2021-07-06 17:20:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate Out from T/S Terminal	Truck Gate Out from T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
307214	KOCU4318254	2021-07-06 17:23:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate In to T/S Terminal	Truck Gate In to T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
307215	KOCU4318254	2021-07-30 14:36:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
307216	KOCU4318254	2021-07-30 17:48:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
307217	KOCU4318254	2021-08-27 13:00:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
307228	KOCU4318254	2021-08-24 09:12:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
307260	KOCU4318254	2021-07-30 17:54:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
307261	KOCU4318254	2021-08-24 06:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
322710	HAMU1269494	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
307271	KOCU4318254	2021-07-30 17:30:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
307272	KOCU4318254	2021-08-24 03:30:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
307350	KOCU4178194	2021-06-17 19:46:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
307351	KOCU4178194	2021-06-19 00:13:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
307352	KOCU4178194	2021-06-23 06:02:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	8412144	548752000	0015N	Vessel	ALABAMA	-6.133333333333334	106.83333333333333	f	f
307353	KOCU4178194	2021-06-23 15:30:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	8412144	548752000	0015N	Vessel	ALABAMA	-6.133333333333334	106.83333333333333	f	f
307354	KOCU4178194	2021-07-06 00:00:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	8412144	548752000	0015N	Vessel	ALABAMA	34.93333333333333	127.7	f	f
307355	KOCU4178194	2021-07-06 01:30:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel berthed in port	Vessel Berthing at T/S Port	8412144	548752000	0015N	Vessel	ALABAMA	34.93333333333333	127.7	f	f
307356	KOCU4178194	2021-07-06 13:21:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate Out from T/S Terminal	Truck Gate Out from T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
307357	KOCU4178194	2021-07-06 13:23:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate In to T/S Terminal	Truck Gate In to T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
307358	KOCU4178194	2021-07-30 14:48:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
307359	KOCU4178194	2021-07-30 17:48:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
307360	KOCU4178194	2021-08-27 13:00:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
307371	KOCU4178194	2021-08-24 09:12:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
307381	KOCU4178194	2021-07-30 17:54:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
307382	KOCU4178194	2021-08-24 06:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
307392	KOCU4178194	2021-07-30 17:30:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
307393	KOCU4178194	2021-08-24 03:30:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
307482	FCIU9234632	2021-06-19 09:25:00	SEMARANG ,INDONESIA	Semarang	Indonesia	IDSRG	SRICON LOGISTIK	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.966666666666667	110.48333333333333	f	f
307483	FCIU9234632	2021-06-21 17:19:00	SEMARANG ,INDONESIA	Semarang	Indonesia	IDSRG	TERMINAL PETIKEMAS SEMARANG	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.966666666666667	110.48333333333333	f	f
307484	FCIU9234632	2021-06-24 17:29:00	SEMARANG ,INDONESIA	Semarang	Indonesia	IDSRG	TERMINAL PETIKEMAS SEMARANG	Loaded on vessel	Loaded on 'TRADER 032N' at Port of Loading	9756925	548950000	032W	Vessel	TRADER	-6.966666666666667	110.48333333333333	f	f
307485	FCIU9234632	2021-06-24 19:35:00	SEMARANG ,INDONESIA	Semarang	Indonesia	IDSRG	TERMINAL PETIKEMAS SEMARANG	Vessel departed	'TRADER 032N' Departure from Port of Loading	9756925	548950000	032W	Vessel	TRADER	-6.966666666666667	110.48333333333333	f	f
307486	FCIU9234632	2021-06-29 18:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'TRADER 032N' Arrival at Transhipment Port	9756925	548950000	032W	Vessel	TRADER	1.271978728313698	103.768308722207	f	f
307487	FCIU9234632	2021-06-29 20:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'TRADER 032N' T/S Berthing Destination	9756925	548950000	032W	Vessel	TRADER	1.271978728313698	103.768308722207	f	f
307488	FCIU9234632	2021-06-29 21:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'TRADER 032N' at Transhipment Port	9756925	548950000	032W	Vessel	TRADER	1.271978728313698	103.768308722207	f	f
307489	FCIU9234632	2021-07-06 16:35:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'YM WIDTH 023E' at Transhipment Port	\N	\N	023E	Vessel	YM WIDTH	1.271978728313698	103.768308722207	f	f
307490	FCIU9234632	2021-07-07 08:25:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	YM WIDTH	1.271978728313698	103.768308722207	f	f
307491	FCIU9234632	2021-08-02 19:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel arrival	'YM WIDTH 023E' Arrival at Port of Discharging	\N	\N	023E	Vessel	YM WIDTH	40.7	-74	f	f
307493	FCIU9234632	2021-08-02 22:34:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel berthed in port	'YM WIDTH 023E' POD Berthing Destination	\N	\N	023E	Vessel	YM WIDTH	40.7	-74	f	f
307494	FCIU9234632	2021-08-03 23:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Discharged from vessel	Unloaded from 'YM WIDTH 023E' at Port of Discharging	\N	\N	023E	Vessel	YM WIDTH	40.7	-74	f	f
307495	FCIU9234632	2021-08-04 03:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
307496	FCIU9234632	2021-08-04 09:30:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
308155	TCLU5847568	2021-07-28 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Loaded on rail	Full Load on rail for import	\N	\N	\N	\N	\N	36.8507689	-76.28587259999999	f	f
307509	FCIU9234632	2021-08-02 23:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Discharged from vessel	Unloaded from 'YM WIDTH 023E' at Port of Discharging	9708447	477129300	023E	Vessel	YM WIDTH	40.7	-74	f	t
307510	FCIU9234632	2021-08-03 04:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
307511	FCIU9234632	2021-08-03 10:00:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
307538	FCIU9234632	2021-08-02 22:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel berthed in port	'YM WIDTH 023E' POD Berthing Destination	9708447	477129300	023E	Vessel	YM WIDTH	40.7	-74	f	t
307687	FDCU0634031	2021-06-19 08:36:00	SEMARANG ,INDONESIA	Semarang	Indonesia	IDSRG	SRICON LOGISTIK	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.966666666666667	110.48333333333333	f	f
307688	FDCU0634031	2021-06-21 22:46:00	SEMARANG ,INDONESIA	Semarang	Indonesia	IDSRG	TERMINAL PETIKEMAS SEMARANG	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.966666666666667	110.48333333333333	f	f
307689	FDCU0634031	2021-06-24 15:01:00	SEMARANG ,INDONESIA	Semarang	Indonesia	IDSRG	TERMINAL PETIKEMAS SEMARANG	Loaded on vessel	Loaded on 'TRADER 032N' at Port of Loading	9756925	548950000	032W	Vessel	TRADER	-6.966666666666667	110.48333333333333	f	f
307690	FDCU0634031	2021-06-24 19:35:00	SEMARANG ,INDONESIA	Semarang	Indonesia	IDSRG	TERMINAL PETIKEMAS SEMARANG	Vessel departed	'TRADER 032N' Departure from Port of Loading	9756925	548950000	032W	Vessel	TRADER	-6.966666666666667	110.48333333333333	f	f
307691	FDCU0634031	2021-06-29 18:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'TRADER 032N' Arrival at Transhipment Port	9756925	548950000	032W	Vessel	TRADER	1.271978728313698	103.768308722207	f	f
307692	FDCU0634031	2021-06-29 20:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'TRADER 032N' T/S Berthing Destination	9756925	548950000	032W	Vessel	TRADER	1.271978728313698	103.768308722207	f	f
307693	FDCU0634031	2021-06-30 04:13:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'TRADER 032N' at Transhipment Port	9756925	548950000	032W	Vessel	TRADER	1.271978728313698	103.768308722207	f	f
307694	FDCU0634031	2021-07-06 16:27:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'YM WIDTH 023E' at Transhipment Port	\N	\N	023E	Vessel	YM WIDTH	1.271978728313698	103.768308722207	f	f
307695	FDCU0634031	2021-07-07 08:25:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	YM WIDTH	1.271978728313698	103.768308722207	f	f
307696	FDCU0634031	2021-08-02 19:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel arrival	'YM WIDTH 023E' Arrival at Port of Discharging	\N	\N	023E	Vessel	YM WIDTH	40.7	-74	f	f
307698	FDCU0634031	2021-08-02 22:34:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel berthed in port	'YM WIDTH 023E' POD Berthing Destination	\N	\N	023E	Vessel	YM WIDTH	40.7	-74	f	f
307699	FDCU0634031	2021-08-03 23:17:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Discharged from vessel	Unloaded from 'YM WIDTH 023E' at Port of Discharging	\N	\N	023E	Vessel	YM WIDTH	40.7	-74	f	f
307700	FDCU0634031	2021-08-04 04:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
307701	FDCU0634031	2021-08-04 10:00:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
307714	FDCU0634031	2021-08-02 23:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Discharged from vessel	Unloaded from 'YM WIDTH 023E' at Port of Discharging	9708447	477129300	023E	Vessel	YM WIDTH	40.7	-74	f	t
307715	FDCU0634031	2021-08-03 04:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
307716	FDCU0634031	2021-08-03 10:00:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
307743	FDCU0634031	2021-08-02 22:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel berthed in port	'YM WIDTH 023E' POD Berthing Destination	9708447	477129300	023E	Vessel	YM WIDTH	40.7	-74	f	t
307987	TRLU7202269	2021-06-17 15:48:00	WORLDBRIDGE FLEET MANAGEMENT CO.LTD,Phnom Penh,Phnum Penh,Cambodia	Phnom Penh	Cambodia	\N	WORLDBRIDGE FLEET MANAGEMENT CO.LTD	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	11.5448729	104.8921668	f	f
307988	TRLU7202269	2021-06-18 20:45:00	Port Authority Of Sihanoukville,Sihanoukville,Sihanoukville,Cambodia	Preah Sihanouk	Cambodia	\N	Port Authority Of Sihanoukville	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	10.6267867	103.5115545	f	f
307990	TRLU7202269	2021-06-20 17:30:00	Port Authority Of Sihanoukville,Sihanoukville,Sihanoukville,Cambodia	Preah Sihanouk	Cambodia	\N	Port Authority Of Sihanoukville	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	10.6267867	103.5115545	f	f
307991	TRLU7202269	2021-06-25 02:57:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
307992	TRLU7202269	2021-07-05 15:08:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	\N	\N	0TUIBE1MA	Vessel	CMA CGM CHILE	1.271978728313698	103.768308722207	f	f
307993	TRLU7202269	2021-08-12 08:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
308151	TCLU5847568	2021-06-21 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Gate out empty	Empty to shipper	\N	\N	0IN9BW1MA	Vessel	CMA CGM BUTTERFLY	31.416666666666668	31.816666666666666	f	f
308152	TCLU5847568	2021-06-24 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Gate in at origin port	Ready to be loaded	\N	\N	0IN9BW1MA	Vessel	CMA CGM BUTTERFLY	31.416666666666668	31.816666666666666	f	f
308153	TCLU5847568	2021-06-27 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Loaded on vessel	Loaded on board	\N	\N	0IN9BW1MA	Vessel	CMA CGM BUTTERFLY	31.416666666666668	31.816666666666666	f	f
308154	TCLU5847568	2021-07-14 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Discharged from vessel	Discharged	\N	\N	0IN9CE1MA	Vessel	CMA CGM BUTTERFLY	36.8507689	-76.28587259999999	f	f
308156	TCLU5847568	2021-07-29 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Gate out	Container in transit for import	\N	\N	\N	\N	\N	36.8507689	-76.28587259999999	f	f
308157	TCLU5847568	2021-08-03 04:00:00	ELKHART, IN	Elkhart	United States	USEKI	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	41.6812083	-85.9656249	f	f
308171	TCLU5847568	2021-07-31 04:00:00	PORTSMOUTH, OH	Portsmouth	United States	USPSM	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	38.7317431	-82.9976742	f	f
308199	TCLU5847568	2021-07-30 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	36.8507689	-76.28587259999999	f	f
308214	SEGU5802374	2021-06-28 11:07:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
308215	SEGU5802374	2021-06-28 23:30:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
308216	SEGU5802374	2021-07-07 11:51:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Loaded on feeder	Feeder Loading at POL	\N	\N	\N	Feeder	\N	-6.2087634	106.845599	f	f
308217	SEGU5802374	2021-07-10 13:20:00	SINGAPORE	Singapore	Singapore	\N	\N	Feeder arrived	Feeder Arrival at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
308218	SEGU5802374	2021-07-10 19:12:00	SINGAPORE	Singapore	Singapore	\N	\N	Discharged from feeder	Feeder Unloading at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
308219	SEGU5802374	2021-07-23 13:39:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	9388352	370407000	0057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
308220	SEGU5802374	2021-07-24 17:15:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	9388352	370407000	0057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
308221	SEGU5802374	2021-08-16 13:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9388352	370407000	\N	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	t	t
308237	SEGU5802374	2021-08-15 23:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9388352	370407000	\N	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	t	t
308311	TRHU4177333	2021-06-28 22:04:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	DUNIA EXPRESS TRANSINDO	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
308312	TRHU4177333	2021-06-30 02:07:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
308313	TRHU4177333	2021-07-04 01:24:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'BANGKOK BRIDGE 121N' at Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
308314	TRHU4177333	2021-07-05 09:30:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'BANGKOK BRIDGE 121N' Departure from Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
308315	TRHU4177333	2021-07-08 00:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BANGKOK BRIDGE 121N' Arrival at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
308316	TRHU4177333	2021-07-08 02:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BANGKOK BRIDGE 121N' T/S Berthing Destination	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
308317	TRHU4177333	2021-07-08 06:46:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BANGKOK BRIDGE 121N' at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
308318	TRHU4177333	2021-07-17 17:04:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
308319	TRHU4177333	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
308320	TRHU4177333	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
308322	TRHU4177333	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
308323	TRHU4177333	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
308324	TRHU4177333	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
308325	TRHU4177333	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
308500	TRHU4177333	2021-08-20 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
308506	KKFU7928885	2021-06-28 21:50:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	DUNIA EXPRESS TRANSINDO	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
308507	KKFU7928885	2021-06-30 01:56:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
308508	KKFU7928885	2021-07-04 13:20:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'BANGKOK BRIDGE 121N' at Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
308509	KKFU7928885	2021-07-05 09:30:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'BANGKOK BRIDGE 121N' Departure from Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
308510	KKFU7928885	2021-07-08 00:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BANGKOK BRIDGE 121N' Arrival at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
308511	KKFU7928885	2021-07-08 02:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BANGKOK BRIDGE 121N' T/S Berthing Destination	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
308512	KKFU7928885	2021-07-08 16:26:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BANGKOK BRIDGE 121N' at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
308513	KKFU7928885	2021-07-17 10:09:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
308514	KKFU7928885	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
308515	KKFU7928885	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
308517	KKFU7928885	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
308518	KKFU7928885	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
308519	KKFU7928885	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
308520	KKFU7928885	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
308635	KKFU7928885	2021-08-20 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
308689	NYKU4369465	2021-06-29 10:00:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	DUNIA EXPRESS TRANSINDO	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
308690	NYKU4369465	2021-06-30 02:20:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
308691	NYKU4369465	2021-07-04 05:53:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'BANGKOK BRIDGE 121N' at Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
308692	NYKU4369465	2021-07-05 09:30:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'BANGKOK BRIDGE 121N' Departure from Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
308693	NYKU4369465	2021-07-08 00:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BANGKOK BRIDGE 121N' Arrival at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
308694	NYKU4369465	2021-07-08 02:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BANGKOK BRIDGE 121N' T/S Berthing Destination	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
308695	NYKU4369465	2021-07-09 20:16:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BANGKOK BRIDGE 121N' at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
308696	NYKU4369465	2021-07-17 10:33:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
308697	NYKU4369465	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
308698	NYKU4369465	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
308700	NYKU4369465	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
308701	NYKU4369465	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
308702	NYKU4369465	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
308703	NYKU4369465	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
308818	NYKU4369465	2021-08-20 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
309019	SEGU4990765	2021-06-29 21:28:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	DUNIA EXPRESS TRANSINDO	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
309020	SEGU4990765	2021-06-30 23:48:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
309021	SEGU4990765	2021-07-05 02:57:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'BANGKOK BRIDGE 121N' at Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
309022	SEGU4990765	2021-07-05 09:30:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'BANGKOK BRIDGE 121N' Departure from Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
309023	SEGU4990765	2021-07-08 00:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BANGKOK BRIDGE 121N' Arrival at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
309024	SEGU4990765	2021-07-08 02:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BANGKOK BRIDGE 121N' T/S Berthing Destination	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
309025	SEGU4990765	2021-07-09 18:01:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BANGKOK BRIDGE 121N' at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
309026	SEGU4990765	2021-07-17 09:50:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
309027	SEGU4990765	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
309028	SEGU4990765	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
309030	SEGU4990765	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
309031	SEGU4990765	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
309032	SEGU4990765	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
309033	SEGU4990765	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
309148	SEGU4990765	2021-08-20 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
309289	SEGU6093421	2021-06-29 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Gate out empty	Empty to shipper	9408841	636018070	0IN9DW1MA	Vessel	ARISTOMENIS	31.416666666666668	31.816666666666666	f	f
309290	SEGU6093421	2021-07-01 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Gate in at origin port	Ready to be loaded	9408841	636018070	0IN9DW1MA	Vessel	ARISTOMENIS	31.416666666666668	31.816666666666666	f	f
309291	SEGU6093421	2021-07-10 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Loaded on vessel	Loaded on board	9364992	218845000	0IN9FW1MA	Vessel	CMA CGM ORFEO	31.416666666666668	31.816666666666666	f	f
309292	SEGU6093421	2021-07-27 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Discharged from vessel	Discharged	9364992	218845000	0IN9GE1MA	Vessel	CMA CGM ORFEO	36.8507689	-76.28587259999999	f	f
309293	SEGU6093421	2021-07-28 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Loaded on rail	Full Load on rail for import	\N	\N	\N	\N	\N	36.8507689	-76.28587259999999	f	f
309294	SEGU6093421	2021-07-29 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Gate out	Container in transit for import	\N	\N	\N	\N	\N	36.8507689	-76.28587259999999	f	f
309295	SEGU6093421	2021-08-03 04:00:00	ELKHART, IN	Elkhart	United States	USEKI	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	41.6812083	-85.9656249	f	f
309309	SEGU6093421	2021-07-31 04:00:00	PORTSMOUTH, OH	Portsmouth	United States	USPSM	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	38.7317431	-82.9976742	f	f
309317	SEGU6093421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f
309345	SEGU6093421	2021-07-30 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	36.8507689	-76.28587259999999	f	f
309481	TCNU2664600	2021-06-29 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Gate out empty	Empty to shipper	9408841	636018070	0IN9DW1MA	Vessel	ARISTOMENIS	31.416666666666668	31.816666666666666	f	f
309482	TCNU2664600	2021-07-01 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Gate in at origin port	Ready to be loaded	9408841	636018070	0IN9DW1MA	Vessel	ARISTOMENIS	31.416666666666668	31.816666666666666	f	f
309483	TCNU2664600	2021-07-10 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Loaded on vessel	Loaded on board	9364992	218845000	0IN9FW1MA	Vessel	CMA CGM ORFEO	31.416666666666668	31.816666666666666	f	f
309484	TCNU2664600	2021-07-27 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Discharged from vessel	Discharged	9364992	218845000	0IN9GE1MA	Vessel	CMA CGM ORFEO	36.8507689	-76.28587259999999	f	f
309485	TCNU2664600	2021-07-28 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Loaded on rail	Full Load on rail for import	\N	\N	\N	\N	\N	36.8507689	-76.28587259999999	f	f
309486	TCNU2664600	2021-07-29 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Gate out	Container in transit for import	\N	\N	\N	\N	\N	36.8507689	-76.28587259999999	f	f
309487	TCNU2664600	2021-08-03 04:00:00	ELKHART, IN	Elkhart	United States	USEKI	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	41.6812083	-85.9656249	f	f
309501	TCNU2664600	2021-07-31 04:00:00	PORTSMOUTH, OH	Portsmouth	United States	USPSM	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	38.7317431	-82.9976742	f	f
309529	TCNU2664600	2021-07-30 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	36.8507689	-76.28587259999999	f	f
309665	EGHU9785833	2021-06-27 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
309666	EGHU9785833	2021-06-29 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
310074	SEGU4716559	2021-05-11 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309667	EGHU9785833	2021-07-06 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.098516936064017	106.9023760515587	f	f
309668	EGHU9785833	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
309669	EGHU9785833	2021-07-23 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
309671	EGHU9785833	2021-07-24 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
309672	EGHU9785833	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
309709	SEGU6093421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f
309738	TRHU5681610	2021-06-26 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
309739	TRHU5681610	2021-06-29 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
309740	TRHU5681610	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.098516936064017	106.9023760515587	f	f
309741	TRHU5681610	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
309742	TRHU5681610	2021-07-23 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
309744	TRHU5681610	2021-07-25 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
309745	TRHU5681610	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
309795	CAIU8967196	2021-06-01 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309796	CAIU8967196	2021-06-01 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309797	CAIU8967196	2021-06-02 23:40:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309798	CAIU8967196	2021-06-02 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309799	CAIU8967196	2021-06-03 22:27:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	9123582	564065000	104S	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
309800	CAIU8967196	2021-06-09 09:49:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9123582	564065000	0077E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
309801	CAIU8967196	2021-06-16 14:27:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9777216	636017882	FT119E	Vessel	MSC VIVIANA	1.271978728313698	103.768308722207	f	f
309802	CAIU8967196	2021-06-24 21:00:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9777216	636017882	FT119E	Vessel	MSC VIVIANA	22.483333333333334	113.91666666666667	f	f
309803	CAIU8967196	2021-06-27 10:01:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	22.483333333333334	113.91666666666667	f	f
309804	CAIU8967196	2021-07-30 22:59:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7434444	353056000	125N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	f	f
309805	CAIU8967196	2021-08-05 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
309833	TCNU6502892	2021-06-15 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309834	TCNU6502892	2021-06-15 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309835	TCNU6502892	2021-06-22 06:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'KOTA WANGI 0078E' at Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
309836	TCNU6502892	2021-06-22 09:15:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'KOTA WANGI 0078E' Departure from Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
309837	TCNU6502892	2021-06-29 13:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'KOTA WANGI 0078E' Arrival at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
309838	TCNU6502892	2021-06-29 15:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'KOTA WANGI 0078E' T/S Berthing Destination	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
309839	TCNU6502892	2021-06-30 10:34:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'KOTA WANGI 0078E' at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
309840	TCNU6502892	2021-07-19 17:11:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE HARBOUR 088E' at Transhipment Port	\N	\N	088E	Vessel	ONE HARBOUR	1.271978728313698	103.768308722207	f	f
309841	TCNU6502892	2021-07-20 00:50:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	088E	Vessel	ONE HARBOUR	1.271978728313698	103.768308722207	f	f
309842	TCNU6502892	2021-08-11 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'ONE HARBOUR 088E' Arrival at Port of Discharging	\N	\N	088E	Vessel	ONE HARBOUR	34.0522342	-118.2436849	f	t
309844	TCNU6502892	2021-08-13 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HARBOUR 088E' POD Berthing Destination	\N	\N	088E	Vessel	ONE HARBOUR	34.0522342	-118.2436849	f	t
309845	TCNU6502892	2021-08-13 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HARBOUR 088E' at Port of Discharging	\N	\N	088E	Vessel	ONE HARBOUR	34.0522342	-118.2436849	f	t
309846	TCNU6502892	2021-08-13 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
309847	TCNU6502892	2021-08-14 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
309871	KKFU7755028	2021-06-15 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309872	KKFU7755028	2021-06-15 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309873	KKFU7755028	2021-06-22 06:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'KOTA WANGI 0078E' at Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
309874	KKFU7755028	2021-06-22 09:15:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'KOTA WANGI 0078E' Departure from Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
309875	KKFU7755028	2021-06-29 13:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'KOTA WANGI 0078E' Arrival at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
309876	KKFU7755028	2021-06-29 15:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'KOTA WANGI 0078E' T/S Berthing Destination	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
309877	KKFU7755028	2021-06-30 10:47:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'KOTA WANGI 0078E' at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
309878	KKFU7755028	2021-07-19 16:31:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE HARBOUR 088E' at Transhipment Port	\N	\N	088E	Vessel	ONE HARBOUR	1.271978728313698	103.768308722207	f	f
309879	KKFU7755028	2021-07-20 00:50:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	088E	Vessel	ONE HARBOUR	1.271978728313698	103.768308722207	f	f
309880	KKFU7755028	2021-08-11 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'ONE HARBOUR 088E' Arrival at Port of Discharging	\N	\N	088E	Vessel	ONE HARBOUR	34.0522342	-118.2436849	f	t
309882	KKFU7755028	2021-08-13 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HARBOUR 088E' POD Berthing Destination	\N	\N	088E	Vessel	ONE HARBOUR	34.0522342	-118.2436849	f	t
309883	KKFU7755028	2021-08-13 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HARBOUR 088E' at Port of Discharging	\N	\N	088E	Vessel	ONE HARBOUR	34.0522342	-118.2436849	f	t
309884	KKFU7755028	2021-08-13 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
309885	KKFU7755028	2021-08-14 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
309923	CSLU1532443	2021-07-15 18:00:00	Nemsan Container Ltd,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Nemsan Container Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
309924	CSLU1532443	2021-07-15 22:00:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
309926	CSLU1532443	2021-07-18 15:10:00	Chittagong Port Authority,Chittagong,Chittagong,Bangladesh	Chattogram	Bangladesh	\N	Chittagong Port Authority	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	22.356851	91.7831819	f	f
309927	CSLU1532443	2021-07-24 06:15:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
309928	CSLU1532443	2021-09-08 18:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
309965	MEDU8619545	2021-05-11 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309966	MEDU8619545	2021-05-11 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309967	MEDU8619545	2021-05-16 23:47:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309968	MEDU8619545	2021-05-16 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
309969	MEDU8619545	2021-05-18 15:35:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	068S	\N	HAIAN EAST	22.30049832559382	91.79452471970988	f	f
309970	MEDU8619545	2021-05-26 09:38:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	068S	\N	HAIAN EAST	1.271978728313698	103.768308722207	f	f
309971	MEDU8619545	2021-05-30 20:04:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	\N	\N	FJ117E	\N	MSC ELOANE	1.271978728313698	103.768308722207	f	f
309972	MEDU8619545	2021-06-23 08:00:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	FJ117	\N	MSC ELOANE	26.85	119.86666666666666	f	f
309973	MEDU8619545	2021-06-28 23:01:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	\N	\N	QJ122N	\N	MSC CLORINDA	26.85	119.86666666666666	f	f
309974	MEDU8619545	2021-07-13 00:03:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	\N	\N	122N	\N	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
309975	MEDU8619545	2021-07-23 15:29:00	LONG BEACH	Long Beach	United States	USLGB	\N	Discharged from vessel	Discharged	\N	\N	122N	\N	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
309976	MEDU8619545	2021-07-31 15:57:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate out	Gate Out Full	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
310075	SEGU4716559	2021-05-11 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
310076	SEGU4716559	2021-05-16 23:47:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
310077	SEGU4716559	2021-05-16 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
310078	SEGU4716559	2021-05-18 15:35:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	068S	\N	HAIAN EAST	22.30049832559382	91.79452471970988	f	f
310079	SEGU4716559	2021-05-26 09:30:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	068S	\N	HAIAN EAST	1.271978728313698	103.768308722207	f	f
310080	SEGU4716559	2021-05-29 17:38:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9755957	636017435	FJ117E	Vessel	MSC ELOANE	1.271978728313698	103.768308722207	f	f
310081	SEGU4716559	2021-06-23 08:00:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9755957	636017435	FJ117	Vessel	MSC ELOANE	26.85	119.86666666666666	f	f
310082	SEGU4716559	2021-06-28 23:01:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	7820394	352890000	QJ122N	Vessel	MSC CLORINDA	26.85	119.86666666666666	f	f
310083	SEGU4716559	2021-07-13 00:03:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7820394	352890000	122N	Vessel	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
310084	SEGU4716559	2021-07-23 17:04:00	LONG BEACH	Long Beach	United States	USLGB	\N	Discharged from vessel	Discharged	7820394	352890000	122N	Vessel	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
310085	SEGU4716559	2021-07-31 18:09:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate out	Gate Out Full	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
310154	GLDU9864000	2021-05-27 00:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
310156	GLDU9864000	2021-05-28 00:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded on board	\N	\N	59SA5S	Vessel	CALA PAGURO	22.30049832559382	91.79452471970988	f	f
310157	GLDU9864000	2021-06-03 00:00:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged transshipment	Discharged in transhipment	\N	\N	60SA5N	Vessel	CALA PAGURO	1.271978728313698	103.768308722207	f	f
310158	GLDU9864000	2021-06-09 00:00:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Loaded on board	9454400	235076499	0TUHVE1MA	Vessel	CMA CGM CORTE REAL	1.271978728313698	103.768308722207	f	f
310159	GLDU9864000	2021-07-23 07:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Discharged from vessel	Discharged	9454400	235076499	0TUHWW1MA	Vessel	CMA CGM CORTE REAL	34.0522342	-118.2436849	f	f
310160	GLDU9864000	2021-07-29 07:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Gate out to consignee	Container to consignee	9454400	235076499	0TUHWW1MA	Vessel	CMA CGM CORTE REAL	34.0522342	-118.2436849	f	f
310296	OOLU8929036	2021-06-08 00:18:00	Tan Cang-COSCO-OOCL Logistics Tan Van Depot, Ho Chi Minh, Vietnam	thành phố Biên Hòa	Vietnam	\N	\N	Gate out to consignee	Container Picked Up	\N	\N	\N	Truck	\N	10.9062274	106.8159791	f	f
310297	OOLU8929036	2021-06-08 04:55:00	Los Angeles, California, United States	Los Angeles	United States	USLAX	\N	Inbound Customs Hold	Inbound Customs Hold	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
310298	OOLU8929036	2021-06-09 03:01:00	Tanamexco ICD, Ho Chi Minh, Vietnam	Tanamexco Icd	Vietnam	\N	\N	Gate in at origin port	Container Received by Carrier	\N	\N	\N	Truck	\N	10.818985	106.75461	f	f
310299	OOLU8929036	2021-06-17 05:36:00	Tanamexco ICD, Ho Chi Minh, Vietnam	Tanamexco Icd	Vietnam	VNTAM	\N	Departed	Departed	\N	\N	\N	\N	\N	10.818985	106.75461	f	f
310300	OOLU8929036	2021-06-18 03:59:00	Vung Tau, Ba Ria Vung Tau, Vietnam	Vũng Tàu	Vietnam	\N	\N	Barge arrived	Arrived	\N	\N	\N	Barge	\N	10.4113797	107.136224	f	f
310301	OOLU8929036	2021-06-27 19:07:00	Vung Tau, Ba Ria Vung Tau, Vietnam	Vũng Tàu	Vietnam	VNVUT	\N	Loaded on vessel	Loaded	\N	\N	131E	Vessel	SEAP CMA CGM J. MADISON	10.35	107.06666666666666	f	f
310302	OOLU8929036	2021-06-28 07:12:00	Cai Mep, Cai Mep, Vietnam	Cai Mep	Vietnam	VNTOT	\N	Vessel departed	Vessel Departed	\N	\N	131E	Vessel	SEAP CMA CGM J. MADISON	10.383333333333333	107.08333333333333	f	f
310303	OOLU8929036	2021-07-05 03:16:00	Los Angeles, California, United States	Los Angeles	United States	USLAX	\N	Freight Charges Settled	Freight Charges Settled	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
310304	OOLU8929036	2021-07-13 08:06:00	Los Angeles, California, United States	Los Angeles	United States	USLAX	\N	Carrier release	Carrier Released	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
310305	OOLU8929036	2021-07-19 21:30:00	Los Angeles, California, United States	Los Angeles	United States	USLAX	\N	Customs release	Customs Released	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
310307	OOLU8929036	2021-07-25 04:00:00	Los Angeles, California, United States	Los Angeles	United States	USLAX	\N	Vessel arrived	Vessel Arrived	\N	\N	131E	Vessel	SEAP CMA CGM J. MADISON	34.0522342	-118.2436849	f	f
310309	OOLU8929036	2021-07-27 21:21:00	Los Angeles, California, United States	Los Angeles	United States	USLAX	\N	Discharged from vessel	Discharged	\N	\N	131E	Vessel	SEAP CMA CGM J. MADISON	34.0522342	-118.2436849	f	f
310311	OOLU8929036	2021-07-31 08:12:00	Los Angeles, California, United States	Los Angeles	United States	\N	\N	Picked Up for Delivery	Picked Up for Delivery	\N	\N	\N	Truck	\N	34.0522342	-118.2436849	f	f
310444	OOLU1151550	2021-06-08 17:47:00	Sotrans ICD, Ho Chi Minh, Vietnam	Sotrans Icd	Vietnam	\N	\N	Gate out to consignee	Container Picked Up	\N	\N	\N	Truck	\N	10.8227606	106.7571883	f	f
310445	OOLU1151550	2021-06-09 05:58:00	Los Angeles, California, United States	Los Angeles	United States	USLAX	\N	Inbound Customs Hold	Inbound Customs Hold	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
310446	OOLU1151550	2021-06-10 02:08:00	Phuoc Long ICD 3 - Port, Ho Chi Minh, Vietnam	Hồ Chí Minh	Vietnam	\N	\N	Gate in at origin port	Container Received by Carrier	\N	\N	\N	Truck	\N	10.8187576	106.7587629	f	f
310447	OOLU1151550	2021-06-15 09:16:00	Phuoc Long ICD 3 - Port, Ho Chi Minh, Vietnam	Hồ Chí Minh	Vietnam	\N	\N	Barge departed	Departed	\N	\N	\N	Barge	\N	10.8187576	106.7587629	f	f
310448	OOLU1151550	2021-06-16 09:55:00	Vung Tau, Ba Ria Vung Tau, Vietnam	Vũng Tàu	Vietnam	\N	\N	Barge arrived	Arrived	\N	\N	\N	Barge	\N	10.4113797	107.136224	f	f
310449	OOLU1151550	2021-06-16 14:44:00	Vung Tau, Ba Ria Vung Tau, Vietnam	Vũng Tàu	Vietnam	VNVUT	\N	Loaded on vessel	Loaded	\N	\N	020E	Vessel	PVCS COSCO SHIPPING DENALI	10.35	107.06666666666666	f	f
310450	OOLU1151550	2021-06-17 00:03:00	Cai Mep, Cai Mep, Vietnam	Cai Mep	Vietnam	VNTOT	\N	Vessel departed	Vessel Departed	\N	\N	020E	Vessel	PVCS COSCO SHIPPING DENALI	10.383333333333333	107.08333333333333	f	f
310451	OOLU1151550	2021-06-25 02:14:00	Los Angeles, California, United States	Los Angeles	United States	USLAX	\N	Freight Charges Settled	Freight Charges Settled	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
310452	OOLU1151550	2021-07-02 05:02:00	Los Angeles, California, United States	Los Angeles	United States	USLAX	\N	Carrier release	Carrier Released	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
310453	OOLU1151550	2021-07-19 19:40:00	Los Angeles, California, United States	Los Angeles	United States	USLAX	\N	Carrier and Customs Released	Carrier and Customs Released	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
310455	OOLU1151550	2021-07-21 12:48:00	Los Angeles, California, United States	Los Angeles	United States	USLAX	\N	Vessel arrived	Vessel Arrived	\N	\N	020E	Vessel	PVCS COSCO SHIPPING DENALI	34.0522342	-118.2436849	f	f
310457	OOLU1151550	2021-07-23 21:10:00	Los Angeles, California, United States	Los Angeles	United States	USLAX	\N	Available for release / delivery	Container Available	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
310459	OOLU1151550	2021-07-29 02:50:00	Los Angeles, California, United States	Los Angeles	United States	\N	\N	Picked Up for Delivery	Picked Up for Delivery	\N	\N	\N	Truck	\N	34.0522342	-118.2436849	f	f
310460	OOLU1151550	2021-08-02 20:34:00	Los Angeles, California, United States	Los Angeles	United States	\N	\N	Gate in empty return	Container Returned to Carrier	\N	\N	\N	Truck	\N	34.0522342	-118.2436849	f	f
310573	HMMU6044428	2021-06-04 19:49:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
310574	HMMU6044428	2021-06-06 04:12:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
310575	HMMU6044428	2021-06-07 20:30:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	\N	\N	0042N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
310576	HMMU6044428	2021-06-08 04:35:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	\N	\N	0042N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
310577	HMMU6044428	2021-06-18 17:00:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	\N	\N	0042N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
310578	HMMU6044428	2021-06-18 18:00:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel berthed in port	Vessel Berthing at T/S Port	\N	\N	0042N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
310579	HMMU6044428	2021-07-11 22:25:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	35.13333333333333	129.05	f	f
310580	HMMU6044428	2021-07-12 13:55:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	35.13333333333333	129.05	f	f
310581	HMMU6044428	2021-07-23 22:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Vessel Arrival at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
310582	HMMU6044428	2021-08-03 10:54:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel berthed in port	Vessel Berthing at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
310583	HMMU6044428	2021-08-04 05:21:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel Unloading at POD	Vessel Unloading at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
310709	KOCU4727801	2021-06-12 02:11:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
310710	KOCU4727801	2021-06-12 23:54:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
310711	KOCU4727801	2021-06-16 21:58:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	\N	\N	0061N	Vessel	HONGKONG BRIDGE	-6.098516936064017	106.9023760515587	f	f
310712	KOCU4727801	2021-06-17 02:12:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	\N	\N	0061N	Vessel	HONGKONG BRIDGE	-6.098516936064017	106.9023760515587	f	f
310713	KOCU4727801	2021-07-01 23:04:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	\N	\N	0061N	Vessel	HONGKONG BRIDGE	34.93333333333333	127.7	f	f
310714	KOCU4727801	2021-07-02 01:04:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel berthed in port	Vessel Berthing at T/S Port	\N	\N	0061N	Vessel	HONGKONG BRIDGE	34.93333333333333	127.7	f	f
310715	KOCU4727801	2021-07-09 16:52:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate Out from T/S Terminal	Truck Gate Out from T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
310716	KOCU4727801	2021-07-09 16:56:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate In to T/S Terminal	Truck Gate In to T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
310717	KOCU4727801	2021-07-10 13:42:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	34.93333333333333	127.7	f	f
310718	KOCU4727801	2021-07-10 19:00:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	34.93333333333333	127.7	f	f
310719	KOCU4727801	2021-07-23 22:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Vessel Arrival at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
310720	KOCU4727801	2021-08-03 10:54:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel berthed in port	Vessel Berthing at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
310831	KOCU4106907	2021-06-10 22:37:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
310832	KOCU4106907	2021-06-11 21:50:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
310833	KOCU4106907	2021-06-16 11:16:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	\N	\N	0061N	Vessel	HONGKONG BRIDGE	-6.098516936064017	106.9023760515587	f	f
310834	KOCU4106907	2021-06-17 02:12:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	\N	\N	0061N	Vessel	HONGKONG BRIDGE	-6.098516936064017	106.9023760515587	f	f
310835	KOCU4106907	2021-07-01 23:04:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	\N	\N	0061N	Vessel	HONGKONG BRIDGE	34.93333333333333	127.7	f	f
310836	KOCU4106907	2021-07-02 01:04:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel berthed in port	Vessel Berthing at T/S Port	\N	\N	0061N	Vessel	HONGKONG BRIDGE	34.93333333333333	127.7	f	f
310837	KOCU4106907	2021-07-08 09:36:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate Out from T/S Terminal	Truck Gate Out from T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
310838	KOCU4106907	2021-07-08 09:39:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate In to T/S Terminal	Truck Gate In to T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
310839	KOCU4106907	2021-07-10 14:07:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	34.93333333333333	127.7	f	f
310840	KOCU4106907	2021-07-10 19:00:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0028E	Vessel	HYUNDAI EARTH	34.93333333333333	127.7	f	f
310841	KOCU4106907	2021-07-23 22:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Vessel Arrival at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
310842	KOCU4106907	2021-08-03 10:54:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Vessel berthed in port	Vessel Berthing at POD	\N	\N	0028E	Vessel	HYUNDAI EARTH	33.766666666666666	-118.18333333333334	f	f
310921	SEGU5332711	2021-07-05 13:29:00	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty container dispatched from inland point to Customer	9290799	636091739	453	Vessel	TESSA	20.8449115	106.6880841	f	f
310922	SEGU5332711	2021-07-06 07:40:00	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Export Gate-In to Port of Loading 	Export Gate-In to Port of Loading 	\N	\N	46	Vessel	ASIATIC MOON	20.8449115	106.6880841	f	f
310923	SEGU5332711	2021-07-11 03:07:00	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel at origin port	Container was loaded at Port of Loading to Transshipment Port	\N	\N	46	Vessel	ASIATIC MOON	20.8449115	106.6880841	f	f
310924	SEGU5332711	2021-07-11 12:50:01	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Vessel departed	Vessel departure from Port of Loading to Transshipment Port	\N	\N	46	Vessel	ASIATIC MOON	20.8449115	106.6880841	f	f
310925	SEGU5332711	2021-07-14 07:07:00	DA CHAN BAY (GD), CHINA. PEOPLE'S REPUBLIC	Da Chan Bay (Gd)	China	CNDCB	\N	Vessel arrived	Vessel arrival to Transshipment Port	\N	\N	46	Vessel	ASIATIC MOON	22.533333333333335	113.86666666666666	f	f
310926	SEGU5332711	2021-07-14 13:58:00	DA CHAN BAY (GD), CHINA. PEOPLE'S REPUBLIC	Da Chan Bay (Gd)	China	CNDCB	\N	Discharged from vessel at transshipment port	Container was discharged at Transshipment Port	\N	\N	46	Vessel	ASIATIC MOON	22.533333333333335	113.86666666666666	f	f
310927	SEGU5332711	2021-07-20 08:33:07	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Carrier release	Carrier Release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
310928	SEGU5332711	2021-07-22 23:07:00	DA CHAN BAY (GD), CHINA. PEOPLE'S REPUBLIC	Da Chan Bay (Gd)	China	CNDCB	\N	Loaded transshipment	Container was loaded at Transsihipment Port to Port of Discharge	\N	\N	4	Vessel	SPYROS V	22.533333333333335	113.86666666666666	f	f
310929	SEGU5332711	2021-07-23 10:45:00	DA CHAN BAY (GD), CHINA. PEOPLE'S REPUBLIC	Da Chan Bay (Gd)	China	CNDCB	\N	Vessel departed	Vessel departure from Transshipment Port to Port of Discharge	\N	\N	4	Vessel	SPYROS V	22.533333333333335	113.86666666666666	f	f
310930	SEGU5332711	2021-08-02 13:41:33	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Customs release	Customs release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
310931	SEGU5332711	2021-08-06 08:00:00	LOS ANGELES (CA), CHINA. PEOPLE'S REPUBLIC	Washington	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	38.9428097	-77.0663637	t	f
311081	KOCU4193389	2021-07-09 09:22:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
311082	KOCU4193389	2021-07-09 22:30:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
311083	KOCU4193389	2021-07-12 06:35:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	9326768	371110000	0043N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
311084	KOCU4193389	2021-07-12 18:00:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	9326768	371110000	0043N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
311085	KOCU4193389	2021-07-22 14:45:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
311086	KOCU4193389	2021-07-22 15:45:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel berthed in port	Vessel Berthing at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
311087	KOCU4193389	2021-07-23 01:55:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Discharged transshipment	Vessel Unloading at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
311088	KOCU4193389	2021-08-27 14:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
311096	KOCU4193389	2021-08-26 19:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
311104	KOCU4193389	2021-08-23 02:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
311171	BSIU9161111	2021-07-02 16:34:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
311172	BSIU9161111	2021-07-03 15:03:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
311173	BSIU9161111	2021-07-05 20:49:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Loaded on feeder	Feeder Loading at POL	\N	\N	\N	Feeder	\N	-6.2087634	106.845599	f	f
311174	BSIU9161111	2021-07-09 13:30:00	SINGAPORE	Singapore	Singapore	\N	\N	Feeder arrived	Feeder Arrival at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
311175	BSIU9161111	2021-07-09 22:07:00	SINGAPORE	Singapore	Singapore	\N	\N	Discharged from feeder	Feeder Unloading at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
311176	BSIU9161111	2021-08-01 00:18:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	9312781	372218000	0072E	Vessel	NYK VEGA	1.271978728313698	103.768308722207	f	f
311177	BSIU9161111	2021-08-02 00:50:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	9312781	372218000	0072E	Vessel	NYK VEGA	1.271978728313698	103.768308722207	f	f
311178	BSIU9161111	2021-08-24 12:50:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9312781	372218000	\N	Vessel	NYK VEGA	34.0522342	-118.2436849	t	t
312449	TCNU6648064	2021-06-26 15:14:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	10.64604378127943	103.5095980083301	f	f
311193	BSIU9161111	2021-08-24 13:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9312781	372218000	\N	Vessel	NYK VEGA	34.0522342	-118.2436849	t	t
311304	CAIU7468931	2021-07-03 02:14:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
311305	CAIU7468931	2021-07-07 21:32:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
311306	CAIU7468931	2021-07-12 00:11:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	9326768	371110000	0043N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
311307	CAIU7468931	2021-07-12 18:00:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	9326768	371110000	0043N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
311308	CAIU7468931	2021-07-22 14:45:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
311309	CAIU7468931	2021-07-22 15:45:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel berthed in port	Vessel Berthing at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
311310	CAIU7468931	2021-07-23 00:59:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Discharged transshipment	Vessel Unloading at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
311311	CAIU7468931	2021-08-27 14:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
311319	CAIU7468931	2021-08-26 19:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
311327	CAIU7468931	2021-08-23 02:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
311400	CAIU4564870	2021-07-02 20:35:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
311401	CAIU4564870	2021-07-07 22:08:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
311402	CAIU4564870	2021-07-12 00:30:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	9326768	371110000	0043N	Vessel	NORTH BRIDGE	-6.098516936064017	106.9023760515587	f	f
311403	CAIU4564870	2021-07-12 18:00:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	9326768	371110000	0043N	Vessel	NORTH BRIDGE	-6.098516936064017	106.9023760515587	f	f
311404	CAIU4564870	2021-07-22 14:45:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
311405	CAIU4564870	2021-07-22 15:45:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel berthed in port	Vessel Berthing at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
311406	CAIU4564870	2021-07-22 22:54:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Discharged transshipment	Vessel Unloading at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
311407	CAIU4564870	2021-08-23 02:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
311461	NYKU4108477	2021-07-01 23:02:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	K LINE MOBARU DIAMOND INDONESIA	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
311462	NYKU4108477	2021-07-02 20:33:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
311463	NYKU4108477	2021-07-07 16:47:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'ALLEGORIA 044N' at Port of Loading	9295945	255805779	044N	Vessel	ALLEGORIA	-6.133333333333334	106.83333333333333	f	f
311464	NYKU4108477	2021-07-08 05:50:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'ALLEGORIA 044N' Departure from Port of Loading	9295945	255805779	044N	Vessel	ALLEGORIA	-6.133333333333334	106.83333333333333	f	f
311465	NYKU4108477	2021-07-10 05:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'ALLEGORIA 044N' Arrival at Transhipment Port	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
311466	NYKU4108477	2021-07-10 07:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'ALLEGORIA 044N' T/S Berthing Destination	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
311467	NYKU4108477	2021-07-11 00:06:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'ALLEGORIA 044N' at Transhipment Port	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
311468	NYKU4108477	2021-07-17 10:54:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
311469	NYKU4108477	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
311470	NYKU4108477	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
311472	NYKU4108477	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
311473	NYKU4108477	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
320257	FFAU1676538	2021-06-19 02:19:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9754965	636017577	FT120E	Vessel	MSC REEF	1.271978728313698	103.768308722207	f	f
311474	NYKU4108477	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
311475	NYKU4108477	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
311605	NYKU4108477	2021-08-20 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
311651	FFAU1843825	2021-07-02 02:25:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	K LINE MOBARU DIAMOND INDONESIA	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
311652	FFAU1843825	2021-07-02 20:46:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
311653	FFAU1843825	2021-07-07 17:04:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'ALLEGORIA 044N' at Port of Loading	9295945	255805779	044N	Vessel	ALLEGORIA	-6.133333333333334	106.83333333333333	f	f
311654	FFAU1843825	2021-07-08 05:50:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'ALLEGORIA 044N' Departure from Port of Loading	9295945	255805779	044N	Vessel	ALLEGORIA	-6.133333333333334	106.83333333333333	f	f
311655	FFAU1843825	2021-07-10 05:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'ALLEGORIA 044N' Arrival at Transhipment Port	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
311656	FFAU1843825	2021-07-10 07:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'ALLEGORIA 044N' T/S Berthing Destination	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
311657	FFAU1843825	2021-07-11 00:06:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'ALLEGORIA 044N' at Transhipment Port	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
311658	FFAU1843825	2021-07-17 10:56:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
311659	FFAU1843825	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
311660	FFAU1843825	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
311662	FFAU1843825	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
311663	FFAU1843825	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
311664	FFAU1843825	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
311665	FFAU1843825	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
311810	FFAU1843825	2021-08-20 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
311848	KKFU7923775	2021-07-02 06:39:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	K LINE MOBARU DIAMOND INDONESIA	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
311849	KKFU7923775	2021-07-02 20:45:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
311850	KKFU7923775	2021-07-07 16:57:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'ALLEGORIA 044N' at Port of Loading	9295945	255805779	044N	Vessel	ALLEGORIA	-6.133333333333334	106.83333333333333	f	f
311851	KKFU7923775	2021-07-08 05:50:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'ALLEGORIA 044N' Departure from Port of Loading	9295945	255805779	044N	Vessel	ALLEGORIA	-6.133333333333334	106.83333333333333	f	f
311852	KKFU7923775	2021-07-10 05:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'ALLEGORIA 044N' Arrival at Transhipment Port	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
311853	KKFU7923775	2021-07-10 07:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'ALLEGORIA 044N' T/S Berthing Destination	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
311854	KKFU7923775	2021-07-11 00:13:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'ALLEGORIA 044N' at Transhipment Port	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
311855	KKFU7923775	2021-07-17 10:51:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
311856	KKFU7923775	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
311857	KKFU7923775	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
311859	KKFU7923775	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
311860	KKFU7923775	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
311861	KKFU7923775	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
311862	KKFU7923775	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
311977	KKFU7923775	2021-08-20 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
312133	NYKU4803864	2021-06-23 23:27:00	PHNOM PENH ,CAMBODIA	Phnom Penh	Cambodia	KHPNH	BOK SENG PPSEZ DRY PORT CO.  LTD.	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	11.5563738	104.9282099	f	f
312134	NYKU4803864	2021-06-26 15:14:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	10.64604378127943	103.5095980083301	f	f
312135	NYKU4803864	2021-06-29 11:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Loaded on vessel	Loaded on 'BRIDGE 0184S' at Port of Loading	2684361	304010914	184S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
312136	NYKU4803864	2021-06-29 14:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Vessel departed	'BRIDGE 0184S' Departure from Port of Loading	2684361	304010914	184S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
312137	NYKU4803864	2021-07-03 09:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BRIDGE 0184S' Arrival at Transhipment Port	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
312138	NYKU4803864	2021-07-03 11:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BRIDGE 0184S' T/S Berthing Destination	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
312139	NYKU4803864	2021-07-03 18:07:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BRIDGE 0184S' at Transhipment Port	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
312140	NYKU4803864	2021-07-23 17:12:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE CONTINUITY 057E' at Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
312141	NYKU4803864	2021-07-24 17:15:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
312142	NYKU4803864	2021-08-17 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312144	NYKU4803864	2021-08-17 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312145	NYKU4803864	2021-08-17 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312146	NYKU4803864	2021-08-17 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312147	NYKU4803864	2021-08-18 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312157	NYKU4803864	2021-08-15 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312158	NYKU4803864	2021-08-15 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312159	NYKU4803864	2021-08-15 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312160	NYKU4803864	2021-08-15 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312161	NYKU4803864	2021-08-16 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312202	NYKU4803864	2021-08-14 21:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312204	NYKU4803864	2021-08-14 23:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312205	NYKU4803864	2021-08-15 00:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312206	NYKU4803864	2021-08-15 05:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312448	TCNU6648064	2021-06-25 09:03:00	PHNOM PENH ,CAMBODIA	Phnom Penh	Cambodia	KHPNH	PHNOM PENH - TEC SRUN IMP EXP  TRANS	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	11.5563738	104.9282099	f	f
312450	TCNU6648064	2021-06-29 11:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Loaded on vessel	Loaded on 'BRIDGE 0184S' at Port of Loading	2684361	304010914	184S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
312451	TCNU6648064	2021-06-29 14:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Vessel departed	'BRIDGE 0184S' Departure from Port of Loading	2684361	304010914	184S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
312452	TCNU6648064	2021-07-03 09:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BRIDGE 0184S' Arrival at Transhipment Port	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
312453	TCNU6648064	2021-07-03 11:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BRIDGE 0184S' T/S Berthing Destination	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
312454	TCNU6648064	2021-07-03 13:37:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BRIDGE 0184S' at Transhipment Port	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
312455	TCNU6648064	2021-07-23 17:36:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE CONTINUITY 057E' at Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
312456	TCNU6648064	2021-07-24 17:15:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
312457	TCNU6648064	2021-08-17 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312459	TCNU6648064	2021-08-17 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312460	TCNU6648064	2021-08-17 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312461	TCNU6648064	2021-08-17 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312462	TCNU6648064	2021-08-18 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312472	TCNU6648064	2021-08-15 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312473	TCNU6648064	2021-08-15 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312474	TCNU6648064	2021-08-15 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312475	TCNU6648064	2021-08-15 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312476	TCNU6648064	2021-08-16 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312517	TCNU6648064	2021-08-14 21:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	\N	\N	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312519	TCNU6648064	2021-08-14 23:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	\N	\N	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312520	TCNU6648064	2021-08-15 00:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	\N	\N	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312521	TCNU6648064	2021-08-15 05:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312748	TLLU5507334	2021-06-23 23:27:00	PHNOM PENH ,CAMBODIA	Phnom Penh	Cambodia	KHPNH	BOK SENG PPSEZ DRY PORT CO.  LTD.	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	11.5563738	104.9282099	f	f
312749	TLLU5507334	2021-06-26 15:14:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	10.64604378127943	103.5095980083301	f	f
312750	TLLU5507334	2021-06-29 11:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Loaded on vessel	Loaded on 'BRIDGE 0184S' at Port of Loading	2684361	304010914	184S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
312751	TLLU5507334	2021-06-29 14:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Vessel departed	'BRIDGE 0184S' Departure from Port of Loading	2684361	304010914	184S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
312752	TLLU5507334	2021-07-03 09:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BRIDGE 0184S' Arrival at Transhipment Port	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
312753	TLLU5507334	2021-07-03 11:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BRIDGE 0184S' T/S Berthing Destination	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
312754	TLLU5507334	2021-07-03 14:05:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BRIDGE 0184S' at Transhipment Port	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
314202	TCNU7773775	2021-08-09 15:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
312755	TLLU5507334	2021-07-23 16:13:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE CONTINUITY 057E' at Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
312756	TLLU5507334	2021-07-24 17:15:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
312757	TLLU5507334	2021-08-17 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312759	TLLU5507334	2021-08-17 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312760	TLLU5507334	2021-08-17 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312761	TLLU5507334	2021-08-17 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312762	TLLU5507334	2021-08-18 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312772	TLLU5507334	2021-08-15 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312773	TLLU5507334	2021-08-15 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312774	TLLU5507334	2021-08-15 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312775	TLLU5507334	2021-08-15 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312776	TLLU5507334	2021-08-16 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
312817	TLLU5507334	2021-08-14 21:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312819	TLLU5507334	2021-08-14 23:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312820	TLLU5507334	2021-08-15 00:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
312821	TLLU5507334	2021-08-15 05:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
313048	CBHU9161733	2021-06-10 11:28:00	Bok Seng Ppsez Dry Port Co., Ltd,Phnom Penh,Phnum Penh,Cambodia	Phnom Penh	Cambodia	\N	Bok Seng Ppsez Dry Port Co., Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	11.5448729	104.8921668	f	f
313049	CBHU9161733	2021-06-12 20:45:00	Port Authority Of Sihanoukville,Sihanoukville,Sihanoukville,Cambodia	Preah Sihanouk	Cambodia	\N	Port Authority Of Sihanoukville	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	10.6267867	103.5115545	f	f
313051	CBHU9161733	2021-06-16 22:30:00	Port Authority Of Sihanoukville,Sihanoukville,Sihanoukville,Cambodia	Preah Sihanouk	Cambodia	\N	Port Authority Of Sihanoukville	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	10.6267867	103.5115545	f	f
313052	CBHU9161733	2021-06-19 15:37:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
313053	CBHU9161733	2021-06-26 19:59:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	9454436	235095231	0TUI7E1MA	Vessel	CMA CGM MARCO POLO	1.271978728313698	103.768308722207	f	f
313054	CBHU9161733	2021-08-02 08:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
313241	SEGU4686032	2021-06-10 11:28:00	Bok Seng Ppsez Dry Port Co., Ltd,Phnom Penh,Phnum Penh,Cambodia	Phnom Penh	Cambodia	\N	Bok Seng Ppsez Dry Port Co., Ltd	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	11.5448729	104.8921668	f	f
313242	SEGU4686032	2021-06-12 20:45:00	Port Authority Of Sihanoukville,Sihanoukville,Sihanoukville,Cambodia	Preah Sihanouk	Cambodia	\N	Port Authority Of Sihanoukville	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	10.6267867	103.5115545	f	f
313244	SEGU4686032	2021-06-16 22:30:00	Port Authority Of Sihanoukville,Sihanoukville,Sihanoukville,Cambodia	Preah Sihanouk	Cambodia	\N	Port Authority Of Sihanoukville	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	10.6267867	103.5115545	f	f
313245	SEGU4686032	2021-06-19 15:24:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
313246	SEGU4686032	2021-06-26 21:34:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	9454436	235095231	0TUI7E1MA	Vessel	CMA CGM MARCO POLO	1.271978728313698	103.768308722207	f	f
313247	SEGU4686032	2021-08-02 08:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
313398	CSNU6117709	2021-07-03 19:12:00	Shanghai Shengdong (I), Yangshan,Shanghai,Shanghai,China	Shanghai	China	\N	Shanghai Shengdong (I), Yangshan	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	31.230416	121.473701	f	f
313399	CSNU6117709	2021-07-08 20:18:00	Shanghai Shengdong (I), Yangshan,Shanghai,Shanghai,China	Shanghai	China	\N	Shanghai Shengdong (I), Yangshan	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	31.230416	121.473701	f	f
322667	TCNU8326529	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.6475811	-63.5727683	f	t
313401	CSNU6117709	2021-07-10 13:08:00	Shanghai Shengdong (I), Yangshan,Shanghai,Shanghai,China	Shanghai	China	CNSGH	Shanghai Shengdong (I), Yangshan	Loaded on vessel at origin port	Loaded at First POL	9645865	477293900	041E	Vessel	CSCL SUMMER	31.233333333333334	121.48333333333333	f	f
313402	CSNU6117709	2021-07-29 06:30:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
313431	TGBU8751446	2021-07-07 21:30:00	Shanghai Shengdong (I), Yangshan,Shanghai,Shanghai,China	Shanghai	China	\N	Shanghai Shengdong (I), Yangshan	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	31.230416	121.473701	f	f
313432	TGBU8751446	2021-07-16 23:48:00	Shanghai Shengdong (I), Yangshan,Shanghai,Shanghai,China	Shanghai	China	\N	Shanghai Shengdong (I), Yangshan	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	31.230416	121.473701	f	f
313434	TGBU8751446	2021-07-17 18:27:00	Shanghai Shengdong (I), Yangshan,Shanghai,Shanghai,China	Shanghai	China	CNSGH	Shanghai Shengdong (I), Yangshan	Loaded on vessel at origin port	Loaded at First POL	9645906	477271300	038E	Vessel	CSCL YELLOW SEA	31.233333333333334	121.48333333333333	f	f
313435	TGBU8751446	2021-08-05 06:30:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
313443	CBHU8795754	2021-07-07 18:33:00	Shanghai Shengdong (I), Yangshan,Shanghai,Shanghai,China	Shanghai	China	\N	Shanghai Shengdong (I), Yangshan	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	31.230416	121.473701	f	f
313444	CBHU8795754	2021-07-17 05:29:00	Shanghai Shengdong (I), Yangshan,Shanghai,Shanghai,China	Shanghai	China	\N	Shanghai Shengdong (I), Yangshan	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	31.230416	121.473701	f	f
313446	CBHU8795754	2021-07-17 18:07:00	Shanghai Shengdong (I), Yangshan,Shanghai,Shanghai,China	Shanghai	China	CNSGH	Shanghai Shengdong (I), Yangshan	Loaded on vessel at origin port	Loaded at First POL	9645906	477271300	038E	Vessel	CSCL YELLOW SEA	31.233333333333334	121.48333333333333	f	f
313447	CBHU8795754	2021-08-05 06:30:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
313458	TLLU5474821	2021-07-16 09:45:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	K LINE MOBARU DIAMOND INDONESIA	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
313459	TLLU5474821	2021-07-16 23:34:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
313460	TLLU5474821	2021-07-18 14:51:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'WIDE JULIET 001N' at Port of Loading	\N	\N	001N	Vessel	WIDE JULIET	-6.133333333333334	106.83333333333333	f	f
313461	TLLU5474821	2021-07-18 21:35:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'WIDE JULIET 001N' Departure from Port of Loading	\N	\N	001N	Vessel	WIDE JULIET	-6.133333333333334	106.83333333333333	f	f
313462	TLLU5474821	2021-07-23 12:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'WIDE JULIET 001N' Arrival at Transhipment Port	\N	\N	001N	Vessel	WIDE JULIET	1.271978728313698	103.768308722207	f	f
313463	TLLU5474821	2021-07-23 14:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'WIDE JULIET 001N' T/S Berthing Destination	\N	\N	001N	Vessel	WIDE JULIET	1.271978728313698	103.768308722207	f	f
313464	TLLU5474821	2021-07-23 21:46:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'WIDE JULIET 001N' at Transhipment Port	\N	\N	001N	Vessel	WIDE JULIET	1.271978728313698	103.768308722207	f	f
313465	TLLU5474821	2021-08-08 19:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
313466	TLLU5474821	2021-08-09 10:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
313467	TLLU5474821	2021-09-06 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE BLUE JAY 023E' Arrival at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
313469	TLLU5474821	2021-09-06 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE BLUE JAY 023E' POD Berthing Destination	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
313470	TLLU5474821	2021-09-06 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE BLUE JAY 023E' at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
313471	TLLU5474821	2021-09-06 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
313472	TLLU5474821	2021-09-07 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
313480	TLLU5474821	2021-08-09 01:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
313481	TLLU5474821	2021-08-09 15:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
313510	TLLU5474821	2021-08-09 06:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
313511	TLLU5474821	2021-08-09 21:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
313525	TLLU5474821	2021-08-09 07:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
313526	TLLU5474821	2021-08-09 21:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
313540	TLLU5474821	2021-08-08 04:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
313541	TLLU5474821	2021-08-08 18:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
313628	TCLU4999550	2021-07-12 19:50:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
313629	TCLU4999550	2021-07-14 04:19:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
313630	TCLU4999550	2021-07-17 05:14:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Loaded on feeder	Feeder Loading at POL	\N	\N	\N	Feeder	\N	-6.2087634	106.845599	f	f
313631	TCLU4999550	2021-07-22 02:00:00	SINGAPORE	Singapore	Singapore	\N	\N	Feeder arrived	Feeder Arrival at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
313632	TCLU4999550	2021-07-22 06:26:00	SINGAPORE	Singapore	Singapore	\N	\N	Discharged from feeder	Feeder Unloading at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
313633	TCLU4999550	2021-08-01 08:51:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	9312781	372218000	0072E	Vessel	NYK VEGA	1.271978728313698	103.768308722207	f	f
313634	TCLU4999550	2021-08-02 00:50:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	9312781	372218000	0072E	Vessel	NYK VEGA	1.271978728313698	103.768308722207	f	f
313635	TCLU4999550	2021-08-24 12:50:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9312781	372218000	\N	Vessel	NYK VEGA	34.0522342	-118.2436849	t	t
313658	TCLU4999550	2021-08-24 13:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9312781	372218000	\N	Vessel	NYK VEGA	34.0522342	-118.2436849	t	t
313688	GAOU6340626	2021-07-12 20:04:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
313689	GAOU6340626	2021-07-14 04:24:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
313690	GAOU6340626	2021-07-18 09:21:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Loaded on feeder	Feeder Loading at POL	\N	\N	\N	Feeder	\N	-6.2087634	106.845599	f	f
313691	GAOU6340626	2021-07-22 02:00:00	SINGAPORE	Singapore	Singapore	\N	\N	Feeder arrived	Feeder Arrival at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
313692	GAOU6340626	2021-08-01 12:39:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	9312781	372218000	0072E	Vessel	NYK VEGA	1.271978728313698	103.768308722207	f	f
313693	GAOU6340626	2021-08-02 00:50:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	9312781	372218000	0072E	Vessel	NYK VEGA	1.271978728313698	103.768308722207	f	f
313694	GAOU6340626	2021-08-24 12:50:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9312781	372218000	\N	Vessel	NYK VEGA	34.0522342	-118.2436849	t	t
313714	GAOU6340626	2021-08-24 13:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9312781	372218000	\N	Vessel	NYK VEGA	34.0522342	-118.2436849	t	t
313890	TCNU8925527	2021-07-13 22:18:00	SHANGHAI	Shanghai	China	CNSHA	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	31.233333333333334	121.48333333333333	f	f
313891	TCNU8925527	2021-07-22 17:43:00	SHANGHAI	Shanghai	China	CNSHA	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	31.233333333333334	121.48333333333333	f	f
313892	TCNU8925527	2021-07-29 23:55:00	SHANGHAI	Shanghai	China	CNSHA	\N	Loaded on vessel	Loaded	\N	\N	US128N	\N	MSC JOSSELINE	31.233333333333334	121.48333333333333	f	f
313893	TCNU8925527	2021-08-18 13:45:00	LOS ANGELES	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Estimated Time of Arrival	\N	\N	\N	\N	MSC JOSSELINE	34.0522342	-118.2436849	t	t
313913	TCNU8925527	2021-08-17 13:30:00	LOS ANGELES	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Estimated Time of Arrival	\N	\N	\N	\N	MSC JOSSELINE	34.0522342	-118.2436849	t	t
313992	FDCU0634690	2021-07-15 15:49:00	PHNOM PENH ,CAMBODIA	Phnom Penh	Cambodia	KHPNH	PHNOM PENH - SO NGUON DRY PORT	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	11.5563738	104.9282099	f	f
313993	FDCU0634690	2021-07-17 14:16:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	10.64604378127943	103.5095980083301	f	f
313994	FDCU0634690	2021-07-21 23:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Loaded on vessel	Loaded on 'BRIDGE 0187S' at Port of Loading	2684361	304010914	187S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
313995	FDCU0634690	2021-07-22 08:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Vessel departed	'BRIDGE 0187S' Departure from Port of Loading	2684361	304010914	187S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
313996	FDCU0634690	2021-07-25 04:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BRIDGE 0187S' Arrival at Transhipment Port	2684361	304010914	187S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
313997	FDCU0634690	2021-07-25 06:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BRIDGE 0187S' T/S Berthing Destination	2684361	304010914	187S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
313998	FDCU0634690	2021-07-25 15:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BRIDGE 0187S' at Transhipment Port	2684361	304010914	187S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
313999	FDCU0634690	2021-08-08 19:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314000	FDCU0634690	2021-08-09 10:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314001	FDCU0634690	2021-09-06 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE BLUE JAY 023E' Arrival at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
314003	FDCU0634690	2021-09-06 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE BLUE JAY 023E' POD Berthing Destination	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
314004	FDCU0634690	2021-09-06 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE BLUE JAY 023E' at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
314005	FDCU0634690	2021-09-06 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
314006	FDCU0634690	2021-09-07 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
314014	FDCU0634690	2021-08-09 01:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314015	FDCU0634690	2021-08-09 15:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314044	FDCU0634690	2021-08-09 06:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314045	FDCU0634690	2021-08-09 21:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314059	FDCU0634690	2021-08-09 07:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314060	FDCU0634690	2021-08-09 21:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314074	FDCU0634690	2021-08-08 04:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314075	FDCU0634690	2021-08-08 18:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314179	TCNU7773775	2021-07-15 15:49:00	PHNOM PENH ,CAMBODIA	Phnom Penh	Cambodia	KHPNH	PHNOM PENH - SO NGUON DRY PORT	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	11.5563738	104.9282099	f	f
314180	TCNU7773775	2021-07-17 14:16:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	10.64604378127943	103.5095980083301	f	f
314181	TCNU7773775	2021-07-21 23:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Loaded on vessel	Loaded on 'BRIDGE 0187S' at Port of Loading	2684361	304010914	187S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
314182	TCNU7773775	2021-07-22 08:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Vessel departed	'BRIDGE 0187S' Departure from Port of Loading	2684361	304010914	187S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
314183	TCNU7773775	2021-07-25 04:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BRIDGE 0187S' Arrival at Transhipment Port	2684361	304010914	187S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
314184	TCNU7773775	2021-07-25 06:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BRIDGE 0187S' T/S Berthing Destination	2684361	304010914	187S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
314185	TCNU7773775	2021-07-25 14:36:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BRIDGE 0187S' at Transhipment Port	2684361	304010914	187S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
314186	TCNU7773775	2021-08-08 19:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314187	TCNU7773775	2021-08-09 10:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314188	TCNU7773775	2021-09-06 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE BLUE JAY 023E' Arrival at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
314190	TCNU7773775	2021-09-06 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE BLUE JAY 023E' POD Berthing Destination	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
314191	TCNU7773775	2021-09-06 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE BLUE JAY 023E' at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
314192	TCNU7773775	2021-09-06 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
314193	TCNU7773775	2021-09-07 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
314201	TCNU7773775	2021-08-09 01:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314801	KOCU4614169	2021-07-30 17:48:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
314231	TCNU7773775	2021-08-09 06:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314232	TCNU7773775	2021-08-09 21:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314246	TCNU7773775	2021-08-09 07:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314247	TCNU7773775	2021-08-09 21:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314261	TCNU7773775	2021-08-08 04:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314262	TCNU7773775	2021-08-08 18:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
314381	MSMU5139314	2021-07-13 14:30:00	SHANGHAI	Shanghai	China	CNSHA	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	31.233333333333334	121.48333333333333	f	f
314382	MSMU5139314	2021-07-22 22:44:00	SHANGHAI	Shanghai	China	CNSHA	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	31.233333333333334	121.48333333333333	f	f
314383	MSMU5139314	2021-07-29 23:55:00	SHANGHAI	Shanghai	China	CNSHA	\N	Loaded on vessel	Loaded	\N	\N	US128N	\N	MSC JOSSELINE	31.233333333333334	121.48333333333333	f	f
314384	MSMU5139314	2021-08-18 13:45:00	LOS ANGELES	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Estimated Time of Arrival	\N	\N	\N	\N	MSC JOSSELINE	34.0522342	-118.2436849	t	t
314396	MSMU5139314	2021-08-17 13:30:00	LOS ANGELES	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Estimated Time of Arrival	\N	\N	\N	\N	MSC JOSSELINE	34.0522342	-118.2436849	t	t
314553	FFAU1245525	2021-07-13 14:08:00	SHANGHAI	Shanghai	China	CNSHA	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	31.233333333333334	121.48333333333333	f	f
314554	FFAU1245525	2021-07-23 07:58:00	SHANGHAI	Shanghai	China	CNSHA	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	31.233333333333334	121.48333333333333	f	f
314555	FFAU1245525	2021-07-29 23:55:00	SHANGHAI	Shanghai	China	CNSHA	\N	Loaded on vessel	Loaded	\N	\N	US128N	\N	MSC JOSSELINE	31.233333333333334	121.48333333333333	f	f
314556	FFAU1245525	2021-08-18 13:45:00	LOS ANGELES	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Estimated Time of Arrival	\N	\N	\N	\N	MSC JOSSELINE	34.0522342	-118.2436849	t	t
314564	FFAU1245525	2021-08-17 13:30:00	LOS ANGELES	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Estimated Time of Arrival	\N	\N	\N	\N	MSC JOSSELINE	34.0522342	-118.2436849	t	t
314725	KOCU5089851	2021-06-17 19:52:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
314726	KOCU5089851	2021-06-19 01:08:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
314727	KOCU5089851	2021-06-23 06:41:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Loaded on feeder	Feeder Loading at POL	\N	\N	\N	Feeder	\N	-6.2087634	106.845599	f	f
314728	KOCU5089851	2021-06-23 14:50:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Feeder departed	Feeder Departure from POL	\N	\N	\N	Feeder	\N	-6.2087634	106.845599	f	f
314729	KOCU5089851	2021-06-26 22:03:00	SINGAPORE	Singapore	Singapore	\N	\N	Discharged from feeder	Feeder Unloading at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
314730	KOCU5089851	2021-06-28 10:05:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	9305661	212348000	0129E	Vessel	HYUNDAI HONGKONG	1.271978728313698	103.768308722207	f	f
314731	KOCU5089851	2021-06-29 02:40:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	9305661	212348000	0129E	Vessel	HYUNDAI HONGKONG	1.271978728313698	103.768308722207	f	f
314732	KOCU5089851	2021-07-26 21:30:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel Arrival at POD	9305661	212348000	0129E	Vessel	HYUNDAI HONGKONG	34.0522342	-118.2436849	f	f
314733	KOCU5089851	2021-07-31 22:12:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Vessel berthed in port	Vessel Berthing at POD	9305661	212348000	0129E	Vessel	HYUNDAI HONGKONG	34.0522342	-118.2436849	f	f
314734	KOCU5089851	2021-08-02 17:50:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Vessel Unloading at POD	Vessel Unloading at POD	9305661	212348000	0129E	Vessel	HYUNDAI HONGKONG	34.0522342	-118.2436849	f	f
314792	KOCU4614169	2021-06-17 03:42:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
314793	KOCU4614169	2021-06-17 23:28:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
314794	KOCU4614169	2021-06-23 09:11:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	8412144	548752000	0015N	Vessel	ALABAMA	-6.133333333333334	106.83333333333333	f	f
314795	KOCU4614169	2021-06-23 15:30:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	8412144	548752000	0015N	Vessel	ALABAMA	-6.133333333333334	106.83333333333333	f	f
314796	KOCU4614169	2021-07-06 00:00:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	8412144	548752000	0015N	Vessel	ALABAMA	34.93333333333333	127.7	f	f
314797	KOCU4614169	2021-07-06 01:30:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel berthed in port	Vessel Berthing at T/S Port	8412144	548752000	0015N	Vessel	ALABAMA	34.93333333333333	127.7	f	f
314798	KOCU4614169	2021-07-06 16:06:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate Out from T/S Terminal	Truck Gate Out from T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
314799	KOCU4614169	2021-07-06 16:08:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate In to T/S Terminal	Truck Gate In to T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
314800	KOCU4614169	2021-07-30 14:56:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
322668	TCNU8326529	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
314802	KOCU4614169	2021-08-27 13:00:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
314824	KOCU4614169	2021-08-24 09:12:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
314834	KOCU4614169	2021-07-30 17:54:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
314835	KOCU4614169	2021-08-24 06:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
314845	KOCU4614169	2021-07-30 17:30:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
314846	KOCU4614169	2021-08-24 03:30:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
314880	KOCU4118050	2021-06-17 19:53:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
314881	KOCU4118050	2021-06-18 20:47:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
314882	KOCU4118050	2021-06-23 05:21:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	8412144	548752000	0015N	Vessel	ALABAMA	-6.133333333333334	106.83333333333333	f	f
314883	KOCU4118050	2021-06-23 15:30:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	8412144	548752000	0015N	Vessel	ALABAMA	-6.133333333333334	106.83333333333333	f	f
314884	KOCU4118050	2021-07-06 00:00:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	8412144	548752000	0015N	Vessel	ALABAMA	34.93333333333333	127.7	f	f
314885	KOCU4118050	2021-07-06 01:30:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel berthed in port	Vessel Berthing at T/S Port	8412144	548752000	0015N	Vessel	ALABAMA	34.93333333333333	127.7	f	f
314886	KOCU4118050	2021-07-06 16:56:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate Out from T/S Terminal	Truck Gate Out from T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
314887	KOCU4118050	2021-07-06 17:00:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	\N	\N	Truck Gate In to T/S Terminal	Truck Gate In to T/S Terminal	\N	\N	\N	Truck	\N	34.9406968	127.6958882	f	f
314888	KOCU4118050	2021-07-30 14:34:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
314889	KOCU4118050	2021-07-30 17:48:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
314890	KOCU4118050	2021-08-27 13:00:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
314912	KOCU4118050	2021-08-24 09:12:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
314933	KOCU4118050	2021-07-30 17:54:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
314934	KOCU4118050	2021-08-24 06:24:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
314955	KOCU4118050	2021-07-30 17:30:00	GWANGYANG, KOREA	Gwangyang-si	South Korea	KRKAN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	\N	\N	0029E	Vessel	HYUNDAI MARS	34.93333333333333	127.7	f	f
314956	KOCU4118050	2021-08-24 03:30:00	LONG BEACH, CA	Long Beach	United States	USLGB	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	HYUNDAI MARS	33.766666666666666	-118.18333333333334	t	t
315013	FFAU1812974	2021-06-19 11:03:00	SEMARANG ,INDONESIA	Semarang	Indonesia	IDSRG	SRICON LOGISTIK	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.966666666666667	110.48333333333333	f	f
315014	FFAU1812974	2021-06-21 22:33:00	SEMARANG ,INDONESIA	Semarang	Indonesia	IDSRG	TERMINAL PETIKEMAS SEMARANG	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.966666666666667	110.48333333333333	f	f
315015	FFAU1812974	2021-06-24 15:04:00	SEMARANG ,INDONESIA	Semarang	Indonesia	IDSRG	TERMINAL PETIKEMAS SEMARANG	Loaded on vessel	Loaded on 'TRADER 032N' at Port of Loading	9756925	548950000	032W	Vessel	TRADER	-6.966666666666667	110.48333333333333	f	f
315016	FFAU1812974	2021-06-24 19:35:00	SEMARANG ,INDONESIA	Semarang	Indonesia	IDSRG	TERMINAL PETIKEMAS SEMARANG	Vessel departed	'TRADER 032N' Departure from Port of Loading	9756925	548950000	032W	Vessel	TRADER	-6.966666666666667	110.48333333333333	f	f
315017	FFAU1812974	2021-06-29 18:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'TRADER 032N' Arrival at Transhipment Port	9756925	548950000	032W	Vessel	TRADER	1.271978728313698	103.768308722207	f	f
315018	FFAU1812974	2021-06-29 20:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'TRADER 032N' T/S Berthing Destination	9756925	548950000	032W	Vessel	TRADER	1.271978728313698	103.768308722207	f	f
315019	FFAU1812974	2021-06-30 04:10:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'TRADER 032N' at Transhipment Port	9756925	548950000	032W	Vessel	TRADER	1.271978728313698	103.768308722207	f	f
315020	FFAU1812974	2021-07-06 23:32:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'YM WIDTH 023E' at Transhipment Port	9708447	477129300	023E	Vessel	YM WIDTH	1.271978728313698	103.768308722207	f	f
315021	FFAU1812974	2021-07-07 08:25:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9708447	477129300	023E	Vessel	YM WIDTH	1.271978728313698	103.768308722207	f	f
315022	FFAU1812974	2021-08-02 19:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel arrival	'YM WIDTH 023E' Arrival at Port of Discharging	9708447	477129300	023E	Vessel	YM WIDTH	40.7	-74	f	f
315649	HMMU6010407	2021-07-10 19:44:00	SINGAPORE	Singapore	Singapore	\N	\N	Discharged from feeder	Feeder Unloading at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
315024	FFAU1812974	2021-08-02 22:34:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel berthed in port	'YM WIDTH 023E' POD Berthing Destination	9708447	477129300	023E	Vessel	YM WIDTH	40.7	-74	f	f
315025	FFAU1812974	2021-08-03 00:32:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Discharged from vessel	Unloaded from 'YM WIDTH 023E' at Port of Discharging	9708447	477129300	023E	Vessel	YM WIDTH	40.7	-74	f	f
315026	FFAU1812974	2021-08-03 05:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
315027	FFAU1812974	2021-08-03 11:30:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
315084	FFAU1812974	2021-08-02 22:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Vessel berthed in port	'YM WIDTH 023E' POD Berthing Destination	9708447	477129300	023E	Vessel	YM WIDTH	40.7	-74	f	t
315085	FFAU1812974	2021-08-02 23:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Discharged from vessel	Unloaded from 'YM WIDTH 023E' at Port of Discharging	9708447	477129300	023E	Vessel	YM WIDTH	40.7	-74	f	t
315086	FFAU1812974	2021-08-03 04:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	GCT BAYONNE TERMINAL	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
315087	FFAU1812974	2021-08-03 10:00:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
315259	TCKU6188160	2021-06-17 11:22:00	WORLDBRIDGE FLEET MANAGEMENT CO.LTD,Phnom Penh,Phnum Penh,Cambodia	Phnom Penh	Cambodia	\N	WORLDBRIDGE FLEET MANAGEMENT CO.LTD	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	11.5448729	104.8921668	f	f
315260	TCKU6188160	2021-06-18 20:45:00	Port Authority Of Sihanoukville,Sihanoukville,Sihanoukville,Cambodia	Preah Sihanouk	Cambodia	\N	Port Authority Of Sihanoukville	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	10.6267867	103.5115545	f	f
315262	TCKU6188160	2021-06-20 17:30:00	Port Authority Of Sihanoukville,Sihanoukville,Sihanoukville,Cambodia	Preah Sihanouk	Cambodia	\N	Port Authority Of Sihanoukville	Loaded on vessel at origin port	Loaded at First POL	\N	\N	\N	Feeder	\N	10.6267867	103.5115545	f	f
315263	TCKU6188160	2021-06-25 02:59:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	\N	Pasir Panjang Terminal	Discharged transshipment	Discharged at T/S POD	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
315264	TCKU6188160	2021-07-05 12:28:00	Pasir Panjang Terminal,Singapore,,Singapore	Singapore	Singapore	SGSIN	Pasir Panjang Terminal	Loaded on vessel at transshipment port	Loaded at T/S POL	\N	\N	0TUIBE1MA	Vessel	CMA CGM CHILE	1.271978728313698	103.768308722207	f	f
315265	TCKU6188160	2021-08-12 08:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
315354	CMAU5234855	2021-06-21 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Gate out empty	Empty to shipper	\N	\N	0IN9BW1MA	Vessel	CMA CGM BUTTERFLY	31.416666666666668	31.816666666666666	f	f
315355	CMAU5234855	2021-06-24 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Gate in at origin port	Ready to be loaded	\N	\N	0IN9BW1MA	Vessel	CMA CGM BUTTERFLY	31.416666666666668	31.816666666666666	f	f
315356	CMAU5234855	2021-06-27 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Loaded on vessel	Loaded on board	\N	\N	0IN9BW1MA	Vessel	CMA CGM BUTTERFLY	31.416666666666668	31.816666666666666	f	f
315357	CMAU5234855	2021-07-14 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Discharged from vessel	Discharged	\N	\N	0IN9CE1MA	Vessel	CMA CGM BUTTERFLY	36.8507689	-76.28587259999999	f	f
315358	CMAU5234855	2021-07-26 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Loaded on rail	Full Load on rail for import	\N	\N	\N	\N	\N	36.8507689	-76.28587259999999	f	f
315359	CMAU5234855	2021-07-27 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Gate out	Container in transit for import	\N	\N	\N	\N	\N	36.8507689	-76.28587259999999	f	f
315362	CMAU5234855	2021-08-02 04:00:00	ELKHART, IN	Elkhart	United States	USEKI	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	41.6812083	-85.9656249	f	f
315398	CMAU5234855	2021-07-29 04:00:00	PORTSMOUTH, OH	Portsmouth	United States	USPSM	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	38.7317431	-82.9976742	f	f
315606	CAIU9968345	2021-06-28 11:14:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
315607	CAIU9968345	2021-06-28 23:32:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
315608	CAIU9968345	2021-07-07 11:51:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Loaded on feeder	Feeder Loading at POL	\N	\N	\N	Feeder	\N	-6.2087634	106.845599	f	f
315609	CAIU9968345	2021-07-10 13:20:00	SINGAPORE	Singapore	Singapore	\N	\N	Feeder arrived	Feeder Arrival at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
315610	CAIU9968345	2021-07-10 19:44:00	SINGAPORE	Singapore	Singapore	\N	\N	Discharged from feeder	Feeder Unloading at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
315611	CAIU9968345	2021-07-23 16:08:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	9388352	370407000	0057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
315612	CAIU9968345	2021-07-24 17:15:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	9388352	370407000	0057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
315613	CAIU9968345	2021-08-18 13:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9388352	370407000	\N	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	t	t
315621	CAIU9968345	2021-08-16 13:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9388352	370407000	\N	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	t	t
315629	CAIU9968345	2021-08-15 23:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9388352	370407000	\N	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	t	t
315645	HMMU6010407	2021-06-28 11:49:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
315646	HMMU6010407	2021-06-28 23:36:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
315647	HMMU6010407	2021-07-07 11:51:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Loaded on feeder	Feeder Loading at POL	\N	\N	\N	Feeder	\N	-6.2087634	106.845599	f	f
315648	HMMU6010407	2021-07-10 13:20:00	SINGAPORE	Singapore	Singapore	\N	\N	Feeder arrived	Feeder Arrival at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
315650	HMMU6010407	2021-07-23 16:31:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	9388352	370407000	0057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
315651	HMMU6010407	2021-07-24 17:15:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	9388352	370407000	0057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
315652	HMMU6010407	2021-08-15 23:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9388352	370407000	\N	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	t	t
315741	CRSU9367040	2021-06-29 09:55:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	DUNIA EXPRESS TRANSINDO	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
315742	CRSU9367040	2021-06-30 02:23:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
315743	CRSU9367040	2021-07-04 05:52:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'BANGKOK BRIDGE 121N' at Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
315744	CRSU9367040	2021-07-05 09:30:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'BANGKOK BRIDGE 121N' Departure from Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
315745	CRSU9367040	2021-07-08 00:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BANGKOK BRIDGE 121N' Arrival at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
315746	CRSU9367040	2021-07-08 02:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BANGKOK BRIDGE 121N' T/S Berthing Destination	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
315747	CRSU9367040	2021-07-09 20:21:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BANGKOK BRIDGE 121N' at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
315748	CRSU9367040	2021-07-17 18:29:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
315749	CRSU9367040	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
315750	CRSU9367040	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
315752	CRSU9367040	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
315753	CRSU9367040	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
315754	CRSU9367040	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
315755	CRSU9367040	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
315885	CRSU9367040	2021-08-20 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
315923	TCLU9689250	2021-06-29 13:53:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	DUNIA EXPRESS TRANSINDO	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
315924	TCLU9689250	2021-06-30 23:46:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
315925	TCLU9689250	2021-07-05 02:55:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'BANGKOK BRIDGE 121N' at Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
315926	TCLU9689250	2021-07-05 09:30:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'BANGKOK BRIDGE 121N' Departure from Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
315927	TCLU9689250	2021-07-08 00:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BANGKOK BRIDGE 121N' Arrival at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
315928	TCLU9689250	2021-07-08 02:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BANGKOK BRIDGE 121N' T/S Berthing Destination	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
315929	TCLU9689250	2021-07-09 11:17:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BANGKOK BRIDGE 121N' at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
315930	TCLU9689250	2021-07-17 10:19:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
315931	TCLU9689250	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
315932	TCLU9689250	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
322677	TCNU8326529	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.6475811	-63.5727683	f	t
315934	TCLU9689250	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
315935	TCLU9689250	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
315936	TCLU9689250	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
315937	TCLU9689250	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
316097	TCLU9689250	2021-08-20 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
316127	FCIU9285028	2021-06-30 09:26:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	DUNIA EXPRESS TRANSINDO	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
316128	FCIU9285028	2021-06-30 23:56:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
316129	FCIU9285028	2021-07-05 02:59:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'BANGKOK BRIDGE 121N' at Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
316130	FCIU9285028	2021-07-05 09:30:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'BANGKOK BRIDGE 121N' Departure from Port of Loading	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	-6.133333333333334	106.83333333333333	f	f
316131	FCIU9285028	2021-07-08 00:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BANGKOK BRIDGE 121N' Arrival at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
316132	FCIU9285028	2021-07-08 02:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BANGKOK BRIDGE 121N' T/S Berthing Destination	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
316133	FCIU9285028	2021-07-09 17:57:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BANGKOK BRIDGE 121N' at Transhipment Port	9463279	353368000	121N	Vessel	BANGKOK BRIDGE	1.271978728313698	103.768308722207	f	f
316134	FCIU9285028	2021-07-17 02:49:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
316135	FCIU9285028	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
316136	FCIU9285028	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
316138	FCIU9285028	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
316139	FCIU9285028	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
316140	FCIU9285028	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
316141	FCIU9285028	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
316271	FCIU9285028	2021-08-20 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
316427	TCNU7598590	2021-06-01 00:00:00	PORT SAID	Port Said	Egypt	EGPSD	\N	Gate out empty	Empty to shipper	\N	\N	\N	\N	\N	31.2652893	32.3018661	f	f
316428	TCNU7598590	2021-06-03 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Gate in at origin port	Ready to be loaded	\N	\N	0IN93W1MA	Vessel	MOL COURAGE	31.416666666666668	31.816666666666666	f	f
316429	TCNU7598590	2021-06-09 00:00:00	DAMIETTA	Damietta	Egypt	EGDAM	\N	Loaded on vessel	Loaded on board	\N	\N	0IN93W1MA	Vessel	MOL COURAGE	31.416666666666668	31.816666666666666	f	f
316430	TCNU7598590	2021-06-26 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Discharged from vessel	Discharged	\N	\N	0IN94E1MA	Vessel	MOL COURAGE	36.8507689	-76.28587259999999	f	f
316431	TCNU7598590	2021-06-30 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Gate out	Container in transit for import	\N	\N	0IN94E1MA	Vessel	MOL COURAGE	36.8507689	-76.28587259999999	f	f
316433	TCNU7598590	2021-07-01 04:00:00	NORFOLK, VA	Norfolk	United States	USORF	\N	Loaded on rail	Full Load on rail for import	\N	\N	\N	\N	\N	36.8507689	-76.28587259999999	f	f
316435	TCNU7598590	2021-08-01 07:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Rail arrived	Train arrival for import	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
316437	TCNU7598590	2021-08-02 07:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Gate in	Received for import transfer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
316479	TCNU7598590	2021-07-31 07:00:00	BARSTOW, CA	Barstow	United States	\N	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	34.8957957	-117.0172826	f	f
316488	TCNU7598590	2021-07-30 07:00:00	WINSLOW, AZ	Winslow	United States	\N	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	35.0241873	-110.6973571	f	f
316497	TCNU7598590	2021-07-30 06:00:00	BELEN, NM	Belen	United States	\N	\N	Loaded on rail	Container on rail for import	\N	\N	\N	\N	\N	34.6627652	-106.7761546	f	f
316678	TCNU4554285	2021-07-06 19:15:00	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty container dispatched from inland point to Customer	9290799	636091739	453	Vessel	TESSA	20.8449115	106.6880841	f	f
316679	TCNU4554285	2021-07-06 21:55:00	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Export Gate-In to Port of Loading 	Export Gate-In to Port of Loading 	9366421	565865000	46	Vessel	ASIATIC MOON	20.8449115	106.6880841	f	f
316680	TCNU4554285	2021-07-11 03:00:00	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel at origin port	Container was loaded at Port of Loading to Transshipment Port	9366421	565865000	46	Vessel	ASIATIC MOON	20.8449115	106.6880841	f	f
316681	TCNU4554285	2021-07-11 12:50:01	HAIPHONG, VIETNAM	Haiphong	Vietnam	VNHPH	\N	Vessel departed	Vessel departure from Port of Loading to Transshipment Port	9366421	565865000	46	Vessel	ASIATIC MOON	20.8449115	106.6880841	f	f
316682	TCNU4554285	2021-07-14 07:07:00	DA CHAN BAY (GD), CHINA. PEOPLE'S REPUBLIC	Da Chan Bay (Gd)	China	CNDCB	\N	Vessel arrived	Vessel arrival to Transshipment Port	9366421	565865000	46	Vessel	ASIATIC MOON	22.533333333333335	113.86666666666666	f	f
316683	TCNU4554285	2021-07-14 17:25:00	DA CHAN BAY (GD), CHINA. PEOPLE'S REPUBLIC	Da Chan Bay (Gd)	China	CNDCB	\N	Discharged from vessel at transshipment port	Container was discharged at Transshipment Port	9366421	565865000	46	Vessel	ASIATIC MOON	22.533333333333335	113.86666666666666	f	f
316684	TCNU4554285	2021-07-20 08:33:07	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Carrier release	Carrier Release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
316685	TCNU4554285	2021-07-22 14:37:00	DA CHAN BAY (GD), CHINA. PEOPLE'S REPUBLIC	Da Chan Bay (Gd)	China	CNDCB	\N	Loaded transshipment	Container was loaded at Transsihipment Port to Port of Discharge	\N	\N	4	Vessel	SPYROS V	22.533333333333335	113.86666666666666	f	f
316686	TCNU4554285	2021-07-23 10:45:00	DA CHAN BAY (GD), CHINA. PEOPLE'S REPUBLIC	Da Chan Bay (Gd)	China	CNDCB	\N	Vessel departed	Vessel departure from Transshipment Port to Port of Discharge	\N	\N	4	Vessel	SPYROS V	22.533333333333335	113.86666666666666	f	f
316687	TCNU4554285	2021-08-02 13:41:33	LOS ANGELES (CA), U.S.A.	Los Angeles	United States	USLAX	\N	Customs release	Customs release	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
316688	TCNU4554285	2021-08-06 08:00:00	LOS ANGELES (CA), CHINA. PEOPLE'S REPUBLIC	Washington	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	38.9428097	-77.0663637	t	f
316921	KOCU4919070	2021-07-09 09:07:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
316922	KOCU4919070	2021-07-09 22:22:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
316923	KOCU4919070	2021-07-12 06:37:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	9326768	371110000	0043N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
316924	KOCU4919070	2021-07-12 18:00:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	9326768	371110000	0043N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
316925	KOCU4919070	2021-07-22 14:45:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
316926	KOCU4919070	2021-07-22 15:45:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel berthed in port	Vessel Berthing at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
316927	KOCU4919070	2021-07-23 01:57:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Discharged transshipment	Vessel Unloading at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
316928	KOCU4919070	2021-08-26 19:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
316944	KOCU4919070	2021-08-23 02:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
317040	CAIU7667960	2021-07-02 17:15:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
317041	CAIU7667960	2021-07-03 15:08:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
317042	CAIU7667960	2021-07-05 21:08:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Loaded on feeder	Feeder Loading at POL	\N	\N	\N	Feeder	\N	-6.2087634	106.845599	f	f
317043	CAIU7667960	2021-07-09 13:30:00	SINGAPORE	Singapore	Singapore	\N	\N	Feeder arrived	Feeder Arrival at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
317044	CAIU7667960	2021-07-09 22:43:00	SINGAPORE	Singapore	Singapore	\N	\N	Discharged from feeder	Feeder Unloading at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
317045	CAIU7667960	2021-08-01 09:23:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	9312781	372218000	0072E	Vessel	NYK VEGA	1.271978728313698	103.768308722207	f	f
317046	CAIU7667960	2021-08-02 00:50:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	9312781	372218000	0072E	Vessel	NYK VEGA	1.271978728313698	103.768308722207	f	f
317047	CAIU7667960	2021-08-24 12:50:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9312781	372218000	\N	Vessel	NYK VEGA	34.0522342	-118.2436849	t	t
317054	CAIU7667960	2021-08-24 13:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9312781	372218000	\N	Vessel	NYK VEGA	34.0522342	-118.2436849	t	t
317160	TCNU7229890	2021-07-02 20:12:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
317161	TCNU7229890	2021-07-08 03:15:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
317162	TCNU7229890	2021-07-12 15:58:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	9326768	371110000	0043N	Vessel	NORTH BRIDGE	-6.098516936064017	106.9023760515587	f	f
317163	TCNU7229890	2021-07-12 18:00:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	9326768	371110000	0043N	Vessel	NORTH BRIDGE	-6.098516936064017	106.9023760515587	f	f
317164	TCNU7229890	2021-07-22 14:45:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
317165	TCNU7229890	2021-07-22 15:45:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel berthed in port	Vessel Berthing at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
322678	TCNU8326529	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
317166	TCNU7229890	2021-08-23 02:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
317236	TCNU5069068	2021-07-02 22:23:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
317237	TCNU5069068	2021-07-08 03:08:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
317238	TCNU5069068	2021-07-12 15:50:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel at origin port	Vessel Loading at POL	9326768	371110000	0043N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
317239	TCNU5069068	2021-07-12 18:00:00	JAKARTA, INDONESIA	Jakarta	Indonesia	IDJKT	\N	Vessel departure from origin port	Vessel Departure from POL	9326768	371110000	0043N	Vessel	NORTH BRIDGE	-6.133333333333334	106.83333333333333	f	f
317240	TCNU5069068	2021-07-22 14:45:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel arrival at transshipment port	Vessel Arrival at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
317241	TCNU5069068	2021-07-22 15:45:00	BUSAN, KOREA	Busan	South Korea	KRPUS	\N	Vessel berthed in port	Vessel Berthing at T/S Port	9326768	371110000	0043N	Vessel	NORTH BRIDGE	35.13333333333333	129.05	f	f
317242	TCNU5069068	2021-08-27 14:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
317249	TCNU5069068	2021-08-26 19:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
317256	TCNU5069068	2021-08-23 02:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9326768	371110000	\N	Vessel	NORTH BRIDGE	34.0522342	-118.2436849	t	t
317291	TCLU9826500	2021-07-02 02:19:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	K LINE MOBARU DIAMOND INDONESIA	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
317292	TCLU9826500	2021-07-02 20:36:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
317293	TCLU9826500	2021-07-07 16:43:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'ALLEGORIA 044N' at Port of Loading	9295945	255805779	044N	Vessel	ALLEGORIA	-6.133333333333334	106.83333333333333	f	f
317294	TCLU9826500	2021-07-08 05:50:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'ALLEGORIA 044N' Departure from Port of Loading	9295945	255805779	044N	Vessel	ALLEGORIA	-6.133333333333334	106.83333333333333	f	f
317295	TCLU9826500	2021-07-10 05:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'ALLEGORIA 044N' Arrival at Transhipment Port	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
317296	TCLU9826500	2021-07-10 07:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'ALLEGORIA 044N' T/S Berthing Destination	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
317297	TCLU9826500	2021-07-11 00:25:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'ALLEGORIA 044N' at Transhipment Port	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
317298	TCLU9826500	2021-07-17 10:02:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
317299	TCLU9826500	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
317300	TCLU9826500	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
317302	TCLU9826500	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
317303	TCLU9826500	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
317304	TCLU9826500	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
317305	TCLU9826500	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
317435	TCLU9826500	2021-08-20 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
317469	GESU6557620	2021-07-02 07:01:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	K LINE MOBARU DIAMOND INDONESIA	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
317470	GESU6557620	2021-07-02 22:31:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
317471	GESU6557620	2021-07-07 16:35:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'ALLEGORIA 044N' at Port of Loading	9295945	255805779	044N	Vessel	ALLEGORIA	-6.133333333333334	106.83333333333333	f	f
317472	GESU6557620	2021-07-08 05:50:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'ALLEGORIA 044N' Departure from Port of Loading	9295945	255805779	044N	Vessel	ALLEGORIA	-6.133333333333334	106.83333333333333	f	f
317473	GESU6557620	2021-07-10 05:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'ALLEGORIA 044N' Arrival at Transhipment Port	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
317474	GESU6557620	2021-07-10 07:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'ALLEGORIA 044N' T/S Berthing Destination	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
317475	GESU6557620	2021-07-11 01:05:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'ALLEGORIA 044N' at Transhipment Port	9295945	255805779	044N	Vessel	ALLEGORIA	1.271978728313698	103.768308722207	f	f
317476	GESU6557620	2021-07-17 02:51:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE FALCON 018E' at Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
317477	GESU6557620	2021-07-17 23:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	018E	Vessel	ONE FALCON	1.271978728313698	103.768308722207	f	f
317478	GESU6557620	2021-08-19 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
317480	GESU6557620	2021-08-21 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE FALCON 018E' POD Berthing Destination	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
317481	GESU6557620	2021-08-21 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE FALCON 018E' at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
317482	GESU6557620	2021-08-21 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
317483	GESU6557620	2021-08-22 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
317628	GESU6557620	2021-08-20 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE FALCON 018E' Arrival at Port of Discharging	\N	\N	018E	Vessel	ONE FALCON	33.766666666666666	-118.18333333333334	f	t
317662	TCNU6423598	2021-06-24 09:13:00	PHNOM PENH ,CAMBODIA	Phnom Penh	Cambodia	KHPNH	PHNOM PENH-TENG LAY IMP EXP  TRANSPORT	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	11.5563738	104.9282099	f	f
317663	TCNU6423598	2021-06-26 15:14:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	10.64604378127943	103.5095980083301	f	f
317664	TCNU6423598	2021-06-29 11:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Loaded on vessel	Loaded on 'BRIDGE 0184S' at Port of Loading	2684361	304010914	184S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
317665	TCNU6423598	2021-06-29 14:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Vessel departed	'BRIDGE 0184S' Departure from Port of Loading	2684361	304010914	184S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
317666	TCNU6423598	2021-07-03 09:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BRIDGE 0184S' Arrival at Transhipment Port	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
317667	TCNU6423598	2021-07-03 11:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BRIDGE 0184S' T/S Berthing Destination	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
317668	TCNU6423598	2021-07-03 13:49:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BRIDGE 0184S' at Transhipment Port	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
317669	TCNU6423598	2021-07-23 17:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE CONTINUITY 057E' at Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
317670	TCNU6423598	2021-07-24 17:15:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
317671	TCNU6423598	2021-08-17 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317673	TCNU6423598	2021-08-17 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317674	TCNU6423598	2021-08-17 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317675	TCNU6423598	2021-08-17 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
317676	TCNU6423598	2021-08-18 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
317686	TCNU6423598	2021-08-15 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317687	TCNU6423598	2021-08-15 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317688	TCNU6423598	2021-08-15 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317689	TCNU6423598	2021-08-15 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
317690	TCNU6423598	2021-08-16 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
317716	TCNU6423598	2021-08-14 21:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317718	TCNU6423598	2021-08-14 23:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317719	TCNU6423598	2021-08-15 00:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317720	TCNU6423598	2021-08-15 05:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
317947	CAIU9323520	2021-06-23 23:27:00	PHNOM PENH ,CAMBODIA	Phnom Penh	Cambodia	KHPNH	BOK SENG PPSEZ DRY PORT CO.  LTD.	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	11.5563738	104.9282099	f	f
317948	CAIU9323520	2021-06-26 15:14:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	10.64604378127943	103.5095980083301	f	f
317949	CAIU9323520	2021-06-29 11:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Loaded on vessel	Loaded on 'BRIDGE 0184S' at Port of Loading	2684361	304010914	184S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
317950	CAIU9323520	2021-06-29 14:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Vessel departed	'BRIDGE 0184S' Departure from Port of Loading	2684361	304010914	184S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
317951	CAIU9323520	2021-07-03 09:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BRIDGE 0184S' Arrival at Transhipment Port	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
317952	CAIU9323520	2021-07-03 11:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BRIDGE 0184S' T/S Berthing Destination	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
317953	CAIU9323520	2021-07-03 19:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BRIDGE 0184S' at Transhipment Port	2684361	304010914	184S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
317954	CAIU9323520	2021-07-23 17:34:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE CONTINUITY 057E' at Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
317955	CAIU9323520	2021-07-24 17:15:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
317956	CAIU9323520	2021-08-17 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317958	CAIU9323520	2021-08-17 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317959	CAIU9323520	2021-08-17 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317960	CAIU9323520	2021-08-17 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
317961	CAIU9323520	2021-08-18 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
317986	CAIU9323520	2021-08-15 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317987	CAIU9323520	2021-08-15 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317988	CAIU9323520	2021-08-15 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
317989	CAIU9323520	2021-08-15 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
317990	CAIU9323520	2021-08-16 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
318016	CAIU9323520	2021-08-14 21:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
318018	CAIU9323520	2021-08-14 23:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
318019	CAIU9323520	2021-08-15 00:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
318020	CAIU9323520	2021-08-15 05:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
318262	MAGU5589602	2021-07-01 23:43:00	Shanghai Guandong (III), Yangshan,Shanghai,Shanghai,China	Shanghai	China	\N	Shanghai Guandong (III), Yangshan	Gate out empty	Empty Equipment Despatched	\N	\N	\N	Truck	\N	31.230416	121.473701	f	f
318263	MAGU5589602	2021-07-06 20:39:00	Shanghai Int'l Port Shang Dong Ctn,Shanghai,Shanghai,China	Shanghai	China	\N	Shanghai Int'l Port Shang Dong Ctn	Gate in full	Cargo Received	\N	\N	\N	Truck	\N	31.230416	121.473701	f	f
318265	MAGU5589602	2021-07-12 06:22:00	Shanghai Int'l Port Shang Dong Ctn,Shanghai,Shanghai,China	Shanghai	China	CNSGH	Shanghai Int'l Port Shang Dong Ctn	Loaded on vessel at origin port	Loaded at First POL	\N	\N	053E	Vessel	OOCL TAIPEI	31.233333333333334	121.48333333333333	f	f
318266	MAGU5589602	2021-07-27 08:00:00	\N	\N	\N	\N	\N	Estimated arrival at destination	Estimated arrival at destination	\N	\N	\N	Vessel	\N	\N	\N	t	\N
318267	MAGU5589602	2021-07-28 20:53:00	Long Beach Container Terminal , LLC,Long Beach,California,United States	Long Beach	United States	USLGB	Long Beach Container Terminal , LLC	Discharged from vessel	Discharged at Last POD	\N	\N	\N	Vessel	\N	33.766666666666666	-118.18333333333334	f	f
318403	NYKU4425050	2021-07-13 12:04:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	K LINE MOBARU DIAMOND INDONESIA	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
318404	NYKU4425050	2021-07-14 03:44:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	KOJA CONTAINER TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
318405	NYKU4425050	2021-07-18 02:07:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	KOJA CONTAINER TERMINAL	Loaded on vessel	Loaded on 'ALS JUNO 015N' at Port of Loading	9431719	563060600	015N	Vessel	ALS JUNO	-6.133333333333334	106.83333333333333	f	f
318406	NYKU4425050	2021-07-18 08:40:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	KOJA CONTAINER TERMINAL	Vessel departed	'ALS JUNO 015N' Departure from Port of Loading	9431719	563060600	015N	Vessel	ALS JUNO	-6.133333333333334	106.83333333333333	f	f
318407	NYKU4425050	2021-07-21 21:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'ALS JUNO 015N' Arrival at Transhipment Port	9431719	563060600	015N	Vessel	ALS JUNO	1.271978728313698	103.768308722207	f	f
318408	NYKU4425050	2021-07-21 23:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'ALS JUNO 015N' T/S Berthing Destination	9431719	563060600	015N	Vessel	ALS JUNO	1.271978728313698	103.768308722207	f	f
318409	NYKU4425050	2021-07-22 08:32:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'ALS JUNO 015N' at Transhipment Port	9431719	563060600	015N	Vessel	ALS JUNO	1.271978728313698	103.768308722207	f	f
318410	NYKU4425050	2021-08-09 17:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'MOL CELEBRATION 084E' at Transhipment Port	9321251	309901000	084E	Vessel	MOL CELEBRATION	1.271978728313698	103.768308722207	f	t
318411	NYKU4425050	2021-08-10 17:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9321251	309901000	084E	Vessel	MOL CELEBRATION	1.271978728313698	103.768308722207	f	t
318412	NYKU4425050	2021-08-27 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'MOL CELEBRATION 084E' Arrival at Port of Discharging	9321251	309901000	084E	Vessel	MOL CELEBRATION	34.0522342	-118.2436849	f	t
318414	NYKU4425050	2021-08-27 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'MOL CELEBRATION 084E' POD Berthing Destination	9321251	309901000	084E	Vessel	MOL CELEBRATION	34.0522342	-118.2436849	f	t
318415	NYKU4425050	2021-08-27 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'MOL CELEBRATION 084E' at Port of Discharging	9321251	309901000	084E	Vessel	MOL CELEBRATION	34.0522342	-118.2436849	f	t
318416	NYKU4425050	2021-08-27 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
318417	NYKU4425050	2021-08-28 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
318440	NYKU4425050	2021-08-08 23:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318441	NYKU4425050	2021-08-09 15:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318442	NYKU4425050	2021-09-06 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE BLUE JAY 023E' Arrival at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
318444	NYKU4425050	2021-09-06 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE BLUE JAY 023E' POD Berthing Destination	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
318445	NYKU4425050	2021-09-06 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE BLUE JAY 023E' at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
318446	NYKU4425050	2021-09-06 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
318447	NYKU4425050	2021-09-07 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
318470	NYKU4425050	2021-08-09 04:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318471	NYKU4425050	2021-08-09 21:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318485	NYKU4425050	2021-08-09 05:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
319386	DRYU9456988	2021-08-06 10:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Vessel arrival	'EXPRESS ATHENS 1127' Arrival at Port of Discharging	9484948	636015020	127W	Vessel	EXPRESS ATHENS	40.7	-74	f	t
318486	NYKU4425050	2021-08-09 21:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318500	NYKU4425050	2021-08-08 02:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318501	NYKU4425050	2021-08-08 18:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318718	TRHU4358054	2021-07-16 09:55:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	K LINE MOBARU DIAMOND INDONESIA	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
318719	TRHU4358054	2021-07-16 23:15:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
318720	TRHU4358054	2021-07-18 14:54:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'WIDE JULIET 001N' at Port of Loading	\N	\N	001N	Vessel	WIDE JULIET	-6.133333333333334	106.83333333333333	f	f
318721	TRHU4358054	2021-07-18 21:35:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'WIDE JULIET 001N' Departure from Port of Loading	\N	\N	001N	Vessel	WIDE JULIET	-6.133333333333334	106.83333333333333	f	f
318722	TRHU4358054	2021-07-23 12:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'WIDE JULIET 001N' Arrival at Transhipment Port	\N	\N	001N	Vessel	WIDE JULIET	1.271978728313698	103.768308722207	f	f
318723	TRHU4358054	2021-07-23 14:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'WIDE JULIET 001N' T/S Berthing Destination	\N	\N	001N	Vessel	WIDE JULIET	1.271978728313698	103.768308722207	f	f
318724	TRHU4358054	2021-07-23 21:21:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'WIDE JULIET 001N' at Transhipment Port	\N	\N	001N	Vessel	WIDE JULIET	1.271978728313698	103.768308722207	f	f
318725	TRHU4358054	2021-08-08 19:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318726	TRHU4358054	2021-08-09 10:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318727	TRHU4358054	2021-09-06 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE BLUE JAY 023E' Arrival at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
318729	TRHU4358054	2021-09-06 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE BLUE JAY 023E' POD Berthing Destination	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
318730	TRHU4358054	2021-09-06 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE BLUE JAY 023E' at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
318731	TRHU4358054	2021-09-06 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
318732	TRHU4358054	2021-09-07 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
318740	TRHU4358054	2021-08-09 01:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318741	TRHU4358054	2021-08-09 15:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318770	TRHU4358054	2021-08-09 06:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318771	TRHU4358054	2021-08-09 21:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318785	TRHU4358054	2021-08-09 07:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318786	TRHU4358054	2021-08-09 21:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318800	TRHU4358054	2021-08-08 04:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318801	TRHU4358054	2021-08-08 18:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318889	TLLU5457470	2021-07-16 09:47:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	K LINE MOBARU DIAMOND INDONESIA	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
318890	TLLU5457470	2021-07-16 23:32:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
318891	TLLU5457470	2021-07-18 14:53:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Loaded on vessel	Loaded on 'WIDE JULIET 001N' at Port of Loading	\N	\N	001N	Vessel	WIDE JULIET	-6.133333333333334	106.83333333333333	f	f
318892	TLLU5457470	2021-07-18 21:35:00	JAKARTA ,INDONESIA	Jakarta	Indonesia	IDJKT	NPCT1 (NEW PRIOK CONTAINER TERMINAL ONE)	Vessel departed	'WIDE JULIET 001N' Departure from Port of Loading	\N	\N	001N	Vessel	WIDE JULIET	-6.133333333333334	106.83333333333333	f	f
318893	TLLU5457470	2021-07-23 12:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'WIDE JULIET 001N' Arrival at Transhipment Port	\N	\N	001N	Vessel	WIDE JULIET	1.271978728313698	103.768308722207	f	f
318894	TLLU5457470	2021-07-23 14:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'WIDE JULIET 001N' T/S Berthing Destination	\N	\N	001N	Vessel	WIDE JULIET	1.271978728313698	103.768308722207	f	f
318895	TLLU5457470	2021-07-23 21:43:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'WIDE JULIET 001N' at Transhipment Port	\N	\N	001N	Vessel	WIDE JULIET	1.271978728313698	103.768308722207	f	f
318896	TLLU5457470	2021-08-08 19:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318897	TLLU5457470	2021-08-09 10:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318898	TLLU5457470	2021-09-06 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE BLUE JAY 023E' Arrival at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
318900	TLLU5457470	2021-09-06 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE BLUE JAY 023E' POD Berthing Destination	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
318901	TLLU5457470	2021-09-06 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE BLUE JAY 023E' at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
318902	TLLU5457470	2021-09-06 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
318903	TLLU5457470	2021-09-07 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
318911	TLLU5457470	2021-08-09 01:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318912	TLLU5457470	2021-08-09 15:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318926	TLLU5457470	2021-08-09 07:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318927	TLLU5457470	2021-08-09 21:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318941	TLLU5457470	2021-08-08 04:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
318942	TLLU5457470	2021-08-08 18:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
319174	CAIU9970194	2021-07-12 22:05:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Empty Container Released	Export Empty Container Released	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
319175	CAIU9970194	2021-07-14 03:59:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Export Truck Gate In to Terminal	Export Truck Gate In to Terminal	\N	\N	\N	Truck	\N	-6.2087634	106.845599	f	f
319176	CAIU9970194	2021-07-17 08:19:00	JAKARTA, INDONESIA	Jakarta	Indonesia	\N	\N	Loaded on feeder	Feeder Loading at POL	\N	\N	\N	Feeder	\N	-6.2087634	106.845599	f	f
319177	CAIU9970194	2021-07-22 02:00:00	SINGAPORE	Singapore	Singapore	\N	\N	Feeder arrived	Feeder Arrival at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
319178	CAIU9970194	2021-07-22 16:00:00	SINGAPORE	Singapore	Singapore	\N	\N	Discharged from feeder	Feeder Unloading at T/S Port	\N	\N	\N	Feeder	\N	1.352083	103.819836	f	f
319179	CAIU9970194	2021-07-31 22:27:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel at transshipment port	Vessel Loading at T/S Port	9312781	372218000	0072E	Vessel	NYK VEGA	1.271978728313698	103.768308722207	f	f
319180	CAIU9970194	2021-08-02 00:50:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Vessel departure from transshipment port	Vessel Departure from T/S Port	9312781	372218000	0072E	Vessel	NYK VEGA	1.271978728313698	103.768308722207	f	f
319181	CAIU9970194	2021-08-24 12:50:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9312781	372218000	\N	Vessel	NYK VEGA	34.0522342	-118.2436849	t	t
319204	CAIU9970194	2021-08-24 13:00:00	LOS ANGELES, CA	Los Angeles	United States	USLAX	\N	Estimated arrival at destination	Estimated arrival at destination	9312781	372218000	\N	Vessel	NYK VEGA	34.0522342	-118.2436849	t	t
319382	DRYU9456988	2021-07-15 13:07:00	DAMIETTA, EGYPT ,EGYPT	Damietta	Egypt	EGDAM	INTEGRATED LOGISTICS GROUP	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	31.416666666666668	31.816666666666666	f	f
319383	DRYU9456988	2021-07-17 23:11:00	DAMIETTA, EGYPT ,EGYPT	Damietta	Egypt	EGDAM	DAMIETTA CONTAINER TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	31.416666666666668	31.816666666666666	f	f
319384	DRYU9456988	2021-07-24 16:29:00	DAMIETTA, EGYPT ,EGYPT	Damietta	Egypt	EGDAM	DAMIETTA CONTAINER TERMINAL	Loaded on vessel	Loaded on 'EXPRESS ATHENS 1127' at Port of Loading	9484948	636015020	127W	Vessel	EXPRESS ATHENS	31.416666666666668	31.816666666666666	f	f
319385	DRYU9456988	2021-07-25 05:00:00	DAMIETTA, EGYPT ,EGYPT	Damietta	Egypt	EGDAM	DAMIETTA CONTAINER TERMINAL	Vessel departed	'EXPRESS ATHENS 1127' Departure from Port of Loading	9484948	636015020	127W	Vessel	EXPRESS ATHENS	31.416666666666668	31.816666666666666	f	f
319387	DRYU9456988	2021-08-07 10:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Vessel berthed in port	'EXPRESS ATHENS 1127' POD Berthing Destination	9484948	636015020	127W	Vessel	EXPRESS ATHENS	40.7	-74	f	t
319388	DRYU9456988	2021-08-07 11:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Discharged from vessel	Unloaded from 'EXPRESS ATHENS 1127' at Port of Discharging	9484948	636015020	127W	Vessel	EXPRESS ATHENS	40.7	-74	f	t
319389	DRYU9456988	2021-08-07 16:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
319390	DRYU9456988	2021-08-07 22:00:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
319405	DRYU9456988	2021-08-06 16:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Vessel berthed in port	'EXPRESS ATHENS 1127' POD Berthing Destination	9484948	636015020	127W	Vessel	EXPRESS ATHENS	40.7	-74	f	t
319406	DRYU9456988	2021-08-06 18:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Discharged from vessel	Unloaded from 'EXPRESS ATHENS 1127' at Port of Discharging	9484948	636015020	127W	Vessel	EXPRESS ATHENS	40.7	-74	f	t
319407	DRYU9456988	2021-08-06 22:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
319408	DRYU9456988	2021-08-07 04:30:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
319601	TCNU4863643	2021-07-15 15:49:00	PHNOM PENH ,CAMBODIA	Phnom Penh	Cambodia	KHPNH	PHNOM PENH - SO NGUON DRY PORT	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	11.5563738	104.9282099	f	f
319602	TCNU4863643	2021-07-17 14:16:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	10.64604378127943	103.5095980083301	f	f
319603	TCNU4863643	2021-07-21 23:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Loaded on vessel	Loaded on 'BRIDGE 0187S' at Port of Loading	2684361	304010914	187S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
319604	TCNU4863643	2021-07-22 08:00:00	SIHANOUKVILLE ,CAMBODIA	Preah Sihanouk	Cambodia	KHKOS	SIHANOUKVILLE AUTONOMOUS PORT	Vessel departed	'BRIDGE 0187S' Departure from Port of Loading	2684361	304010914	187S	Vessel	BRIDGE	10.64604378127943	103.5095980083301	f	f
319605	TCNU4863643	2021-07-25 04:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BRIDGE 0187S' Arrival at Transhipment Port	2684361	304010914	187S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
319606	TCNU4863643	2021-07-25 06:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BRIDGE 0187S' T/S Berthing Destination	2684361	304010914	187S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
319607	TCNU4863643	2021-07-25 16:18:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BRIDGE 0187S' at Transhipment Port	2684361	304010914	187S	Vessel	BRIDGE	1.271978728313698	103.768308722207	f	f
319608	TCNU4863643	2021-08-08 19:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
319609	TCNU4863643	2021-08-09 10:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
319610	TCNU4863643	2021-09-06 12:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'ONE BLUE JAY 023E' Arrival at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
319612	TCNU4863643	2021-09-06 14:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'ONE BLUE JAY 023E' POD Berthing Destination	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
319613	TCNU4863643	2021-09-06 15:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'ONE BLUE JAY 023E' at Port of Discharging	\N	\N	023E	Vessel	ONE BLUE JAY	33.766666666666666	-118.18333333333334	f	t
319614	TCNU4863643	2021-09-06 20:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
319615	TCNU4863643	2021-09-07 02:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
319623	TCNU4863643	2021-08-09 01:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
319624	TCNU4863643	2021-08-09 15:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
319638	TCNU4863643	2021-08-09 06:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
319639	TCNU4863643	2021-08-09 21:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
319653	TCNU4863643	2021-08-09 07:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
319654	TCNU4863643	2021-08-09 21:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
320256	FFAU1676538	2021-06-14 17:08:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	069S	\N	HAIAN EAST	1.271978728313698	103.768308722207	f	f
319668	TCNU4863643	2021-08-08 04:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE BLUE JAY 023E' at Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
319669	TCNU4863643	2021-08-08 18:30:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	023E	Vessel	ONE BLUE JAY	1.271978728313698	103.768308722207	f	t
319878	TCNU5516422	2021-07-26 11:07:00	DAMIETTA, EGYPT ,EGYPT	Damietta	Egypt	EGDAM	INTEGRATED LOGISTICS GROUP	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	31.416666666666668	31.816666666666666	f	f
319879	TCNU5516422	2021-07-26 19:08:00	DAMIETTA, EGYPT ,EGYPT	Damietta	Egypt	EGDAM	DAMIETTA CONTAINER TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	31.416666666666668	31.816666666666666	f	f
319880	TCNU5516422	2021-08-01 14:14:00	DAMIETTA, EGYPT ,EGYPT	Damietta	Egypt	EGDAM	DAMIETTA CONTAINER TERMINAL	Loaded on vessel	Loaded on 'MOL COURAGE 1128' at Port of Loading	\N	\N	128W	Vessel	MOL COURAGE	31.416666666666668	31.816666666666666	f	f
319881	TCNU5516422	2021-08-01 17:54:00	DAMIETTA, EGYPT ,EGYPT	Damietta	Egypt	EGDAM	DAMIETTA CONTAINER TERMINAL	Vessel departed	'MOL COURAGE 1128' Departure from Port of Loading	\N	\N	128W	Vessel	MOL COURAGE	31.416666666666668	31.816666666666666	f	f
319882	TCNU5516422	2021-08-12 16:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Vessel arrival	'MOL COURAGE 1128' Arrival at Port of Discharging	\N	\N	128W	Vessel	MOL COURAGE	40.7	-74	f	t
319883	TCNU5516422	2021-08-12 22:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Vessel berthed in port	'MOL COURAGE 1128' POD Berthing Destination	\N	\N	128W	Vessel	MOL COURAGE	40.7	-74	f	t
319884	TCNU5516422	2021-08-12 23:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Discharged from vessel	Unloaded from 'MOL COURAGE 1128' at Port of Discharging	\N	\N	128W	Vessel	MOL COURAGE	40.7	-74	f	t
319885	TCNU5516422	2021-08-13 04:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
319886	TCNU5516422	2021-08-13 10:00:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
319909	TCNU5516422	2021-08-12 18:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Vessel arrival	'MOL COURAGE 1128' Arrival at Port of Discharging	\N	\N	128W	Vessel	MOL COURAGE	40.7	-74	f	t
319910	TCNU5516422	2021-08-12 23:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Vessel berthed in port	'MOL COURAGE 1128' POD Berthing Destination	\N	\N	128W	Vessel	MOL COURAGE	40.7	-74	f	t
319911	TCNU5516422	2021-08-13 00:30:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Discharged from vessel	Unloaded from 'MOL COURAGE 1128' at Port of Discharging	\N	\N	128W	Vessel	MOL COURAGE	40.7	-74	f	t
319912	TCNU5516422	2021-08-13 05:00:00	NEW YORK, NY ,UNITED STATES	New York	United States	USNYC	MAHER NEWARK	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	40.7	-74	f	t
319913	TCNU5516422	2021-08-13 11:00:00	ELIZABETH, NJ ,UNITED STATES	Elizabeth	United States	USEZA	COLUMBIA CONTAINER - CCS (DEPOT)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	39.3	-74.96666666666667	f	t
319926	TCNU5516422	2021-08-01 23:00:00	DAMIETTA, EGYPT ,EGYPT	Damietta	Egypt	EGDAM	DAMIETTA CONTAINER TERMINAL	Vessel departed	'MOL COURAGE 1128' Departure from Port of Loading	\N	\N	128W	Vessel	MOL COURAGE	31.416666666666668	31.816666666666666	f	t
319934	TCNU5516422	2021-08-01 22:00:00	DAMIETTA, EGYPT ,EGYPT	Damietta	Egypt	EGDAM	DAMIETTA CONTAINER TERMINAL	Loaded on vessel	Loaded on 'MOL COURAGE 1128' at Port of Loading	\N	\N	128W	Vessel	MOL COURAGE	31.416666666666668	31.816666666666666	f	t
320103	MEDU8693239	2021-05-11 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320104	MEDU8693239	2021-05-11 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320105	MEDU8693239	2021-05-16 23:47:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320106	MEDU8693239	2021-05-16 23:49:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320107	MEDU8693239	2021-05-18 15:35:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	068S	\N	HAIAN EAST	22.30049832559382	91.79452471970988	f	f
320108	MEDU8693239	2021-05-26 10:28:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	068S	\N	HAIAN EAST	1.271978728313698	103.768308722207	f	f
320109	MEDU8693239	2021-05-29 17:26:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9755957	636017435	FJ117E	Vessel	MSC ELOANE	1.271978728313698	103.768308722207	f	f
320110	MEDU8693239	2021-06-23 08:00:00	YANTIAN	Yantian District	China	CNYTN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9755957	636017435	FJ117	Vessel	MSC ELOANE	26.85	119.86666666666666	f	f
320111	MEDU8693239	2021-06-28 23:01:00	YANTIAN	Yantian District	China	CNYTN	\N	Loaded on vessel	Transshipment Loaded	7820394	352890000	QJ122N	Vessel	MSC CLORINDA	26.85	119.86666666666666	f	f
320112	MEDU8693239	2021-07-13 00:03:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7820394	352890000	122N	Vessel	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
320113	MEDU8693239	2021-07-21 20:38:00	LONG BEACH	Long Beach	United States	USLGB	\N	Discharged from vessel	Discharged	7820394	352890000	122N	Vessel	MSC CLORINDA	33.766666666666666	-118.18333333333334	f	f
320114	MEDU8693239	2021-07-31 17:34:00	LONG BEACH	Long Beach	United States	USLGB	\N	Gate out	Gate Out Full	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	f
320251	FFAU1676538	2021-06-02 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320252	FFAU1676538	2021-06-02 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320253	FFAU1676538	2021-06-06 23:44:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320254	FFAU1676538	2021-06-06 23:48:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320255	FFAU1676538	2021-06-08 22:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	069S	\N	HAIAN EAST	22.30049832559382	91.79452471970988	f	f
320258	FFAU1676538	2021-06-26 16:00:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9754965	636017577	FT120E	Vessel	MSC REEF	22.483333333333334	113.91666666666667	f	f
320259	FFAU1676538	2021-06-27 10:01:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	22.483333333333334	113.91666666666667	f	f
320260	FFAU1676538	2021-07-22 18:13:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7434444	353056000	125N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	f	f
320261	FFAU1676538	2021-08-05 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
320294	FFAU1676538	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
320364	MSDU7646245	2021-06-02 23:20:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate out empty	Empty to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320365	MSDU7646245	2021-06-02 23:30:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Gate in full	Gate In Full	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320366	MSDU7646245	2021-06-06 23:44:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned Out	Positioned Out	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320367	MSDU7646245	2021-06-06 23:48:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Positioned In	Positioned In	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320368	MSDU7646245	2021-06-08 22:00:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel	Loaded	\N	\N	069S	\N	HAIAN EAST	22.30049832559382	91.79452471970988	f	f
320369	MSDU7646245	2021-06-14 17:05:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Discharged from vessel at transshipment port	Transshipment Discharged	\N	\N	069S	\N	HAIAN EAST	1.271978728313698	103.768308722207	f	f
320370	MSDU7646245	2021-06-19 05:56:00	SINGAPORE	Singapore	Singapore	SGSIN	\N	Loaded on vessel	Transshipment Loaded	9754965	636017577	FT120E	Vessel	MSC REEF	1.271978728313698	103.768308722207	f	f
320371	MSDU7646245	2021-06-26 16:00:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Discharged from vessel at transshipment port	Transshipment Discharged	9754965	636017577	FT120E	Vessel	MSC REEF	22.45994033143178	113.8929109645951	f	f
320372	MSDU7646245	2021-06-27 10:01:00	SHEKOU	Jonesboro	United States	CNSHK	\N	Loaded on vessel	Transshipment Loaded	7434444	353056000	QJ125N	Vessel	MSC KATIE	22.45994033143178	113.8929109645951	f	f
320373	MSDU7646245	2021-07-22 18:13:00	LONG BEACH	Long Beach	United States	USLGB	\N	Carrier release	Carrier Release	7434444	353056000	125N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	f	f
320374	MSDU7646245	2021-08-05 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
320418	MSDU7646245	2021-08-04 14:30:00	LONG BEACH	Long Beach	United States	USLGB	\N	Vessel arrived at destination port	Estimated Time of Arrival	7434444	353056000	\N	Vessel	MSC KATIE	33.766666666666666	-118.18333333333334	t	t
320496	TRHU5320496	2021-06-16 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320497	TRHU5320496	2021-06-16 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320498	TRHU5320496	2021-06-22 06:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'KOTA WANGI 0078E' at Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
320499	TRHU5320496	2021-06-22 09:15:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'KOTA WANGI 0078E' Departure from Port of Loading	9123582	564065000	078E	Vessel	KOTA WANGI	22.30049832559382	91.79452471970988	f	f
320500	TRHU5320496	2021-06-29 13:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'KOTA WANGI 0078E' Arrival at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
320501	TRHU5320496	2021-06-29 15:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'KOTA WANGI 0078E' T/S Berthing Destination	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
320502	TRHU5320496	2021-06-30 04:49:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'KOTA WANGI 0078E' at Transhipment Port	9123582	564065000	078E	Vessel	KOTA WANGI	1.271978728313698	103.768308722207	f	f
320503	TRHU5320496	2021-07-11 18:56:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'YM WELLNESS 028E' at Transhipment Port	9704623	477737600	028E	Vessel	YM WELLNESS	1.271978728313698	103.768308722207	f	f
320504	TRHU5320496	2021-07-11 21:45:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9704623	477737600	028E	Vessel	YM WELLNESS	1.271978728313698	103.768308722207	f	f
320505	TRHU5320496	2021-08-12 11:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel arrival	'YM WELLNESS 028E' Arrival at Port of Discharging	9704623	477737600	028E	Vessel	YM WELLNESS	33.766666666666666	-118.18333333333334	f	t
320507	TRHU5320496	2021-08-12 13:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Vessel berthed in port	'YM WELLNESS 028E' POD Berthing Destination	9704623	477737600	028E	Vessel	YM WELLNESS	33.766666666666666	-118.18333333333334	f	t
320508	TRHU5320496	2021-08-12 14:30:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Discharged from vessel	Unloaded from 'YM WELLNESS 028E' at Port of Discharging	9704623	477737600	028E	Vessel	YM WELLNESS	33.766666666666666	-118.18333333333334	f	t
320509	TRHU5320496	2021-08-12 19:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
320510	TRHU5320496	2021-08-13 01:00:00	LONG BEACH, CA ,UNITED STATES	Long Beach	United States	USLGB	ITS (INTL TRANSPORTATION SERVICES)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	33.766666666666666	-118.18333333333334	f	t
320708	TCNU6860432	2021-06-17 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320709	TCNU6860432	2021-06-17 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320710	TCNU6860432	2021-06-23 08:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'MARINE BIA 105S' at Port of Loading	9445008	357813000	105E	Vessel	MARINE BIA	22.30049832559382	91.79452471970988	f	f
320711	TCNU6860432	2021-06-23 09:15:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'MARINE BIA 105S' Departure from Port of Loading	9445008	357813000	105E	Vessel	MARINE BIA	22.30049832559382	91.79452471970988	f	f
320712	TCNU6860432	2021-06-28 06:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'MARINE BIA 105S' Arrival at Transhipment Port	9445008	357813000	105E	Vessel	MARINE BIA	1.271978728313698	103.768308722207	f	f
320713	TCNU6860432	2021-06-28 07:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'MARINE BIA 105S' T/S Berthing Destination	9445008	357813000	105E	Vessel	MARINE BIA	1.271978728313698	103.768308722207	f	f
320714	TCNU6860432	2021-06-28 22:01:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'MARINE BIA 105S' at Transhipment Port	9445008	357813000	105E	Vessel	MARINE BIA	1.271978728313698	103.768308722207	f	f
320715	TCNU6860432	2021-07-06 18:28:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE HUMBER 087E' at Transhipment Port	\N	\N	087E	Vessel	ONE HUMBER	1.271978728313698	103.768308722207	f	f
320716	TCNU6860432	2021-07-07 05:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	087E	Vessel	ONE HUMBER	1.271978728313698	103.768308722207	f	f
320717	TCNU6860432	2021-07-29 11:54:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'ONE HUMBER 087E' Arrival at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	f
320719	TCNU6860432	2021-08-02 22:06:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	f
320720	TCNU6860432	2021-08-03 01:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HUMBER 087E' at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
320721	TCNU6860432	2021-08-03 06:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
320722	TCNU6860432	2021-08-03 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
320763	TCNU6860432	2021-07-29 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'ONE HUMBER 087E' Arrival at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
320764	TCNU6860432	2021-08-03 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
320794	TCNU6860432	2021-08-02 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
320795	TCNU6860432	2021-08-02 01:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HUMBER 087E' at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
320796	TCNU6860432	2021-08-02 06:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
320797	TCNU6860432	2021-08-02 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
320809	TCNU6860432	2021-08-01 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
320810	TCNU6860432	2021-08-01 01:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HUMBER 087E' at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
320811	TCNU6860432	2021-08-01 06:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
320812	TCNU6860432	2021-08-01 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
320963	TRHU4342130	2021-06-14 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320964	TRHU4342130	2021-06-14 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
320965	TRHU4342130	2021-06-16 13:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'BANGKOK 105S' at Port of Loading	9197349	440898000	105E	Vessel	BANGKOK	22.30049832559382	91.79452471970988	f	f
320966	TRHU4342130	2021-06-16 14:10:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'BANGKOK 105S' Departure from Port of Loading	9197349	440898000	105E	Vessel	BANGKOK	22.30049832559382	91.79452471970988	f	f
320967	TRHU4342130	2021-06-25 05:50:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'BANGKOK 105S' Arrival at Transhipment Port	9197349	440898000	105E	Vessel	BANGKOK	1.271978728313698	103.768308722207	f	f
320968	TRHU4342130	2021-06-25 07:50:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'BANGKOK 105S' T/S Berthing Destination	9197349	440898000	105E	Vessel	BANGKOK	1.271978728313698	103.768308722207	f	f
322687	TCNU8326529	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.64876350000001	-63.5752387	f	t
320969	TRHU4342130	2021-06-25 16:11:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'BANGKOK 105S' at Transhipment Port	9197349	440898000	105E	Vessel	BANGKOK	1.271978728313698	103.768308722207	f	f
320970	TRHU4342130	2021-07-05 17:47:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE HUMBER 087E' at Transhipment Port	\N	\N	087E	Vessel	ONE HUMBER	1.271978728313698	103.768308722207	f	f
320971	TRHU4342130	2021-07-07 05:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	087E	Vessel	ONE HUMBER	1.271978728313698	103.768308722207	f	f
320972	TRHU4342130	2021-07-29 11:54:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'ONE HUMBER 087E' Arrival at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	f
320974	TRHU4342130	2021-08-02 22:06:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	f
320975	TRHU4342130	2021-08-03 01:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HUMBER 087E' at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
320976	TRHU4342130	2021-08-03 06:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
320977	TRHU4342130	2021-08-03 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321033	TRHU4342130	2021-07-29 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'ONE HUMBER 087E' Arrival at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321034	TRHU4342130	2021-08-03 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321064	TRHU4342130	2021-08-02 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321065	TRHU4342130	2021-08-02 01:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HUMBER 087E' at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321066	TRHU4342130	2021-08-02 06:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321067	TRHU4342130	2021-08-02 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321079	TRHU4342130	2021-08-01 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321080	TRHU4342130	2021-08-01 01:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HUMBER 087E' at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321081	TRHU4342130	2021-08-01 06:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321082	TRHU4342130	2021-08-01 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321218	TCLU3385202	2021-06-11 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
321219	TCLU3385202	2021-06-11 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
321220	TCLU3385202	2021-06-14 11:15:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'SOL DELTA 2108S' at Port of Loading	\N	\N	108E	Vessel	SOL DELTA	22.30049832559382	91.79452471970988	f	f
321221	TCLU3385202	2021-06-14 11:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'SOL DELTA 2108S' Departure from Port of Loading	\N	\N	108E	Vessel	SOL DELTA	22.30049832559382	91.79452471970988	f	f
321222	TCLU3385202	2021-06-20 05:55:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'SOL DELTA 2108S' Arrival at Transhipment Port	\N	\N	108E	Vessel	SOL DELTA	1.271978728313698	103.768308722207	f	f
321223	TCLU3385202	2021-06-20 17:15:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'SOL DELTA 2108S' at Transhipment Port	\N	\N	108E	Vessel	SOL DELTA	1.271978728313698	103.768308722207	f	f
321224	TCLU3385202	2021-06-25 12:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'NYK VESTA 072E' at Transhipment Port	9312808	372531000	072E	Vessel	NYK VESTA	1.271978728313698	103.768308722207	f	f
321225	TCLU3385202	2021-06-25 18:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9312808	372531000	072E	Vessel	NYK VESTA	1.271978728313698	103.768308722207	f	f
321226	TCLU3385202	2021-07-20 20:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'NYK VESTA 072E' Arrival at Port of Discharging	9312808	372531000	072E	Vessel	NYK VESTA	34.0522342	-118.2436849	f	f
321228	TCLU3385202	2021-07-24 11:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'NYK VESTA 072E' POD Berthing Destination	9312808	372531000	072E	Vessel	NYK VESTA	34.0522342	-118.2436849	f	f
321229	TCLU3385202	2021-07-26 08:35:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'NYK VESTA 072E' at Port of Discharging	9312808	372531000	072E	Vessel	NYK VESTA	34.0522342	-118.2436849	f	f
322688	TCNU8326529	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
321230	TCLU3385202	2021-07-29 21:45:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
321231	TCLU3385202	2021-07-30 04:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321479	NYKU4387936	2021-06-19 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
321480	NYKU4387936	2021-06-19 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
321481	NYKU4387936	2021-06-23 08:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'MARINE BIA 105S' at Port of Loading	9445008	357813000	105E	Vessel	MARINE BIA	22.30049832559382	91.79452471970988	f	f
321482	NYKU4387936	2021-06-23 09:15:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'MARINE BIA 105S' Departure from Port of Loading	9445008	357813000	105E	Vessel	MARINE BIA	22.30049832559382	91.79452471970988	f	f
321483	NYKU4387936	2021-06-28 06:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'MARINE BIA 105S' Arrival at Transhipment Port	9445008	357813000	105E	Vessel	MARINE BIA	1.271978728313698	103.768308722207	f	f
321484	NYKU4387936	2021-06-28 07:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'MARINE BIA 105S' T/S Berthing Destination	9445008	357813000	105E	Vessel	MARINE BIA	1.271978728313698	103.768308722207	f	f
321485	NYKU4387936	2021-06-28 21:22:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'MARINE BIA 105S' at Transhipment Port	9445008	357813000	105E	Vessel	MARINE BIA	1.271978728313698	103.768308722207	f	f
321486	NYKU4387936	2021-07-06 05:48:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE HUMBER 087E' at Transhipment Port	\N	\N	087E	Vessel	ONE HUMBER	1.271978728313698	103.768308722207	f	f
321487	NYKU4387936	2021-07-07 05:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	087E	Vessel	ONE HUMBER	1.271978728313698	103.768308722207	f	f
321488	NYKU4387936	2021-07-29 11:54:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'ONE HUMBER 087E' Arrival at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	f
321490	NYKU4387936	2021-08-02 22:06:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	f
321491	NYKU4387936	2021-08-03 01:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HUMBER 087E' at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321492	NYKU4387936	2021-08-03 06:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321493	NYKU4387936	2021-08-03 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321549	NYKU4387936	2021-07-29 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'ONE HUMBER 087E' Arrival at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321550	NYKU4387936	2021-08-03 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321580	NYKU4387936	2021-08-02 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321581	NYKU4387936	2021-08-02 01:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HUMBER 087E' at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321582	NYKU4387936	2021-08-02 06:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321583	NYKU4387936	2021-08-02 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321595	NYKU4387936	2021-08-01 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321596	NYKU4387936	2021-08-01 01:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HUMBER 087E' at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321597	NYKU4387936	2021-08-01 06:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321598	NYKU4387936	2021-08-01 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321740	NYKU5162169	2021-06-19 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
321741	NYKU5162169	2021-06-19 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
321742	NYKU5162169	2021-06-23 08:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'MARINE BIA 105S' at Port of Loading	9445008	357813000	105E	Vessel	MARINE BIA	22.30049832559382	91.79452471970988	f	f
321743	NYKU5162169	2021-06-23 09:15:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'MARINE BIA 105S' Departure from Port of Loading	9445008	357813000	105E	Vessel	MARINE BIA	22.30049832559382	91.79452471970988	f	f
321744	NYKU5162169	2021-06-28 06:00:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'MARINE BIA 105S' Arrival at Transhipment Port	9445008	357813000	105E	Vessel	MARINE BIA	1.271978728313698	103.768308722207	f	f
321745	NYKU5162169	2021-06-28 07:20:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel berthed in port	'MARINE BIA 105S' T/S Berthing Destination	9445008	357813000	105E	Vessel	MARINE BIA	1.271978728313698	103.768308722207	f	f
321746	NYKU5162169	2021-06-29 14:37:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'MARINE BIA 105S' at Transhipment Port	9445008	357813000	105E	Vessel	MARINE BIA	1.271978728313698	103.768308722207	f	f
321747	NYKU5162169	2021-07-05 20:38:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE HUMBER 087E' at Transhipment Port	\N	\N	087E	Vessel	ONE HUMBER	1.271978728313698	103.768308722207	f	f
321748	NYKU5162169	2021-07-07 05:40:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	\N	\N	087E	Vessel	ONE HUMBER	1.271978728313698	103.768308722207	f	f
321749	NYKU5162169	2021-07-29 11:54:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'ONE HUMBER 087E' Arrival at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	f
321751	NYKU5162169	2021-08-02 22:06:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	f
321752	NYKU5162169	2021-08-03 01:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HUMBER 087E' at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321753	NYKU5162169	2021-08-03 06:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321754	NYKU5162169	2021-08-03 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321795	NYKU5162169	2021-07-29 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel arrival	'ONE HUMBER 087E' Arrival at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321796	NYKU5162169	2021-08-03 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321826	NYKU5162169	2021-08-02 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321827	NYKU5162169	2021-08-02 01:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HUMBER 087E' at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321828	NYKU5162169	2021-08-02 06:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321829	NYKU5162169	2021-08-02 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321841	NYKU5162169	2021-08-01 00:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Vessel berthed in port	'ONE HUMBER 087E' POD Berthing Destination	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321842	NYKU5162169	2021-08-01 01:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Discharged from vessel	Unloaded from 'ONE HUMBER 087E' at Port of Discharging	\N	\N	087E	Vessel	ONE HUMBER	34.0522342	-118.2436849	f	t
321843	NYKU5162169	2021-08-01 06:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321844	NYKU5162169	2021-08-01 12:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	YTI (YUSEN TERMINAL INTL)	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
321995	TCNU9664222	2021-06-27 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
321996	TCNU9664222	2021-06-27 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
321997	TCNU9664222	2021-07-01 14:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'SOL HIND 2109S' at Port of Loading	\N	\N	009E	Vessel	SOL HIND	22.30049832559382	91.79452471970988	f	f
321998	TCNU9664222	2021-07-01 14:50:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'SOL HIND 2109S' Departure from Port of Loading	\N	\N	009E	Vessel	SOL HIND	22.30049832559382	91.79452471970988	f	f
321999	TCNU9664222	2021-07-07 21:50:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'SOL HIND 2109S' Arrival at Transhipment Port	\N	\N	009E	Vessel	SOL HIND	1.271978728313698	103.768308722207	f	f
322000	TCNU9664222	2021-07-08 17:35:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'SOL HIND 2109S' at Transhipment Port	\N	\N	009E	Vessel	SOL HIND	1.271978728313698	103.768308722207	f	f
322001	TCNU9664222	2021-07-23 15:49:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE CONTINUITY 057E' at Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
322002	TCNU9664222	2021-07-24 17:15:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
322003	TCNU9664222	2021-08-17 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322005	TCNU9664222	2021-08-17 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322006	TCNU9664222	2021-08-17 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322007	TCNU9664222	2021-08-17 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
322008	TCNU9664222	2021-08-18 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
322017	TCNU9664222	2021-08-15 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322018	TCNU9664222	2021-08-15 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322019	TCNU9664222	2021-08-15 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322020	TCNU9664222	2021-08-15 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
322021	TCNU9664222	2021-08-16 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
322059	TCNU9664222	2021-08-14 21:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322061	TCNU9664222	2021-08-14 23:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322062	TCNU9664222	2021-08-15 00:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322063	TCNU9664222	2021-08-15 05:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
322227	TCNU1687160	2021-07-09 20:00:00	Esack Brothers Industries Ltd, Chattogram, Bangladesh	Halishahar	Bangladesh	\N	\N	Container Vanned	Container Vanned	\N	\N	\N	\N	\N	22.3116579	91.7900998	f	f
322228	TCNU1687160	2021-09-18 10:00:00	Halifax, Nova Scotia, Canada	Halifax	Canada	CAHAL	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	0TUK9S1MA	Vessel	SEAP CMA CGM BRAZIL	44.64876350000001	-63.5752387	f	t
322347	KKTU7887918	2021-06-27 20:00:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	NEMSAN CONTAINER LIMITED	Gate out empty	Empty Container Release to Shipper	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
322348	KKTU7887918	2021-06-27 23:45:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Gate in	Gate In to Outbound Terminal	\N	\N	\N	\N	\N	22.30049832559382	91.79452471970988	f	f
322349	KKTU7887918	2021-07-01 14:30:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Loaded on vessel	Loaded on 'SOL HIND 2109S' at Port of Loading	\N	\N	009E	Vessel	SOL HIND	22.30049832559382	91.79452471970988	f	f
322350	KKTU7887918	2021-07-01 14:50:00	CHITTAGONG ,BANGLADESH	Chattogram	Bangladesh	BDCGP	CHITTAGONG TERMINAL	Vessel departed	'SOL HIND 2109S' Departure from Port of Loading	\N	\N	009E	Vessel	SOL HIND	22.30049832559382	91.79452471970988	f	f
322351	KKTU7887918	2021-07-07 21:50:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel arrival at transshipment port	'SOL HIND 2109S' Arrival at Transhipment Port	\N	\N	009E	Vessel	SOL HIND	1.271978728313698	103.768308722207	f	f
322352	KKTU7887918	2021-07-08 07:46:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Discharged transshipment	Unloaded from 'SOL HIND 2109S' at Transhipment Port	\N	\N	009E	Vessel	SOL HIND	1.271978728313698	103.768308722207	f	f
322353	KKTU7887918	2021-07-24 05:05:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Loaded on vessel at transshipment port	Loaded on 'ONE CONTINUITY 057E' at Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
322354	KKTU7887918	2021-07-24 17:15:00	SINGAPORE ,SINGAPORE	Singapore	Singapore	SGSIN	PSA (PORT OF SINGAPORE AUTHORITY)	Vessel departure from transshipment port	Departure from Transhipment Port	9388352	370407000	057E	Vessel	ONE CONTINUITY	1.271978728313698	103.768308722207	f	f
322355	KKTU7887918	2021-08-17 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322357	KKTU7887918	2021-08-17 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322358	KKTU7887918	2021-08-17 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322359	KKTU7887918	2021-08-17 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
322360	KKTU7887918	2021-08-18 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
322369	KKTU7887918	2021-08-15 11:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322689	EITU1425554	2021-06-28 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
322370	KKTU7887918	2021-08-15 13:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322371	KKTU7887918	2021-08-15 14:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322372	KKTU7887918	2021-08-15 19:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
322373	KKTU7887918	2021-08-16 01:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate in empty return	Empty Container Returned from Customer	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
322411	KKTU7887918	2021-08-14 21:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel arrival	'ONE CONTINUITY 057E' Arrival at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322413	KKTU7887918	2021-08-14 23:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Vessel berthed in port	'ONE CONTINUITY 057E' POD Berthing Destination	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322414	KKTU7887918	2021-08-15 00:30:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Discharged from vessel	Unloaded from 'ONE CONTINUITY 057E' at Port of Discharging	9388352	370407000	057E	Vessel	ONE CONTINUITY	34.0522342	-118.2436849	f	t
322415	KKTU7887918	2021-08-15 05:00:00	LOS ANGELES, CA ,UNITED STATES	Los Angeles	United States	USLAX	TRAPAC LOS ANGELES	Gate out from destination port	Gate Out from Inbound Terminal for Delivery to Consignee (or Port Shuttle)	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	t
322467	TCNU8326529	2021-07-06 23:00:00	CHITTAGONG	Chattogram	Bangladesh	\N	\N	Gate out empty	Gate out empty	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
322468	TCNU8326529	2021-07-08 23:30:00	CHITTAGONG	Chattogram	Bangladesh	\N	\N	Gate in at origin port	Arrival in	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
322469	TCNU8326529	2021-07-11 09:48:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Vessel departed	Vessel departed	\N	\N	076S	Vessel	X-PRESS KOHIMA	22.30049832559382	91.79452471970988	f	f
322470	TCNU8326529	2021-07-11 23:10:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel at origin port	Loaded	\N	\N	076S	Vessel	X-PRESS KOHIMA	22.30049832559382	91.79452471970988	f	f
322471	TCNU8326529	2021-07-16 19:06:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Vessel arrived	Vessel arrived	\N	\N	076S	Vessel	X-PRESS KOHIMA	6.916666666666667	79.85	f	f
322472	TCNU8326529	2021-07-16 22:53:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Discharged from vessel	Discharged	\N	\N	076S	Vessel	X-PRESS KOHIMA	6.916666666666667	79.85	f	f
322473	TCNU8326529	2021-08-06 09:00:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Vessel departed	Vessel departure	\N	\N	213E	Vessel	ONE HONOLULU	6.916666666666667	79.85	f	t
322474	TCNU8326529	2021-08-25 15:00:00	HALIFAX, NS	Halifax	Canada	CAHAL	\N	Vessel arrival	Vessel arrival	\N	\N	213E	Vessel	ONE HONOLULU	44.64876350000001	-63.5752387	f	t
322475	TCNU8326529	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.64876350000001	-63.5752387	f	t
322476	TCNU8326529	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
322485	TCNU8326529	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.6475811	-63.5727683	f	t
322486	TCNU8326529	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
322495	TCNU8326529	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.6475811	-63.5727683	f	t
322496	TCNU8326529	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
322503	TCNU8326529	2021-08-06 01:30:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Vessel departed	Vessel departure	\N	\N	213E	Vessel	ONE HONOLULU	6.916666666666667	79.85	f	t
322505	TCNU8326529	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.64876350000001	-63.5752387	f	t
322506	TCNU8326529	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
322619	HAMU1269494	2021-07-06 23:00:00	CHITTAGONG	Chattogram	Bangladesh	\N	\N	Gate out empty	Gate out empty	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
322620	HAMU1269494	2021-07-09 23:30:00	CHITTAGONG	Chattogram	Bangladesh	\N	\N	Gate in at origin port	Arrival in	\N	\N	\N	Truck	\N	22.356851	91.7831819	f	f
322621	HAMU1269494	2021-07-11 09:48:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Vessel departed	Vessel departed	\N	\N	076S	Vessel	X-PRESS KOHIMA	22.30049832559382	91.79452471970988	f	f
322622	HAMU1269494	2021-07-11 23:11:00	CHITTAGONG	Chattogram	Bangladesh	BDCGP	\N	Loaded on vessel at origin port	Loaded	\N	\N	076S	Vessel	X-PRESS KOHIMA	22.30049832559382	91.79452471970988	f	f
322623	HAMU1269494	2021-07-16 19:06:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Vessel arrived	Vessel arrived	\N	\N	076S	Vessel	X-PRESS KOHIMA	6.916666666666667	79.85	f	f
322624	HAMU1269494	2021-07-17 01:48:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Discharged from vessel	Discharged	\N	\N	076S	Vessel	X-PRESS KOHIMA	6.916666666666667	79.85	f	f
322625	HAMU1269494	2021-08-06 09:00:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Vessel departed	Vessel departure	\N	\N	213E	Vessel	ONE HONOLULU	6.916666666666667	79.85	f	t
322626	HAMU1269494	2021-08-25 15:00:00	HALIFAX, NS	Halifax	Canada	CAHAL	\N	Vessel arrival	Vessel arrival	\N	\N	213E	Vessel	ONE HONOLULU	44.6475811	-63.5727683	f	t
322627	HAMU1269494	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.6475811	-63.5727683	f	t
322628	HAMU1269494	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
322637	HAMU1269494	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.64876350000001	-63.5752387	f	t
322638	HAMU1269494	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
322645	HAMU1269494	2021-08-06 01:30:00	COLOMBO	Colombo	Sri Lanka	LKCMB	\N	Vessel departed	Vessel departure	\N	\N	213E	Vessel	ONE HONOLULU	6.916666666666667	79.85	f	t
322647	HAMU1269494	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.64876350000001	-63.5752387	f	t
322648	HAMU1269494	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
322657	TCNU8326529	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.64876350000001	-63.5752387	f	t
322658	TCNU8326529	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
322690	EITU1425554	2021-06-30 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
322691	EITU1425554	2021-07-14 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0165-032N	Vessel	GREEN CELEBRITY	20.8449115	106.6880841	f	f
322692	EITU1425554	2021-07-19 00:00:00	HONG KONG (HK)	Hong Kong (Hk)	Hong Kong	HKHKG	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0165-032N	Vessel	GREEN CELEBRITY	22.3193039	114.1693611	f	f
322693	EITU1425554	2021-07-21 00:00:00	HONG KONG (HK)	Hong Kong (Hk)	Hong Kong	HKHKG	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.3193039	114.1693611	f	f
322694	EITU1425554	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322731	EMCU9717793	2021-06-09 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
322732	EMCU9717793	2021-06-11 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
322733	EMCU9717793	2021-06-17 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0885-644N	Vessel	UNI-ACTIVE	20.8449115	106.6880841	f	f
322734	EMCU9717793	2021-06-19 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0885-644N	Vessel	UNI-ACTIVE	22.6272784	120.3014353	f	f
322735	EMCU9717793	2021-07-06 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	\N	\N	0060-001E	Vessel	EVER FINE	22.6272784	120.3014353	f	f
322753	FCIU7522769	2021-06-21 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
322754	FCIU7522769	2021-06-22 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
322755	FCIU7522769	2021-06-25 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9786968	416032000	0934-032B	Vessel	EVER BASIS	-6.133333333333334	106.83333333333333	f	f
322756	FCIU7522769	2021-07-02 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9786968	416032000	0934-032B	Vessel	EVER BASIS	22.6272784	120.3014353	f	f
322757	FCIU7522769	2021-07-14 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
322759	FCIU7522769	2021-07-19 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9961612	356407000	0062-049E	Vessel	EVER LUCKY	22.6272784	120.3014353	f	f
322760	FCIU7522769	2021-08-11 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322779	TCNU2120253	2021-06-19 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
322780	TCNU2120253	2021-06-22 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
322781	TCNU2120253	2021-06-24 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9786968	416032000	0934-032B	Vessel	EVER BASIS	-6.098516936064017	106.9023760515587	f	f
322782	TCNU2120253	2021-07-02 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9786968	416032000	0934-032B	Vessel	EVER BASIS	22.6272784	120.3014353	f	f
322783	TCNU2120253	2021-07-14 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
322785	TCNU2120253	2021-07-19 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9961612	356407000	0062-049E	Vessel	EVER LUCKY	22.6272784	120.3014353	f	f
322786	TCNU2120253	2021-08-11 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322803	FCIU9258906	2021-06-12 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
322804	FCIU9258906	2021-06-13 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
322805	FCIU9258906	2021-06-17 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0885-644N	Vessel	UNI-ACTIVE	20.8449115	106.6880841	f	f
322806	FCIU9258906	2021-06-20 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0885-644N	Vessel	UNI-ACTIVE	22.6272784	120.3014353	f	f
322807	FCIU9258906	2021-06-26 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
322809	FCIU9258906	2021-06-28 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9300439	372241000	1196-091E	Vessel	EVER STEADY	22.6272784	120.3014353	f	f
322810	FCIU9258906	2021-07-27 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Discharged from vessel	Discharged (FCL)	9300439	372241000	1196-091E	Vessel	EVER STEADY	34.0522342	-118.2436849	f	f
322811	FCIU9258906	2021-07-29 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Gate out to consignee	Pick-up by merchant haulage	\N	\N	\N	\N	\N	34.0522342	-118.2436849	f	f
322820	EGHU9675306	2021-06-20 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
322821	EGHU9675306	2021-06-21 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
322822	EGHU9675306	2021-06-27 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9784130	372354000	0937-033A	Vessel	EVER BRAVE	-6.098516936064017	106.9023760515587	f	f
322823	EGHU9675306	2021-07-07 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9784130	372354000	0937-033A	Vessel	EVER BRAVE	22.6272784	120.3014353	f	f
322824	EGHU9675306	2021-07-20 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9961612	356407000	0062-049E	Vessel	EVER LUCKY	22.6272784	120.3014353	f	f
322719	HAMU1269494	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.64876350000001	-63.5752387	f	t
322720	HAMU1269494	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
322729	HAMU1269494	\N	HALIFAX, NS	Halifax	Canada	\N	\N	Gate out from destination port	Departure from	\N	\N	\N	Rail	\N	44.64876350000001	-63.5752387	f	t
322730	HAMU1269494	\N	TORONTO, ON	Toronto	Canada	\N	\N	Gate in	Arrival in	\N	\N	\N	Rail	\N	43.653226	-79.3831843	f	t
322825	EGHU9675306	2021-08-10 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322835	EITU1299625	2021-06-19 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
322836	EITU1299625	2021-06-21 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
322837	EITU1299625	2021-06-27 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9784130	372354000	0937-033A	Vessel	EVER BRAVE	-6.133333333333334	106.83333333333333	f	f
322838	EITU1299625	2021-07-07 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9784130	372354000	0937-033A	Vessel	EVER BRAVE	22.6272784	120.3014353	f	f
322839	EITU1299625	2021-07-20 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9961612	356407000	0062-049E	Vessel	EVER LUCKY	22.6272784	120.3014353	f	f
322840	EITU1299625	2021-08-11 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322847	BEAU4454210	2021-06-19 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
322848	BEAU4454210	2021-06-22 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
322849	BEAU4454210	2021-06-27 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9784130	372354000	0937-033A	Vessel	EVER BRAVE	-6.133333333333334	106.83333333333333	f	f
322850	BEAU4454210	2021-07-06 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9784130	372354000	0937-033A	Vessel	EVER BRAVE	22.6272784	120.3014353	f	f
322851	BEAU4454210	2021-07-20 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9961612	356407000	0062-049E	Vessel	EVER LUCKY	22.6272784	120.3014353	f	f
322852	BEAU4454210	2021-08-11 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322865	TEMU6408314	2021-06-19 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
322866	TEMU6408314	2021-06-22 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
322867	TEMU6408314	2021-06-27 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9784130	372354000	0937-033A	Vessel	EVER BRAVE	-6.098516936064017	106.9023760515587	f	f
322868	TEMU6408314	2021-07-06 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9784130	372354000	0937-033A	Vessel	EVER BRAVE	22.6272784	120.3014353	f	f
322869	TEMU6408314	2021-07-20 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9961612	356407000	0062-049E	Vessel	EVER LUCKY	22.6272784	120.3014353	f	f
322870	TEMU6408314	2021-08-11 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322876	TEMU6408314	2021-08-10 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322889	EITU1287671	2021-06-16 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
322890	EITU1287671	2021-06-18 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
322891	EITU1287671	2021-06-29 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0889-329N	Vessel	UNI-PREMIER	20.8449115	106.6880841	f	f
322892	EITU1287671	2021-07-02 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0889-329N	Vessel	UNI-PREMIER	22.6272784	120.3014353	f	f
322893	EITU1287671	2021-07-16 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9247546	636016106	0031-013E	Vessel	ENSENADA	22.6272784	120.3014353	f	f
322894	EITU1287671	2021-08-01 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322907	EGHU8249570	2021-06-17 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
322908	EGHU8249570	2021-06-19 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
322909	EGHU8249570	2021-06-29 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0889-329N	Vessel	UNI-PREMIER	20.8449115	106.6880841	f	f
322910	EGHU8249570	2021-07-02 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0889-329N	Vessel	UNI-PREMIER	22.6272784	120.3014353	f	f
322911	EGHU8249570	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9247546	636016106	0031-013E	Vessel	ENSENADA	22.6272784	120.3014353	f	f
322912	EGHU8249570	2021-08-01 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322919	CAAU5346910	2021-07-01 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
322920	CAAU5346910	2021-07-03 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
322921	CAAU5346910	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.133333333333334	106.83333333333333	f	f
322922	CAAU5346910	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
322923	CAAU5346910	2021-07-23 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
322925	CAAU5346910	2021-07-25 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
322926	CAAU5346910	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322943	EGHU9828278	2021-07-01 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
322944	EGHU9828278	2021-07-03 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
322945	EGHU9828278	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.098516936064017	106.9023760515587	f	f
322946	EGHU9828278	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
322947	EGHU9828278	2021-07-22 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
322949	EGHU9828278	2021-07-25 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
322950	EGHU9828278	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322957	DRYU9425143	2021-06-29 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
322958	DRYU9425143	2021-06-30 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
322959	DRYU9425143	2021-07-04 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0935-028B	Vessel	EVER BURLY	-6.133333333333334	106.83333333333333	f	f
322960	DRYU9425143	2021-07-16 00:00:00	TAIPEI (TW)	Taipei (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0935-028B	Vessel	EVER BURLY	25.0329636	121.5654268	f	f
322961	DRYU9425143	2021-07-27 00:00:00	TAIPEI (TW)	Taipei (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	25.0329636	121.5654268	f	f
322962	DRYU9425143	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
322993	TCNU3671369	2021-07-02 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
322994	TCNU3671369	2021-07-03 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
322995	TCNU3671369	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.133333333333334	106.83333333333333	f	f
322996	TCNU3671369	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
322997	TCNU3671369	2021-07-22 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
322999	TCNU3671369	2021-07-24 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323000	TCNU3671369	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323025	FCIU7513704	2021-07-02 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323026	FCIU7513704	2021-07-03 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323027	FCIU7513704	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0938-027A	Vessel	EVER BEAMY	-6.098516936064017	106.9023760515587	f	f
323028	FCIU7513704	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323029	FCIU7513704	2021-07-23 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323031	FCIU7513704	2021-07-25 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	\N	\N	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323032	FCIU7513704	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323053	TGBU6892471	2021-06-28 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323054	TGBU6892471	2021-06-30 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323055	TGBU6892471	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.133333333333334	106.83333333333333	f	f
323056	TGBU6892471	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323057	TGBU6892471	2021-07-21 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323059	TGBU6892471	2021-07-24 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323060	TGBU6892471	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323101	BMOU4470982	2021-06-29 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323102	BMOU4470982	2021-06-30 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323103	BMOU4470982	2021-07-06 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.098516936064017	106.9023760515587	f	f
323104	BMOU4470982	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323105	BMOU4470982	2021-07-21 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323107	BMOU4470982	2021-07-25 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323108	BMOU4470982	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323133	TRHU4766879	2021-06-26 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323134	TRHU4766879	2021-06-29 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323135	TRHU4766879	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.098516936064017	106.9023760515587	f	f
323136	TRHU4766879	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323137	TRHU4766879	2021-07-23 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323139	TRHU4766879	2021-07-25 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323140	TRHU4766879	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323165	TRHU4937246	2021-06-26 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323166	TRHU4937246	2021-06-29 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323167	TRHU4937246	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.098516936064017	106.9023760515587	f	f
323168	TRHU4937246	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323169	TRHU4937246	2021-07-23 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323171	TRHU4937246	2021-07-25 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323172	TRHU4937246	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323189	TRHU5239384	2021-06-30 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323190	TRHU5239384	2021-07-02 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323191	TRHU5239384	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.133333333333334	106.83333333333333	f	f
323192	TRHU5239384	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323193	TRHU5239384	2021-07-22 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323195	TRHU5239384	2021-07-25 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323196	TRHU5239384	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323205	EGHU9689700	2021-06-30 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323206	EGHU9689700	2021-07-02 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323207	EGHU9689700	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.098516936064017	106.9023760515587	f	f
323208	EGHU9689700	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323209	EGHU9689700	2021-07-23 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323211	EGHU9689700	2021-07-25 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323212	EGHU9689700	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323221	EITU1034610	2021-07-17 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323222	EITU1034610	2021-07-20 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323402	TCLU7983692	2021-07-14 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323223	EITU1034610	2021-07-23 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0941-027A	Vessel	EVER BEING	-6.133333333333334	106.83333333333333	f	f
323224	EITU1034610	2021-07-31 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0941-027A	Vessel	EVER BEING	22.6272784	120.3014353	f	f
323225	EITU1034610	2021-08-01 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323227	EITU1034610	2021-08-23 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323234	EITU1034610	2021-09-13 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323243	EITU9011078	2021-07-18 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323244	EITU9011078	2021-07-20 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323245	EITU9011078	2021-07-23 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0941-027A	Vessel	EVER BEING	-6.098516936064017	106.9023760515587	f	f
323246	EITU9011078	2021-07-31 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0941-027A	Vessel	EVER BEING	22.6272784	120.3014353	f	f
323247	EITU9011078	2021-08-01 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323249	EITU9011078	2021-09-13 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323265	TEMU8690490	2021-07-15 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323266	TEMU8690490	2021-07-17 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323267	TEMU8690490	2021-07-23 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0941-027A	Vessel	EVER BEING	-6.133333333333334	106.83333333333333	f	f
323268	TEMU8690490	2021-07-31 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0941-027A	Vessel	EVER BEING	22.6272784	120.3014353	f	f
323269	TEMU8690490	2021-08-01 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323271	TEMU8690490	2021-08-23 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323278	TEMU8690490	2021-09-13 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323300	EGHU9270437	2021-07-13 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323301	EGHU9270437	2021-07-16 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323302	EGHU9270437	2021-07-21 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0939-024A	Vessel	EVER BEFIT	-6.098516936064017	106.9023760515587	f	f
323303	EGHU9270437	2021-07-28 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0939-024A	Vessel	EVER BEFIT	22.6272784	120.3014353	f	f
323304	EGHU9270437	2021-08-17 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323309	EGHU9270437	2021-08-16 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323324	MAGU5298870	2021-07-13 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323325	MAGU5298870	2021-07-16 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323326	MAGU5298870	2021-07-21 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0939-024A	Vessel	EVER BEFIT	-6.133333333333334	106.83333333333333	f	f
323327	MAGU5298870	2021-07-28 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0939-024A	Vessel	EVER BEFIT	22.6272784	120.3014353	f	f
323328	MAGU5298870	2021-08-17 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323343	MAGU5298870	2021-08-16 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323370	TEMU8539859	2021-07-15 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323371	TEMU8539859	2021-07-17 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323372	TEMU8539859	2021-07-23 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0941-027A	Vessel	EVER BEING	-6.133333333333334	106.83333333333333	f	f
323373	TEMU8539859	2021-07-31 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0941-027A	Vessel	EVER BEING	22.6272784	120.3014353	f	f
323374	TEMU8539859	2021-08-01 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323376	TEMU8539859	2021-08-23 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323383	TEMU8539859	2021-09-13 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323401	TCLU7983692	2021-07-12 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323403	TCLU7983692	2021-07-21 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0939-024A	Vessel	EVER BEFIT	-6.133333333333334	106.83333333333333	f	f
323404	TCLU7983692	2021-07-28 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0939-024A	Vessel	EVER BEFIT	22.6272784	120.3014353	f	f
323405	TCLU7983692	2021-08-17 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323410	TCLU7983692	2021-08-16 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323436	TCNU2859074	2021-06-22 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
323438	TCNU2859074	2021-07-02 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel	Loaded (FCL) on vessel	9249245	235700000	0011-325N	Vessel	EVER PRIMA	20.8449115	106.6880841	f	f
323439	TCNU2859074	2021-07-05 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9249245	235700000	0011-325N	Vessel	EVER PRIMA	22.6272784	120.3014353	f	f
323440	TCNU2859074	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9247546	636016106	0031-013E	Vessel	ENSENADA	22.6272784	120.3014353	f	f
323441	TCNU2859074	2021-08-05 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323469	EITU1393499	2021-06-28 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
323470	EITU1393499	2021-06-30 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
323471	EITU1393499	2021-07-14 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0165-032N	Vessel	GREEN CELEBRITY	20.8449115	106.6880841	f	f
323472	EITU1393499	2021-07-19 00:00:00	HONG KONG (HK)	Hong Kong (Hk)	Hong Kong	HKHKG	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0165-032N	Vessel	GREEN CELEBRITY	22.3193039	114.1693611	f	f
323473	EITU1393499	2021-07-21 00:00:00	HONG KONG (HK)	Hong Kong (Hk)	Hong Kong	HKHKG	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.3193039	114.1693611	f	f
323474	EITU1393499	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323485	EITU1943722	2021-06-19 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323486	EITU1943722	2021-06-22 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323487	EITU1943722	2021-06-24 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9786968	416032000	0934-032B	Vessel	EVER BASIS	-6.098516936064017	106.9023760515587	f	f
323488	EITU1943722	2021-07-03 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9786968	416032000	0934-032B	Vessel	EVER BASIS	22.6272784	120.3014353	f	f
323489	EITU1943722	2021-07-14 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323491	EITU1943722	2021-07-19 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9961612	356407000	0062-049E	Vessel	EVER LUCKY	22.6272784	120.3014353	f	f
323492	EITU1943722	2021-08-11 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323505	TGBU6939049	2021-06-21 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323506	TGBU6939049	2021-06-22 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323507	TGBU6939049	2021-06-25 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9786968	416032000	0934-032B	Vessel	EVER BASIS	-6.133333333333334	106.83333333333333	f	f
323508	TGBU6939049	2021-07-02 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9786968	416032000	0934-032B	Vessel	EVER BASIS	22.6272784	120.3014353	f	f
323509	TGBU6939049	2021-07-14 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323511	TGBU6939049	2021-07-19 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9961612	356407000	0062-049E	Vessel	EVER LUCKY	22.6272784	120.3014353	f	f
323512	TGBU6939049	2021-08-11 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323520	TGBU6939049	2021-08-10 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323527	EITU1038684	2021-06-12 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323528	EITU1038684	2021-06-14 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323529	EITU1038684	2021-06-20 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0933-026B	Vessel	EVER BEING	-6.098516936064017	106.9023760515587	f	f
323530	EITU1038684	2021-07-01 00:00:00	TAIPEI (TW)	Taipei (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0933-026B	Vessel	EVER BEING	25.0329636	121.5654268	f	f
323531	EITU1038684	2021-07-11 00:00:00	TAIPEI (TW)	Taipei (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	\N	\N	0060-001E	Vessel	EVER FINE	25.0329636	121.5654268	f	f
323532	EITU1038684	2021-08-01 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Discharged from vessel	Discharged (FCL)	\N	\N	0060-001E	Vessel	EVER FINE	34.0522342	-118.2436849	f	f
323541	EITU1452349	2021-06-19 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323542	EITU1452349	2021-06-21 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323543	EITU1452349	2021-06-27 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9784130	372354000	0937-033A	Vessel	EVER BRAVE	-6.133333333333334	106.83333333333333	f	f
323544	EITU1452349	2021-07-07 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9784130	372354000	0937-033A	Vessel	EVER BRAVE	22.6272784	120.3014353	f	f
323545	EITU1452349	2021-07-20 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9961612	356407000	0062-049E	Vessel	EVER LUCKY	22.6272784	120.3014353	f	f
323546	EITU1452349	2021-08-11 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323558	EITU1452349	2021-08-10 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323575	EITU9279409	2021-06-20 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323576	EITU9279409	2021-06-21 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323577	EITU9279409	2021-06-27 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9784130	372354000	0937-033A	Vessel	EVER BRAVE	-6.098516936064017	106.9023760515587	f	f
323578	EITU9279409	2021-07-07 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9784130	372354000	0937-033A	Vessel	EVER BRAVE	22.6272784	120.3014353	f	f
323579	EITU9279409	2021-07-20 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9961612	356407000	0062-049E	Vessel	EVER LUCKY	22.6272784	120.3014353	f	f
323580	EITU9279409	2021-08-10 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323605	EGHU8259095	2021-06-16 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
323606	EGHU8259095	2021-06-18 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	20.8449115	106.6880841	f	f
323607	EGHU8259095	2021-06-29 00:00:00	HAIPHONG, VIETNAM (VN)	Haiphong	Vietnam	VNHPH	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0889-329N	Vessel	UNI-PREMIER	20.8449115	106.6880841	f	f
323608	EGHU8259095	2021-07-02 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0889-329N	Vessel	UNI-PREMIER	22.6272784	120.3014353	f	f
323609	EGHU8259095	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9247546	636016106	0031-013E	Vessel	ENSENADA	22.6272784	120.3014353	f	f
323610	EGHU8259095	2021-08-05 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323616	EGHU8259095	2021-08-01 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323623	EISU8338376	2021-06-21 00:00:00	SEMARANG (ID)	Semarang	Indonesia	IDSRG	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.966666666666667	110.48333333333333	f	f
323624	EISU8338376	2021-06-22 00:00:00	SEMARANG (ID)	Semarang	Indonesia	IDSRG	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.966666666666667	110.48333333333333	f	f
323625	EISU8338376	2021-06-26 00:00:00	SEMARANG (ID)	Semarang	Indonesia	IDSRG	\N	Loaded on vessel	Loaded (FCL) on vessel	9786968	416032000	0934-032B	Vessel	EVER BASIS	-6.966666666666667	110.48333333333333	f	f
323626	EISU8338376	2021-07-02 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9786968	416032000	0934-032B	Vessel	EVER BASIS	22.6272784	120.3014353	f	f
323627	EISU8338376	2021-07-14 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323629	EISU8338376	2021-07-19 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9961612	356407000	0062-049E	Vessel	EVER LUCKY	22.6272784	120.3014353	f	f
323630	EISU8338376	2021-08-11 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323638	EISU8338376	2021-08-10 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323639	EITU9240541	2021-06-28 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323640	EITU9240541	2021-06-30 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323641	EITU9240541	2021-07-03 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0935-028B	Vessel	EVER BURLY	-6.133333333333334	106.83333333333333	f	f
323642	EITU9240541	2021-07-16 00:00:00	TAIPEI (TW)	Taipei (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0935-028B	Vessel	EVER BURLY	25.0329636	121.5654268	f	f
323643	EITU9240541	2021-07-27 00:00:00	TAIPEI (TW)	Taipei (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	25.0329636	121.5654268	f	f
323644	EITU9240541	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323669	EGHU9345623	2021-06-29 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323670	EGHU9345623	2021-06-30 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323671	EGHU9345623	2021-07-03 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0935-028B	Vessel	EVER BURLY	-6.098516936064017	106.9023760515587	f	f
323818	TRHU5109570	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323672	EGHU9345623	2021-07-16 00:00:00	TAIPEI (TW)	Taipei (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0935-028B	Vessel	EVER BURLY	25.0329636	121.5654268	f	f
323673	EGHU9345623	2021-07-27 00:00:00	TAIPEI (TW)	Taipei (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	25.0329636	121.5654268	f	f
323674	EGHU9345623	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323675	FCIU7063886	2021-07-01 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323676	FCIU7063886	2021-07-03 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323677	FCIU7063886	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.133333333333334	106.83333333333333	f	f
323678	FCIU7063886	2021-07-14 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323679	FCIU7063886	2021-07-22 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323681	FCIU7063886	2021-07-24 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323682	FCIU7063886	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323707	TGBU6934767	2021-07-01 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323708	TGBU6934767	2021-07-03 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323709	TGBU6934767	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.133333333333334	106.83333333333333	f	f
323710	TGBU6934767	2021-07-14 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323711	TGBU6934767	2021-07-22 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323713	TGBU6934767	2021-07-24 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323714	TGBU6934767	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323757	EITU1795332	2021-06-28 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323758	EITU1795332	2021-06-30 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323759	EITU1795332	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.133333333333334	106.83333333333333	f	f
323760	EITU1795332	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323761	EITU1795332	2021-07-23 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323763	EITU1795332	2021-07-25 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323764	EITU1795332	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323779	EISU9403840	2021-06-29 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323780	EISU9403840	2021-06-30 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323781	EISU9403840	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.133333333333334	106.83333333333333	f	f
323782	EISU9403840	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323783	EISU9403840	2021-07-22 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323785	EISU9403840	2021-07-24 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323786	EISU9403840	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323811	TRHU5109570	2021-06-27 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323812	TRHU5109570	2021-06-29 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323813	TRHU5109570	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.098516936064017	106.9023760515587	f	f
323814	TRHU5109570	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323815	TRHU5109570	2021-07-23 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323817	TRHU5109570	2021-07-25 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323867	FSCU8139795	2021-06-27 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323868	FSCU8139795	2021-06-29 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323869	FSCU8139795	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.098516936064017	106.9023760515587	f	f
323870	FSCU8139795	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323871	FSCU8139795	2021-07-23 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323873	FSCU8139795	2021-07-24 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323874	FSCU8139795	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323899	TGBU4030159	2021-06-30 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323900	TGBU4030159	2021-07-02 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323901	TGBU4030159	2021-07-07 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	9787003	416034000	0938-027A	Vessel	EVER BEAMY	-6.098516936064017	106.9023760515587	f	f
323902	TGBU4030159	2021-07-15 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	9787003	416034000	0938-027A	Vessel	EVER BEAMY	22.6272784	120.3014353	f	f
323903	TGBU4030159	2021-07-22 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323905	TGBU4030159	2021-07-24 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	22.6272784	120.3014353	f	f
323906	TGBU4030159	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323931	EITU9056771	2021-06-29 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323932	EITU9056771	2021-06-30 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
323933	EITU9056771	2021-07-03 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0935-028B	Vessel	EVER BURLY	-6.098516936064017	106.9023760515587	f	f
323934	EITU9056771	2021-07-16 00:00:00	TAIPEI (TW)	Taipei (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0935-028B	Vessel	EVER BURLY	25.0329636	121.5654268	f	f
323935	EITU9056771	2021-07-27 00:00:00	TAIPEI (TW)	Taipei (Tw)	Taiwan	\N	\N	Loaded on vessel at transshipment port	Transship container loaded on vessel	9629093	416497000	0063-047E	Vessel	EVER LUNAR	25.0329636	121.5654268	f	f
323936	EITU9056771	2021-08-18 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
323961	EITU9141404	2021-07-17 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323962	EITU9141404	2021-07-20 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.133333333333334	106.83333333333333	f	f
323963	EITU9141404	2021-07-23 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0941-027A	Vessel	EVER BEING	-6.133333333333334	106.83333333333333	f	f
323964	EITU9141404	2021-07-31 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0941-027A	Vessel	EVER BEING	22.6272784	120.3014353	f	f
323965	EITU9141404	2021-08-01 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
323967	EITU9141404	2021-08-23 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
324000	CAAU5420685	2021-07-15 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate out empty	Empty pick-up by merchant haulage	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
324001	CAAU5420685	2021-07-17 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Gate in full	Received (FCL)	\N	\N	\N	\N	\N	-6.098516936064017	106.9023760515587	f	f
324002	CAAU5420685	2021-07-23 00:00:00	JAKARTA (ID)	Jakarta	Indonesia	IDJKT	\N	Loaded on vessel	Loaded (FCL) on vessel	\N	\N	0941-027A	Vessel	EVER BEING	-6.098516936064017	106.9023760515587	f	f
324003	CAAU5420685	2021-07-31 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Discharged from vessel at transshipment port	Discharged and waiting for transshipping	\N	\N	0941-027A	Vessel	EVER BEING	22.6272784	120.3014353	f	f
324004	CAAU5420685	2021-08-01 00:00:00	KAOHSIUNG (TW)	Kaohsiung (Tw)	Taiwan	\N	\N	Gate out	Despatched by truck	\N	\N	\N	\N	\N	22.6272784	120.3014353	f	f
324006	CAAU5420685	2021-09-13 07:00:00	LOS ANGELES, CA (US)	Los Angeles	United States	USLAX	\N	Vessel arrived at destination port	Vessel arrived at destination port	\N	\N	\N	Vessel	\N	34.0522342	-118.2436849	f	t
\.


--
-- Data for Name: container_trackings; Type: TABLE DATA; Schema: public; Owner: ellie_dev_team
--

COPY public.container_trackings (id, container_id, shipping_company, vizion_reference_id, vision_organization_id, bill_of_lading, latest_status, created_at, updated_at, finished_journey, uploaded) FROM stdin;
1	ECMU4670610	CMDU	610c503d-63e1-40cd-9a57-01caa6e078d2	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	CMDUBAC0254707	\N	2021-07-27 00:06:43.411397	2021-07-27 00:07:25.644342	f	f
2	APZU4512494	CMDU	be1a85db-5e02-428f-88ad-b66c403e230b	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	CMDUBAC0254707	\N	2021-07-27 00:06:43.42111	2021-07-27 00:07:28.874134	f	f
3	CAIU9339738	MEDU	a353c524-c5c2-4b56-9ac3-64a4dd2d5ddf	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA831479	\N	2021-07-27 00:06:43.429698	2021-07-27 00:07:32.093116	f	f
4	MEDU8303623	MEDU	89c8cddf-a8ef-4cc1-bbb4-6f9aed69a84a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA831479	\N	2021-07-27 00:06:43.4382	2021-07-27 00:07:35.323511	f	f
5	MSCU8293196	MEDU	f3fca44a-c794-4aa9-8e14-14ac8e6b2602	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA825901	\N	2021-07-27 00:06:43.44664	2021-07-27 00:07:38.54033	f	f
6	MEDU3637377	MEDU	9b60acfa-7b15-42be-a753-cb14bd6f3730	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA825984	\N	2021-07-27 00:06:43.455533	2021-07-27 00:07:41.811599	f	f
7	TGHU9117649	MEDU	5a497a9b-2e0a-4410-ac0e-9d2baca25c3a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA834101	\N	2021-07-27 00:06:43.464407	2021-07-27 00:07:45.030956	f	f
8	TCLU7537047	MEDU	3f9a48be-de90-46b7-b313-05e140b1029f	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA852244	\N	2021-07-27 00:06:43.473181	2021-07-27 00:07:48.421194	f	f
9	DFSU6679443	MEDU	b7dc8cbf-60a6-4091-95e2-22aea32009bf	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA845230	\N	2021-07-27 00:06:43.481758	2021-07-27 00:07:51.643799	f	f
10	MSCU7160162	MEDU	14aaefb2-d0ec-4aec-ac32-cb36dd66556b	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA845230	\N	2021-07-27 00:06:43.490288	2021-07-27 00:07:54.90187	f	f
11	CXDU2162167	MEDU	e0dca205-c69f-4396-be38-238a70ae5017	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA845230	\N	2021-07-27 00:06:43.500952	2021-07-27 00:07:58.147527	f	f
12	FFAU2714334	MEDU	fdbde99b-7958-4c6d-942d-131f51f76318	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA845230	\N	2021-07-27 00:06:43.509735	2021-07-27 00:08:01.373906	f	f
13	INKU2382856	MEDU	45c29db9-946b-47f1-8223-e82d9df0f779	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA845230	\N	2021-07-27 00:06:43.518227	2021-07-27 00:08:04.936689	f	f
14	MEDU8017039	MEDU	b00376e9-d0a2-4100-b4ee-582ee6f8d2cf	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA853606	\N	2021-07-27 00:06:43.527119	2021-07-27 00:08:08.497139	f	f
15	TCLU5578026	MEDU	71d60ece-4b25-4c18-894b-982f5f684b94	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA853606	\N	2021-07-27 00:06:43.535809	2021-07-27 00:08:11.985923	f	f
16	GESU6799250	ONEY	d64765de-3b55-4801-b707-c606a2b7d26a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14131600	\N	2021-07-27 00:06:43.54596	2021-07-27 00:08:15.406536	f	f
17	TCNU4833757	ONEY	a136691d-f6e6-4166-9e0a-4f57e65866b6	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14131600	\N	2021-07-27 00:06:43.554273	2021-07-27 00:08:18.950814	f	f
18	SEGU5856874	ONEY	81e1217b-1c79-4b9e-8203-69e2e336feb0	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14131600	\N	2021-07-27 00:06:43.56285	2021-07-27 00:08:22.358993	f	f
19	TRHU4989620	ONEY	febc4922-a4c3-411a-8ab6-f835e7e7c63a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14131600	\N	2021-07-27 00:06:43.571426	2021-07-27 00:08:25.665924	f	f
20	SLHU4500038	OOLU	ef0b6f5c-257b-43d7-a7da-00d4203efe53	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	OOLU2669839560	\N	2021-07-27 00:06:43.583665	2021-07-27 00:08:28.879154	f	f
34	TCNU4573449	EGLV	ae5d13c2-d395-404a-a41f-5fb41d8d2e90	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV236100284675	\N	2021-07-30 01:23:07.029361	2021-08-02 22:53:44.230011	f	f
21	CAIU8160877	MEDU	15e639f8-31a2-48d2-9a87-aaebb68b5546	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA834077	\N	2021-07-30 01:23:06.617421	2021-07-30 01:30:03.654758	f	f
22	MSCU5248038	MEDU	700cbd6f-9f84-458a-8643-8b755d3ad9eb	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA850982	\N	2021-07-30 01:23:06.685778	2021-07-30 01:30:07.136414	f	f
23	SZLU9560138	ONEY	23ae9fbb-14e0-47fb-aea0-8a168bd0df84	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB13116800	\N	2021-07-30 01:23:06.71534	2021-07-30 01:30:10.64135	f	f
24	MEDU6555930	MEDU	8d40bd34-c972-4d6c-b4b6-e354c6cc0244	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA850974	\N	2021-07-30 01:23:06.728478	2021-07-30 01:30:13.925257	f	f
25	MSCU1268695	MEDU	eaec3139-fad9-42a2-91f5-3df93ab8bdd0	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA853481	\N	2021-07-30 01:23:06.736839	2021-07-30 01:30:17.215121	f	f
26	HLBU2194717	HLCU	71f05df5-677e-4f61-8967-9c9611c1f0da	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HLCUDA1210600215	\N	2021-07-30 01:23:06.798601	2021-07-30 01:30:20.54667	f	f
27	TCLU4660335	ONEY	5eb793e8-8da8-4aca-a841-de4915c69564	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB13814600	\N	2021-07-30 01:23:06.80736	2021-07-30 01:30:23.966168	f	f
28	TCLU15296377	ONEY	7a948ca9-e965-47c5-b512-12feb47fffd5	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14230600	\N	2021-07-30 01:23:06.895388	2021-07-30 01:30:27.214494	f	f
29	TCLU1529677	ONEY	08ed15dd-670f-4bd9-ab2a-413744055231	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14230600	\N	2021-07-30 01:23:06.904723	2021-07-30 01:30:30.47113	f	f
30	TGHU4212155	MEDU	a20e7c0e-2fc7-42a6-9422-318f75bbcba5	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA859686	\N	2021-07-30 01:23:06.925707	2021-07-30 01:30:34.357984	f	f
31	MEDU1907391	MEDU	4393754a-3c3e-45ad-b095-006500e43c52	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA859686	\N	2021-07-30 01:23:06.934851	2021-07-30 01:30:37.612103	f	f
32	SEGU4468196	ONEY	4f8347f1-974a-40aa-968e-85f9414fc81a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14330700	\N	2021-07-30 01:23:06.944081	2021-07-30 01:30:41.036327	f	f
33	GCXU2210170	ONEY	6b8ce57a-1f56-4626-b244-0187b608473e	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14330700	\N	2021-07-30 01:23:06.953274	2021-07-30 01:30:44.29767	f	f
37	GESU6157476	ONEY	f9ac5ccb-f09b-4d86-af58-80c09e322472	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYSGNBJ2126700	\N	2021-07-30 01:23:07.081885	2021-07-30 01:30:56.93833	f	f
38	TCNU1488934	HLCU	6167dbbe-0d22-4265-bd8a-46faceda01fd	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HLCUDA1210600332	\N	2021-07-30 01:23:07.134763	2021-08-03 21:58:06.039997	f	f
39	TLLU4443549	ZIMU	9f928c94-a3da-4ddf-8868-adb77cea0494	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ZIMUHAI80034305	\N	2021-07-30 01:23:07.155373	2021-07-30 01:31:03.457596	f	f
42	TGHU9708791	ZIMU	19a46efb-76fe-4a23-9fdc-a37092260e79	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ZIMUNGB9704776	\N	2021-07-30 01:23:07.497668	2021-07-30 01:31:23.568253	f	f
43	ZCSU7106355	ZIMU	1112d7b5-b9c2-4731-b9de-7d22cee8d5e7	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ZIMUNGB9704776	\N	2021-07-30 01:23:07.506813	2021-07-30 01:31:26.80754	f	f
44	TGBU7240673	ZIMU	08d9912a-ee57-4c98-bf67-a70574a46922	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ZIMUNGB9704776	\N	2021-07-30 01:23:07.515966	2021-07-30 01:31:30.098961	f	f
45	ZCSU7381803	ZIMU	94fe5959-d0e6-416c-bcdc-75959ced1a46	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ZIMUNGB9704776	\N	2021-07-30 01:23:07.525138	2021-07-30 01:31:33.442994	f	f
205	TCLU5458442	ONEY	0f5e9171-2610-4890-b6a2-06e5f445e1fa	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14471600	\N	2021-08-03 21:00:04.149067	2021-08-03 21:30:10.312201	f	f
48	SEGU2284991	CMDU	63d6ed2e-2b32-421b-86e8-95fa5ec379af	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	CMDUBAC0255017	\N	2021-07-30 21:00:03.928858	2021-07-30 21:30:25.028119	f	f
207	TCNU4564914	ZIMU	854c6b65-1cf3-47b5-859a-fb5ea90efab1	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ZIMUHAI80031213	\N	2021-08-03 21:00:04.192346	2021-08-03 21:30:16.881763	f	f
52	BMOU4860933	EGLV	d0708f82-172c-4813-89ff-b1a0275dc0a5	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV236100245777	\N	2021-07-30 21:00:03.98229	2021-08-02 22:53:47.991434	f	f
208	NYKU4627364	ONEY	da2bfa7f-7be1-49d1-861c-07dc020da977	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14521900	\N	2021-08-03 21:00:04.256791	2021-08-03 21:30:20.155879	f	f
209	NYKU5238686	ONEY	03846288-fa18-4c5a-9d44-f52374358dd9	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14520800	\N	2021-08-03 21:00:04.3759	2021-08-03 21:30:23.488225	f	f
210	AXIU1365550	ONEY	c367136f-843f-4b4a-a2fd-92725e584b01	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14520800	\N	2021-08-03 21:00:04.385052	2021-08-03 21:30:26.759978	f	f
211	OOCU7821056	COSU	93bbdb3b-9c48-4377-b48d-88cf85553943	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6306929170	\N	2021-08-03 21:00:04.476101	2021-08-03 21:30:30.005017	f	f
212	UACU5342430	HLCU	e254f0ab-5d05-44f7-a359-5cca067e6a4a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HLCUDA1210600365	\N	2021-08-03 21:00:04.484975	2021-08-03 21:30:33.240308	f	f
213	CAIU9428331	COSU	99ccd1db-31de-444e-a5d5-22e89004f3b2	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6306929170	\N	2021-08-03 21:00:04.555014	2021-08-03 21:30:36.550676	f	f
214	CSLU6182287	COSU	48795982-0061-4575-aa3c-6c982bde3abe	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6306929170	\N	2021-08-03 21:00:04.563691	2021-08-03 21:30:39.78657	f	f
215	CBHU5816262	COSU	cb82cc84-bfe4-44bb-9efd-28b164d28efa	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6306929170	\N	2021-08-03 21:00:04.572161	2021-08-03 21:30:43.044885	f	f
216	BEAU2044860	COSU	65fd9f70-5f20-4e6e-85a6-712455d79a35	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6305654100	\N	2021-08-03 21:00:04.593248	2021-08-03 21:30:46.290798	f	f
217	CCLU1918887	COSU	94a66a26-b165-4c1b-b3a9-36b6012a5748	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6305654100	\N	2021-08-03 21:00:04.601865	2021-08-03 21:30:49.789508	f	f
218	OOCU7443038	COSU	36e2da3d-6ab2-40ef-b7dd-65dac479b6e6	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6305654100	\N	2021-08-03 21:00:04.61018	2021-08-03 21:30:53.018608	f	f
219	NLLU4114635	OOLU	06788e12-71c7-492e-8444-91aae92b8502	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	OOLU2670294590	\N	2021-08-03 21:00:04.619404	2021-08-03 21:30:56.27686	f	f
220	OOLU1245915	COSU	dd977d34-272a-43cc-9db2-6edb884ff911	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6306660160	\N	2021-08-03 21:00:04.781651	2021-08-03 21:58:09.621519	f	f
221	CCLU7975366	COSU	815bc69e-f4fd-482b-9f34-31324b2e6c49	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6306660160	\N	2021-08-03 21:00:04.790722	2021-08-03 21:31:02.863814	f	f
222	DFSU7284047	COSU	3b54b10d-bdcd-42f9-8393-9af3587f133f	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6306660160	\N	2021-08-03 21:00:04.799435	2021-08-03 21:31:06.269802	f	f
223	CAIU8016495	MEDU	98ec2ac4-c644-4b59-b24a-eb82262eec98	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA893792	\N	2021-08-03 21:00:04.808117	2021-08-03 21:31:09.50914	f	f
224	TGCU5008699	MEDU	0de64fc2-7a76-42bd-9482-7d60eeb616f4	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA893792	\N	2021-08-03 21:00:04.816359	2021-08-03 21:31:12.736646	f	f
225	TRHU6250958	MEDU	a4fcb2d5-6f8b-4314-be79-7270e201ba60	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA893792	\N	2021-08-03 21:00:04.8245	2021-08-03 21:31:15.974256	f	f
226	CBHU6290980	COSU	5368f3a0-4d7f-43cf-a9a7-2bcb33beb7e3	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6306523190	\N	2021-08-03 21:00:04.835188	2021-08-03 21:31:19.222183	f	f
227	CSNU1076762	COSU	006c24b6-b1b0-4124-80b3-7b73ac6a899f	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6307465550	\N	2021-08-03 21:00:05.015929	2021-08-03 21:31:22.458638	f	f
228	TEMU0096163	COSU	25375616-e6a8-4b7c-a840-4d084159230b	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6307181380	\N	2021-08-03 21:00:05.029215	2021-08-03 21:31:25.774139	f	f
230	TRHU2656450	ONEY	6fb7b546-1502-4d3a-936a-7c02492df4d7	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB17153600	\N	2021-08-03 21:00:05.403289	2021-08-03 21:31:32.274483	f	f
55	CAIU7405595	HDMU	63698183-61be-4d61-9342-41984bbae3ef	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM74157100	\N	2021-07-30 21:00:04.008471	2021-07-30 21:30:47.252308	f	f
57	HMMU6008101	HDMU	42096507-029d-4bf5-a519-053eb949d484	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM74157100	\N	2021-07-30 21:00:04.025845	2021-07-30 21:30:53.702037	f	f
59	BSIU9264228	HDMU	77a40b37-e84b-448f-9c3a-64b90838581a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM62025300	\N	2021-07-30 21:00:04.044986	2021-07-30 21:31:00.160539	f	f
60	KOCU4209016	HDMU	e736e949-2701-4251-b5fc-c645ecd05e23	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM62025300	\N	2021-07-30 21:00:04.053456	2021-07-30 21:31:03.416381	f	f
62	HMMU6243292	HDMU	de76eb7f-39f3-40a0-b99d-73cb350a8423	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM62025300	\N	2021-07-30 21:00:04.07086	2021-07-30 21:31:09.889387	f	f
69	HMMU6084523	HDMU	c723eeed-33ae-4a23-9e92-63a97c6facf7	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM69770400	\N	2021-07-30 21:00:04.169185	2021-07-30 21:31:31.9952	f	f
70	TCNU5067609	HDMU	b32ae014-0403-4872-9333-b6b340909594	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM69770400	\N	2021-07-30 21:00:04.177634	2021-07-30 21:31:35.216826	f	f
72	KOCU4318254	HDMU	93a5157c-ea5e-491c-9353-82a715f5f4e9	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM69770400	\N	2021-07-30 21:00:04.19512	2021-07-30 21:31:41.83889	f	f
74	KOCU4178194	HDMU	80ace9e5-d0f9-4f90-95f5-0d075e94d15c	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM69770400	\N	2021-07-30 21:00:04.212178	2021-07-30 21:31:48.289996	f	f
78	FCIU9234632	ONEY	af970b21-3aad-464e-8695-1efb0907b2ea	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYSRGB30650600	\N	2021-07-30 21:00:04.281819	2021-07-30 21:32:00.960029	f	f
79	FDCU0634031	ONEY	749b2c1b-9eb7-41c1-b155-bc71c3f333e5	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYSRGB30650600	\N	2021-07-30 21:00:04.290069	2021-07-30 21:32:04.421008	f	f
88	TRLU7202269	COSU	c8587f4a-55ca-4812-b286-03bda9d623b9	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6305139840	\N	2021-07-30 21:00:04.41197	2021-07-30 21:32:33.694408	f	f
90	TCLU5847568	CMDU	4cf9aac9-d10f-469b-bcb4-453ac05601ae	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	CMDUCFA0422622	\N	2021-07-30 21:00:04.443904	2021-07-30 21:32:40.398197	f	f
97	SEGU5802374	HDMU	5c09dfa4-8949-4563-bdbd-c9c4a9b88738	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM39168700	\N	2021-07-30 21:00:04.537749	2021-07-30 21:33:02.467666	f	f
99	TRHU4177333	ONEY	30715877-99ed-4cba-9ef9-0911b36483d3	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTB97892400	\N	2021-07-30 21:00:04.555241	2021-07-30 21:33:08.949156	f	f
100	KKFU7928885	ONEY	136468ff-91fa-48c1-8ba2-5a0b0f37d338	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTB97892400	\N	2021-07-30 21:00:04.563393	2021-07-30 21:33:12.174394	f	f
102	NYKU4369465	ONEY	47d44435-f3e6-4c00-bc00-377765dea37f	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTB97892400	\N	2021-07-30 21:00:04.580823	2021-07-30 21:33:18.64439	f	f
104	SEGU4990765	ONEY	1a1cb95c-6d86-4392-8679-8af364645a06	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTB979050600	\N	2021-07-30 21:00:04.604475	2021-07-30 21:33:25.082465	f	f
107	SEGU6093421	CMDU	55fb16b1-0394-4977-bcaa-2227f23d90d8	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	CMDUCFA0423976	\N	2021-07-30 21:00:04.66723	2021-07-30 21:33:34.882083	f	f
108	TCNU2664600	CMDU	4fdde21c-1d8d-4e0f-bbd1-4d47b4b0c07b	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	CMDUCFA0423976	\N	2021-07-30 21:00:04.675647	2021-07-30 21:33:38.14209	f	f
127	EGHU9785833	EGLV	d988a206-1737-479b-ac43-8a6889701fd2	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312002	\N	2021-07-30 21:00:04.881842	2021-08-02 22:53:51.702838	f	f
129	TRHU5681610	EGLV	f2ddb428-8249-4845-97e8-e4de19765d67	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312304	\N	2021-07-30 21:00:04.907953	2021-08-02 22:53:55.406208	f	f
203	CAIU8967196	MEDU	6e86ae87-694b-4b4d-a595-8eab84af35e7	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA852244	\N	2021-08-03 21:00:03.999783	2021-08-03 21:30:03.382348	f	f
204	TCNU6502892	ONEY	ecf581d8-5d57-4c8f-a576-82beba44c5cb	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14471600	\N	2021-08-03 21:00:04.139783	2021-08-03 21:30:06.947484	f	f
206	KKFU7755028	ONEY	1252ae83-4b31-4d35-aaf1-ecea206fcf51	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14471600	\N	2021-08-03 21:00:04.157695	2021-08-03 21:30:13.579353	f	f
229	CSLU1532443	COSU	9d59a204-24b9-4b2b-b162-b6620ba86dab	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6308021130	\N	2021-08-03 21:00:05.086161	2021-08-03 21:31:29.006448	f	f
46	MEDU8619545	MEDU	3f785b15-4864-43eb-8235-3c8cd84c13b5	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA834143	\N	2021-07-30 21:00:03.857524	2021-07-30 21:30:18.486082	f	f
47	SEGU4716559	MEDU	0739cb06-5472-4a0c-80c2-25ee929deb8d	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA834143	\N	2021-07-30 21:00:03.867285	2021-07-30 21:30:21.771334	f	f
49	GLDU9864000	CMDU	f4ccc46b-0eda-4559-90e0-bf7f179d166a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	CMDUBAC0255018	\N	2021-07-30 21:00:03.943629	2021-07-30 21:30:28.261723	f	f
50	OOLU8929036	OOLU	a10e1690-96d1-4a94-901e-9dfaeb62b5c4	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	OOLU2669679710	\N	2021-07-30 21:00:03.96213	2021-07-30 21:30:31.488625	f	f
51	OOLU1151550	OOLU	7236559d-d6e6-4613-ab32-7d9b2d9a2016	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	OOLU267053477001	\N	2021-07-30 21:00:03.973646	2021-07-30 21:30:34.727766	f	f
56	HMMU6044428	HDMU	43c92ed7-03ae-4185-85de-94b646af5cc9	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM74157100	\N	2021-07-30 21:00:04.017445	2021-07-30 21:30:50.483442	f	f
58	KOCU4727801	HDMU	87aae42d-ea88-46c3-9fe5-656eafa30026	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM51641300	\N	2021-07-30 21:00:04.034403	2021-07-30 21:30:56.925086	f	f
61	KOCU4106907	HDMU	d1d9c8ef-afd8-4e51-a1c6-1d357027c3b7	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM62025300	\N	2021-07-30 21:00:04.062092	2021-07-30 21:31:06.649374	f	f
134	SEGU5332711	ZIMU	e0776083-511c-4fa5-b35a-204949d077fb	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ZIMUHAI80035104	\N	2021-07-30 21:00:04.969958	2021-07-30 21:35:00.522377	f	f
137	KOCU4193389	HDMU	69e3380f-0e64-4a71-8ee1-6eddcfbcf42c	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM45496500	\N	2021-07-30 21:00:05.090733	2021-07-30 21:35:10.092082	f	f
138	BSIU9161111	HDMU	ba89d698-7482-4ab3-a2cc-979aea8c7a07	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM66097400	\N	2021-07-30 21:00:05.111	2021-07-30 21:35:13.316378	f	f
140	CAIU7468931	HDMU	2f22413b-4676-4ff1-b7ff-89e48450c91d	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM90490600	\N	2021-07-30 21:00:05.127813	2021-07-30 21:35:19.813279	f	f
142	CAIU4564870	HDMU	a473a3c2-f1c4-4d8a-80e3-63129e62ead2	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM90490600	\N	2021-07-30 21:00:05.144545	2021-07-30 21:35:26.384381	f	f
144	NYKU4108477	ONEY	76540c1a-5695-43a0-88af-d1c27abc2945	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTBA1697700	\N	2021-07-30 21:00:05.162311	2021-07-30 21:35:32.863084	f	f
145	FFAU1843825	ONEY	b76b3e13-de7c-4f61-af0a-3f301f6fe2a6	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTBA1697700	\N	2021-07-30 21:00:05.171414	2021-07-30 21:35:36.098521	f	f
147	KKFU7923775	ONEY	6be435f7-4993-4f73-859a-44c45e3a58a4	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTBA1697700	\N	2021-07-30 21:00:05.18923	2021-07-30 21:35:42.613409	f	f
149	NYKU4803864	ONEY	bca877e6-5ca3-42cb-91d0-41bccd081a13	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYPNHB19439900	\N	2021-07-30 21:00:05.225028	2021-07-30 21:35:49.093395	f	f
151	TCNU6648064	ONEY	a836b1f9-4d73-4d7a-b3a5-9545645b1dc7	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYPNHB19439900	\N	2021-07-30 21:00:05.242486	2021-07-30 21:35:55.592484	f	f
152	TLLU5507334	ONEY	5ea9e224-cb15-438a-9d8e-c83d165d8d12	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYPNHB19439900	\N	2021-07-30 21:00:05.251103	2021-07-30 21:35:58.828878	f	f
154	CBHU9161733	COSU	a560370e-9268-45f1-891b-894d1a116416	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6304334090	\N	2021-07-30 21:00:05.268068	2021-07-30 21:36:05.683721	f	f
156	SEGU4686032	COSU	04c9201a-a3d2-4c0d-98e6-9b290d075a55	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6304334090	\N	2021-07-30 21:00:05.286045	2021-07-30 21:36:12.720183	f	f
158	CSNU6117709	COSU	aa799fff-d405-4844-8261-810059503be3	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6305754130	\N	2021-07-30 21:00:05.30581	2021-07-30 21:36:19.707069	f	f
160	TGBU8751446	COSU	d96739c4-107b-4d90-b6ba-f1380c13d01f	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6884764830	\N	2021-07-30 21:00:05.411507	2021-07-30 21:36:26.446056	f	f
161	CBHU8795754	COSU	ea5b78d0-64a5-4ced-8ff8-550b27c80237	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6884765030	\N	2021-07-30 21:00:05.420179	2021-07-30 21:36:29.671289	f	f
163	TLLU5474821	ONEY	95eb75c8-4da4-47d1-85df-2c72a269936b	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTBA7916700	\N	2021-07-30 21:00:05.482073	2021-07-30 21:36:36.166081	f	f
165	TCLU4999550	HDMU	a3821a2c-3b15-4738-b033-6ef2f0ac1789	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM08567700	\N	2021-07-30 21:00:05.521736	2021-07-30 21:36:42.665978	f	f
167	GAOU6340626	HDMU	76c70fec-9ca9-4885-8e21-8a5e02e1976a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM08567700	\N	2021-07-30 21:00:05.539919	2021-07-30 21:36:49.256463	f	f
168	TCNU8925527	MEDU	336ede95-b1d6-41c2-aa71-abd1f1b85200	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUCP391013	\N	2021-07-30 21:00:05.555663	2021-07-30 21:36:54.304617	f	f
182	FDCU0634690	ONEY	dd7f6ad3-0695-4ccf-8ba6-a2122095b25c	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYPNHB22468500	\N	2021-07-30 21:00:05.698934	2021-07-30 21:37:38.632248	f	f
184	TCNU7773775	ONEY	de71c3a6-2969-4618-9415-aa7784091fb2	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYPNHB22468500	\N	2021-07-30 21:00:05.715961	2021-07-30 21:37:45.301995	f	f
186	MSMU5139314	MEDU	a885c61d-83fe-4cbb-a103-c279e9d2c7af	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUCP454993	\N	2021-07-30 21:00:05.80151	2021-07-30 21:37:51.930296	f	f
187	FFAU1245525	MEDU	27ed0b0c-cd3c-4730-a816-f5498c75e15d	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUCP454993	\N	2021-07-30 21:00:05.810326	2021-07-30 21:37:55.141065	f	f
63	KOCU5089851	HDMU	32de47d5-2ca4-445a-8bc3-acf7aed34fa9	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM12646200	\N	2021-07-30 21:00:04.118784	2021-07-30 21:31:13.125747	f	f
71	KOCU4614169	HDMU	88c8a473-8b78-4f64-b84d-23c9c69f3cf1	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM69770400	\N	2021-07-30 21:00:04.186308	2021-07-30 21:31:38.439193	f	f
73	KOCU4118050	HDMU	05cf2bdd-644a-467b-97b0-2b5b2ebbcc62	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM69770400	\N	2021-07-30 21:00:04.203679	2021-07-30 21:31:45.075369	f	f
77	FFAU1812974	ONEY	9fe1ed46-2313-43ac-b613-c81c474d8d6b	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYSRGB30650600	\N	2021-07-30 21:00:04.273259	2021-07-30 21:31:57.701171	f	f
87	TCKU6188160	COSU	5d978e5b-f52d-4a7b-8016-b187d09544dc	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6305139840	\N	2021-07-30 21:00:04.403554	2021-07-30 21:32:30.481341	f	f
89	CMAU5234855	CMDU	d4c9cdc6-95cf-45b7-9841-2f2bc7f07e07	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	CMDUCFA0422622	\N	2021-07-30 21:00:04.434839	2021-07-30 21:32:37.092098	f	f
96	CAIU9968345	HDMU	3b5c0f8a-6620-4bcc-ad2b-f47e0d4c7304	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM39168700	\N	2021-07-30 21:00:04.528881	2021-07-30 21:32:59.210316	f	f
98	HMMU6010407	HDMU	caac448e-3745-40dd-81ef-7c7836d6d431	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM39168700	\N	2021-07-30 21:00:04.546498	2021-07-30 21:33:05.710239	f	f
101	CRSU9367040	ONEY	17e44ad6-6471-495f-af90-94aa0f1cd441	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTB97892400	\N	2021-07-30 21:00:04.572153	2021-07-30 21:33:15.426995	f	f
103	TCLU9689250	ONEY	a522445d-5e70-42c9-b7f9-47f8afa74c0a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTB97892400	\N	2021-07-30 21:00:04.588991	2021-07-30 21:33:21.865928	f	f
105	FCIU9285028	ONEY	1504e639-d6fc-4f90-adba-10a070ed6905	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTB979050600	\N	2021-07-30 21:00:04.612997	2021-07-30 21:33:28.307905	f	f
109	TCNU7598590	CMDU	11714612-0f92-4d62-b18a-fb702fe3e2ea	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	CMDUCFA0418037	\N	2021-07-30 21:00:04.716542	2021-07-30 21:33:41.411498	f	f
133	TCNU4554285	ZIMU	c3fecdf3-12dc-4864-8d7c-7657219d88d6	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ZIMUHAI80035104	\N	2021-07-30 21:00:04.960934	2021-07-30 21:34:57.29323	f	f
136	KOCU4919070	HDMU	9c66c817-1cf1-499e-a416-abf667c45244	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM45496500	\N	2021-07-30 21:00:05.081767	2021-07-30 21:35:06.876841	f	f
139	CAIU7667960	HDMU	4ff77994-176d-4669-901b-05d5fe04b6dc	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM66097400	\N	2021-07-30 21:00:05.119569	2021-07-30 21:35:16.554805	f	f
141	TCNU7229890	HDMU	d58ac2bc-2692-40e1-8e46-a5b6ad1cc38c	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM90490600	\N	2021-07-30 21:00:05.13636	2021-07-30 21:35:23.128671	f	f
143	TCNU5069068	HDMU	f731928d-1a1e-4f2c-b10e-ec4c7119250d	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM90490600	\N	2021-07-30 21:00:05.152797	2021-07-30 21:35:29.623061	f	f
146	TCLU9826500	ONEY	28f2e12a-d74b-46be-a8fe-5fb53927a04b	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTBA1697700	\N	2021-07-30 21:00:05.180237	2021-07-30 21:35:39.346123	f	f
148	GESU6557620	ONEY	25096075-ef93-4954-bf13-55c0433e5f1d	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTBA1697700	\N	2021-07-30 21:00:05.197928	2021-07-30 21:35:45.841832	f	f
150	TCNU6423598	ONEY	b0d47c31-fe4c-4a9d-bd0c-4bd44070da09	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYPNHB19439900	\N	2021-07-30 21:00:05.233968	2021-07-30 21:35:52.374022	f	f
153	CAIU9323520	ONEY	ece197fb-a2a1-4fe2-a73a-0da018c9268a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYPNHB19439900	\N	2021-07-30 21:00:05.25956	2021-07-30 21:36:02.190487	f	f
155	DFSU7383311	COSU	a153a4f3-20c9-4588-b178-c212fedc0540	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6304334090	\N	2021-07-30 21:00:05.276503	2021-07-30 21:36:09.239967	f	f
157	MAGU5589602	COSU	5d83566c-8e70-4a64-871f-f1219a922eb2	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6305466310	\N	2021-07-30 21:00:05.294255	2021-07-30 21:36:16.240328	f	f
159	NYKU4425050	ONEY	9275b488-6ca8-4dc1-aa15-1ac318691cb2	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTBA5730600	\N	2021-07-30 21:00:05.390953	2021-07-30 21:36:23.112113	f	f
162	TRHU4358054	ONEY	93a3ab97-8f8e-4b8f-a989-4858d46ae004	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTBA7916700	\N	2021-07-30 21:00:05.472872	2021-07-30 21:36:32.911087	f	f
164	TLLU5457470	ONEY	b78c93e4-6897-4b66-be15-748f277cc023	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYJKTBA7916700	\N	2021-07-30 21:00:05.491541	2021-07-30 21:36:39.392922	f	f
166	CAIU9970194	HDMU	8ffc1c8d-38f2-4b54-8c33-821244688239	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HDMUJKTM08567700	\N	2021-07-30 21:00:05.531261	2021-07-30 21:36:45.888437	f	f
169	DRYU9456988	ONEY	a72cff9b-e660-4ef1-bff0-9ec560a32c75	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYALYB04700700	\N	2021-07-30 21:00:05.569305	2021-07-30 21:36:57.522356	f	f
183	TCNU4863643	ONEY	292c8b9b-23d5-4f0a-80a2-3d72f40ab7de	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYPNHB22468500	\N	2021-07-30 21:00:05.707714	2021-07-30 21:37:41.962534	f	f
185	TCNU5516422	ONEY	4bdd20e9-819c-416b-b771-b4b78286cdd6	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYALYB04845300	\N	2021-07-30 21:00:05.756329	2021-07-30 21:37:48.55859	f	f
188	MEDU8693239	MEDU	70cd4727-055d-4e85-93c3-7fe292be7ba7	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA834143	\N	2021-07-31 21:00:03.872835	2021-07-31 21:33:22.776915	f	f
189	FFAU1676538	MEDU	30d53e84-9d46-4038-b374-125023f500db	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA852228	\N	2021-07-31 21:00:03.988034	2021-07-31 21:33:26.004093	f	f
190	MSDU7646245	MEDU	b9d32433-83b3-4213-89f6-fa565e8bf138	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	MEDUKA852228	\N	2021-07-31 21:00:03.996659	2021-07-31 21:33:29.232437	f	f
191	TRHU5320496	ONEY	8b4c09bc-4202-429c-b85c-ec9a0d491ccb	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14519900	\N	2021-07-31 21:00:04.024268	2021-07-31 21:33:32.632288	f	f
192	TCNU6860432	ONEY	409f20cd-6c9d-4f9d-b3cb-7ac4dba17fb3	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14745300	\N	2021-07-31 21:00:04.216072	2021-07-31 21:33:35.863323	f	f
193	TRHU4342130	ONEY	3ea25557-8fc8-4bd0-89b5-bab707ea6075	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14401600	\N	2021-07-31 21:00:04.334487	2021-07-31 21:33:39.103843	f	f
194	TCLU3385202	ONEY	556a429f-8bf1-4d4f-8609-e4723a64a1d0	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14231700	\N	2021-07-31 21:00:04.343649	2021-07-31 21:33:42.449489	f	f
195	NYKU4387936	ONEY	752e15b9-def4-4c05-b160-8e60ab2a115b	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14818400	\N	2021-07-31 21:00:04.352313	2021-07-31 21:33:45.676358	f	f
196	NYKU5162169	ONEY	64c3aaaf-9eb3-4e60-a703-e1081434e597	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB14818400	\N	2021-07-31 21:00:04.360966	2021-07-31 21:33:48.902274	f	f
197	TCNU9664222	ONEY	2e948f01-4786-48e0-b0b6-b2840549065c	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB15258300	\N	2021-07-31 21:00:04.557589	2021-07-31 21:33:52.195147	f	f
198	TCNU1687160	OOLU	9a7faeab-5afb-433a-9cdb-d922a8da5404	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	OOLU2673973500	\N	2021-07-31 21:00:04.895036	2021-07-31 21:33:55.446898	f	f
199	KKTU7887918	ONEY	d7d86c23-b74f-463a-8a7e-c517c302b1ef	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	ONEYDACB15258300	\N	2021-07-31 21:00:05.047389	2021-07-31 21:33:58.669675	f	f
200	TCNU8326529	HLCU	9c118e8f-cb7c-44d3-aee0-d5f4f14d009a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HLCUDA1210702018	\N	2021-07-31 21:00:05.056278	2021-07-31 21:34:02.021697	f	f
201	HAMU1269494	HLCU	cab14a5b-885a-4635-8137-e576ebea2002	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	HLCUDA1210702007	\N	2021-07-31 21:00:05.112801	2021-07-31 21:34:05.54254	f	f
202	OOCU70993407	COSU	57428aec-560d-466b-a87c-ea7f049d7a0c	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	COSU6306596510	\N	2021-07-31 21:00:05.151591	2021-07-31 21:34:09.00308	f	f
36	TEMU6634733	EGLV	6537e86a-56b3-422a-9f88-b8c7ce31cb06	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV235101200809	\N	2021-07-30 01:23:07.051637	2021-08-02 22:53:59.12524	f	f
41	EITU1425554	EGLV	ab250383-47cf-4679-8fbf-e07ed52e4bfa	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV236100348363	\N	2021-07-30 01:23:07.288105	2021-08-02 22:54:02.688412	f	f
54	EMCU9717793	EGLV	01297c03-abfc-4a11-aece-4958f0e23837	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV236100245769	\N	2021-07-30 21:00:03.999844	2021-08-02 22:54:06.285283	f	f
65	FCIU7522769	EGLV	c0b38c7e-e40a-4093-936a-0831e6a92ef5	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100369233	\N	2021-07-30 21:00:04.135668	2021-08-02 22:54:09.78709	f	f
66	TCNU2120253	EGLV	613945d0-45bb-4fe7-819a-3094bcdd6d24	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100369233	\N	2021-07-30 21:00:04.144185	2021-08-02 22:54:13.524986	f	f
68	TCNU4502888	EGLV	f977934c-443c-4863-96d8-0b53f55de91d	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100304018	\N	2021-07-30 21:00:04.16082	2021-08-02 22:54:16.965798	f	f
76	FCIU9258906	EGLV	29f5ee45-0619-4424-9ec8-0d9d56194edd	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV236100250568	\N	2021-07-30 21:00:04.229322	2021-08-02 22:54:20.684014	f	f
81	EGHU9675306	EGLV	66dc8ec3-6b54-4798-9564-7cf60ee30c53	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312274	\N	2021-07-30 21:00:04.324445	2021-08-02 22:54:24.163236	f	f
82	EITU1299625	EGLV	c75728e8-9fd3-4c75-b3d7-b673fb7c6daf	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312274	\N	2021-07-30 21:00:04.333039	2021-08-02 22:54:27.724135	f	f
84	BEAU4454210	EGLV	19dc8c06-852a-4b0f-ac43-336df5b64550	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312282	\N	2021-07-30 21:00:04.377844	2021-08-02 22:54:31.203697	f	f
86	TEMU6408314	EGLV	8d15b1a6-e5b4-4b08-856e-c171f294bfe8	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312282	\N	2021-07-30 21:00:04.39491	2021-08-02 22:54:34.726914	f	f
92	TGBU8038883	EGLV	d312c476-ced5-4315-912f-687c359bf3ff	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV235101455319	\N	2021-07-30 21:00:04.484653	2021-08-02 22:54:38.244494	f	f
93	EITU1287671	EGLV	fbe9301b-8b9f-449f-af73-366c36ffd218	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV236100304251	\N	2021-07-30 21:00:04.49747	2021-08-02 22:54:41.804675	f	f
95	EGHU8249570	EGLV	6b9082a6-5c17-4150-8229-9196346b0bf5	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV236100304251	\N	2021-07-30 21:00:04.520426	2021-08-02 22:54:45.451446	f	f
110	CAAU5346910	EGLV	f86dd390-7ed0-45de-baa9-bb082c5b13ec	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312037	\N	2021-07-30 21:00:04.732006	2021-08-02 22:54:49.006217	f	f
111	EGHU9828278	EGLV	c7ed0cdb-0d54-4731-b27e-5c17d9a15993	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312037	\N	2021-07-30 21:00:04.740268	2021-08-02 22:54:52.543377	f	f
113	DRYU9425143	EGLV	52b2e106-8310-4ea9-bb56-6a55dd05989a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100369004	\N	2021-07-30 21:00:04.757842	2021-08-02 22:54:56.145761	f	f
115	EGHU9055060	EGLV	3dd28af7-7d32-4ab8-8116-1589ad38d0b3	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100369063	\N	2021-07-30 21:00:04.775112	2021-08-02 22:54:59.607974	f	f
117	TCNU3671369	EGLV	ead24550-7529-46ce-99c3-bd91ddf77f1a	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312029	\N	2021-07-30 21:00:04.793162	2021-08-02 22:55:03.108129	f	f
118	FCIU7513704	EGLV	6bed1a39-4f26-4972-9730-12307e9895de	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312029	\N	2021-07-30 21:00:04.801676	2021-08-02 22:55:06.665225	f	f
120	TGBU6892471	EGLV	907d58b8-720a-4b0f-92a8-b888ab8a85d4	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312011	\N	2021-07-30 21:00:04.81887	2021-08-02 22:55:10.04195	f	f
122	BMOU4470982	EGLV	83923752-5bfa-4624-ac7f-38a517ad55b3	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312011	\N	2021-07-30 21:00:04.836014	2021-08-02 22:55:13.295967	f	f
124	TRHU4766879	EGLV	1333499f-da8e-4add-b82a-88214ff283b7	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312002	\N	2021-07-30 21:00:04.854067	2021-08-02 22:55:16.531834	f	f
125	TRHU4937246	EGLV	9789409b-2cd1-4a11-b530-1217cf7f4ffa	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312002	\N	2021-07-30 21:00:04.862817	2021-08-02 22:55:19.757253	f	f
131	TRHU5239384	EGLV	0161ccdc-fae8-4df2-af9d-e51314f6cabe	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312291	\N	2021-07-30 21:00:04.933433	2021-08-02 22:55:22.973864	f	f
132	EGHU9689700	EGLV	891c08ff-1383-4bcc-a5ea-839815707bdd	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312291	\N	2021-07-30 21:00:04.942308	2021-08-02 22:55:26.207103	f	f
170	EITU1034610	EGLV	1080bd17-5288-4161-a6ff-be2d664a6a78	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100444448	\N	2021-07-30 21:00:05.584818	2021-08-02 22:55:29.489607	f	f
172	EITU9011078	EGLV	60af04fb-a719-4cef-a3b3-0a41cb52fa5f	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100444430	\N	2021-07-30 21:00:05.603476	2021-08-02 22:55:32.729024	f	f
173	TEMU8690490	EGLV	90b39f9e-5a29-4876-adf7-e491ef5d3580	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100444421	\N	2021-07-30 21:00:05.611841	2021-08-02 22:55:36.302048	f	f
175	EGHU9270437	EGLV	98734eeb-6762-43bd-82a8-287ac9c4db32	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312053	\N	2021-07-30 21:00:05.638136	2021-08-02 22:55:39.522939	f	f
177	MAGU5298870	EGLV	2443416d-dfe5-42f4-b716-45688299848f	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312053	\N	2021-07-30 21:00:05.655158	2021-08-02 22:55:42.823509	f	f
179	TEMU8539859	EGLV	e9d9f08c-ad1e-4281-b2b9-8b3b0b9d7142	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100444413	\N	2021-07-30 21:00:05.672878	2021-08-02 22:55:46.155408	f	f
180	TCLU7983692	EGLV	4b6dc500-2879-4290-8fe7-c5dfc09ca261	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312088	\N	2021-07-30 21:00:05.68118	2021-08-02 22:55:49.371485	f	f
35	TCNU2859074	EGLV	3eb2b7f0-b955-4326-90a3-dccdaa930380	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV236100284675	\N	2021-07-30 01:23:07.038308	2021-08-02 22:55:52.607996	f	f
40	EITU1393499	EGLV	ad334f03-1f6e-46b2-8eea-bc5643ceab77	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV236100348363	\N	2021-07-30 01:23:07.269474	2021-08-02 22:55:55.836422	f	f
53	HMCU9004244	EGLV	437f6a69-deed-4156-8fa7-11c10cf789c9	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV236100245769	\N	2021-07-30 21:00:03.991285	2021-08-02 22:55:59.090804	f	f
64	EITU1943722	EGLV	d72eb5c3-d1b1-4d55-a5aa-c7640c6296e0	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100369233	\N	2021-07-30 21:00:04.127471	2021-08-02 22:56:02.465444	f	f
67	TGBU6939049	EGLV	f24b4e6e-95e1-4f99-ac23-f50d7c7d6fde	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100369233	\N	2021-07-30 21:00:04.152476	2021-08-02 22:56:06.136988	f	f
75	EITU1038684	EGLV	10e5828d-38cf-4202-acb0-0a1c879e56aa	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100303992	\N	2021-07-30 21:00:04.221035	2021-08-02 22:56:09.924406	f	f
80	EITU1452349	EGLV	a154ef7a-3b10-460e-b0af-724ee060a9f0	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312274	\N	2021-07-30 21:00:04.316017	2021-08-02 22:56:13.756005	f	f
83	EITU9279409	EGLV	e5411008-663f-4559-a4cb-5e178f5c12a1	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312274	\N	2021-07-30 21:00:04.341381	2021-08-02 22:56:17.464821	f	f
85	TLLU4097549	EGLV	874d58f9-ba92-4b10-ab6a-0baf988b3483	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312282	\N	2021-07-30 21:00:04.38662	2021-08-02 22:56:21.181323	f	f
91	EISU8327073	EGLV	7db33078-3d2e-4771-ba3a-6062fbe41d98	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV235101455319	\N	2021-07-30 21:00:04.4758	2021-08-02 22:56:24.938294	f	f
94	EGHU8259095	EGLV	afe47f6a-13e6-4ad6-9f52-0f1bff9c3fd0	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV236100304251	\N	2021-07-30 21:00:04.50596	2021-08-02 22:56:29.025152	f	f
106	EISU8338376	EGLV	45c63fdf-4360-4e6e-903c-7d0719928eb9	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV082100149779	\N	2021-07-30 21:00:04.658741	2021-08-02 22:56:32.848702	f	f
112	EITU9240541	EGLV	f566f6a2-bed4-41bc-85ac-b3d74243d040	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100369004	\N	2021-07-30 21:00:04.74883	2021-08-02 22:56:36.523296	f	f
114	EGHU9345623	EGLV	a2632545-93a7-4ef5-a444-fdec9b01f86f	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100369063	\N	2021-07-30 21:00:04.76662	2021-08-02 22:56:40.148465	f	f
116	FCIU7063886	EGLV	472d8435-8e35-480e-bd7f-7732e6cc1ff4	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312029	\N	2021-07-30 21:00:04.783596	2021-08-02 22:56:43.891639	f	f
119	TGBU6934767	EGLV	877c7a0f-0a45-4551-877e-ad51c85c7b75	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312029	\N	2021-07-30 21:00:04.810763	2021-08-02 22:56:47.233291	f	f
121	EITU1795332	EGLV	e84c8692-f45f-4ef2-8830-0726cff3acaa	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312011	\N	2021-07-30 21:00:04.827309	2021-08-02 22:56:50.551238	f	f
123	EISU9403840	EGLV	8b939766-970c-4f45-9959-a0743e0036c3	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312011	\N	2021-07-30 21:00:04.84484	2021-08-02 22:56:53.914697	f	f
126	TRHU5109570	EGLV	557cba63-1c9e-4cfa-ace1-c61d98336ec2	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312002	\N	2021-07-30 21:00:04.872187	2021-08-02 22:56:57.511635	f	f
128	FSCU8139795	EGLV	3ad8ab60-f164-4483-a2a5-0bec715011b9	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312304	\N	2021-07-30 21:00:04.898945	2021-08-02 22:57:00.741048	f	f
130	TGBU4030159	EGLV	c0ffbafd-d152-444d-a633-4ffeb92593df	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312291	\N	2021-07-30 21:00:04.924452	2021-08-02 22:57:04.090266	f	f
135	EITU9056771	EGLV	6c5873d1-a14f-4cb6-8892-b44a31226cfe	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100369063	\N	2021-07-30 21:00:05.047667	2021-08-02 22:57:07.403687	f	f
171	EITU9141404	EGLV	17d80a95-9173-4f99-ae5d-a9f6c6695545	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100444430	\N	2021-07-30 21:00:05.59455	2021-08-02 22:57:10.681161	f	f
174	TEMU8914590	EGLV	59e4f24f-cec9-4aec-8904-1a8ac408dc20	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100444421	\N	2021-07-30 21:00:05.620282	2021-08-02 22:57:13.919911	f	f
176	CAIU9790124	EGLV	f1dd0bb8-1641-4a40-934b-6cabcefbea50	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312053	\N	2021-07-30 21:00:05.646644	2021-08-02 22:57:17.32079	f	f
178	CAAU5420685	EGLV	48d0528d-56a8-4602-a3cc-84c279ac97d6	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100444413	\N	2021-07-30 21:00:05.663585	2021-08-02 22:57:20.549456	f	f
181	EITU1815995	EGLV	73ee913b-6631-49be-b819-fec7a8e00138	f59471f6-a2e5-46f9-9c1c-6d26b71afe64	EGLV080100312088	\N	2021-07-30 21:00:05.689494	2021-08-02 22:57:23.829246	f	f
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ellie_dev_team
--

COPY public.schema_migrations (version) FROM stdin;
20210723213830
20210724220121
20210725175608
20210725175625
\.


--
-- Data for Name: shipping_lines_carrier_codes; Type: TABLE DATA; Schema: public; Owner: ellie_dev_team
--

COPY public.shipping_lines_carrier_codes (id, carrier_name, carrier_id, carrier_code) FROM stdin;
1	Aliana Navegao e Logstica (Aliana)	1	SUDU
2	ANL	2	ANNU
3	APL	3	APLU
4	Cheng Lie Navigation (CNC)	4	CMDU
5	China Shipping Container Lines (CSCL)	5	COSU
6	CMA-CGM	6	CMDU
7	Compaa Chilena de Navegacin Interocenica S.A. (CCNI)	7	SUDU
8	Containerships	8	CDMU
9	COSCO	9	COSU
10	Evergreen	10	EGLV
11	Hyundai Merchant Marine (HMM)	11	HDMU
12	Hamburg-Sd	12	SUDU
13	Hapag Lloyd	13	HCLU
14	Kawasaki Kisen Kaisha, Ltd. (K-Line)	14	ONEY
15	MacAndrews	15	CMDU
16	Maersk	16	MAEU
17	Mitsui O.S.K. Lines (MOL)	17	ONEY
18	MCC Transport (MCC)	18	MAEU
19	MSC	19	MSCU
20	Ocean Network Express (ONE)	20	ONEY
21	OOCL	21	OOCL
22	OPDR	22	CMDU
23	Safmarine	23	SAFM
24	Seago Line	24	MAEU
25	Sealand	25	MAEU
26	United Arab Shipping Company	26	HLCU
27	W.E.C. Lines	27	WECU
28	ZIM	28	ZIMU
\.


--
-- Data for Name: shipping_lines_scac_codes; Type: TABLE DATA; Schema: public; Owner: ellie_dev_team
--

COPY public.shipping_lines_scac_codes (id, carrier_code, scac_code) FROM stdin;
1	1	SUDU
2	2	ANNU
3	3	APLU
4	4	CMDU
5	5	COSU
6	6	AMCU
7	6	CGHU
8	6	CGMD
9	6	CGMN
10	6	CGMU
11	6	CMDU
12	7	SUDU
13	8	CMDU
14	9	COSU
15	9	CQGD
16	9	CQSQ
17	9	CSHI
18	9	CSNG
19	9	CSZH
20	9	CXMN
21	10	EGLV
22	11	HDMU
23	11	HDMZ
24	11	HMMU
25	11	HYUD
26	11	KMTZ
27	11	HADL
28	12	SUDU
29	12	HSDG
30	12	DNLU
31	12	ENAU
32	12	HASU
33	12	JLCU
34	12	KHJU
35	12	KHLU
36	12	PSNU
37	12	RMLU
38	13	HLCU
39	13	HLXU
40	13	HPGC
41	13	HLUS
42	14	ONEY
43	15	CMDU
44	16	MAEU
45	16	APMZ
46	16	CCMZ
47	16	DCLZ
48	16	DCSZ
49	16	MAEG
50	16	MAET
51	16	MCIU
52	16	MCSU
53	16	MKLN
54	16	MRUF
55	16	UMSZ
56	17	MOEZ
57	17	MOFZ
58	17	MOEU
59	17	MOFU
60	17	MOGU
61	17	MOLU
62	17	MORU
63	17	MORZ
64	17	MOSU
65	17	MOSZ
66	17	MOTU
67	17	MOTZ
68	17	MLNS
69	17	MOAU
70	18	MAEU
71	19	MSCU
72	19	MEDU
73	20	ONEY
74	20	NBAN
75	20	NBKW
76	20	NCCN
77	20	NLAT
78	20	NLUS
79	20	AKLU
80	20	EKLU
81	20	ESSU
82	20	KKFU
83	20	KKLU
84	20	KKTU
85	20	KLFU
86	20	KLTU
87	20	KMEU
88	20	KXTU
89	20	PXCU
90	20	CMDU
91	20	NYKU
92	21	OOLU
93	21	OOCC
94	21	OOCL
95	21	OOLL
96	22	CMDU
97	23	SAFM
98	24	MAEU
99	25	MAEU
100	26	HLCU
101	28	WECU
102	29	ZIMU
\.


--
-- Name: container_milestones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ellie_dev_team
--

SELECT pg_catalog.setval('public.container_milestones_id_seq', 324040, true);


--
-- Name: container_trackings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ellie_dev_team
--

SELECT pg_catalog.setval('public.container_trackings_id_seq', 230, true);


--
-- Name: shipping_lines_carrier_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ellie_dev_team
--

SELECT pg_catalog.setval('public.shipping_lines_carrier_codes_id_seq', 28, true);


--
-- Name: shipping_lines_scac_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ellie_dev_team
--

SELECT pg_catalog.setval('public.shipping_lines_scac_codes_id_seq', 102, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: ellie_dev_team
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: container_milestones container_milestones_pkey; Type: CONSTRAINT; Schema: public; Owner: ellie_dev_team
--

ALTER TABLE ONLY public.container_milestones
    ADD CONSTRAINT container_milestones_pkey PRIMARY KEY (id);


--
-- Name: container_trackings container_trackings_pkey; Type: CONSTRAINT; Schema: public; Owner: ellie_dev_team
--

ALTER TABLE ONLY public.container_trackings
    ADD CONSTRAINT container_trackings_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ellie_dev_team
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: shipping_lines_carrier_codes shipping_lines_carrier_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: ellie_dev_team
--

ALTER TABLE ONLY public.shipping_lines_carrier_codes
    ADD CONSTRAINT shipping_lines_carrier_codes_pkey PRIMARY KEY (id);


--
-- Name: shipping_lines_scac_codes shipping_lines_scac_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: ellie_dev_team
--

ALTER TABLE ONLY public.shipping_lines_scac_codes
    ADD CONSTRAINT shipping_lines_scac_codes_pkey PRIMARY KEY (id);


--
-- Name: cont_id_mile_ts; Type: INDEX; Schema: public; Owner: ellie_dev_team
--

CREATE UNIQUE INDEX cont_id_mile_ts ON public.container_milestones USING btree (container_id, milestone_timestamp);


--
-- Name: index_container_milestones_on_container_id; Type: INDEX; Schema: public; Owner: ellie_dev_team
--

CREATE INDEX index_container_milestones_on_container_id ON public.container_milestones USING btree (container_id);


--
-- Name: index_container_trackings_on_container_id; Type: INDEX; Schema: public; Owner: ellie_dev_team
--

CREATE INDEX index_container_trackings_on_container_id ON public.container_trackings USING btree (container_id);


--
-- Name: index_shipping_lines_carrier_codes_on_carrier_code; Type: INDEX; Schema: public; Owner: ellie_dev_team
--

CREATE INDEX index_shipping_lines_carrier_codes_on_carrier_code ON public.shipping_lines_carrier_codes USING btree (carrier_code);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: ellie_dev_team
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO ellie_dev_team;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

