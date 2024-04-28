--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-03-18 20:47:55

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

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 32870)
-- Name: datetime_dim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.datetime_dim (
    datetime_id integer NOT NULL,
    pickup_datetime timestamp without time zone,
    dropoff_datetime timestamp without time zone,
    request_datetime timestamp without time zone,
    on_scene_datetime timestamp without time zone
);


ALTER TABLE public.datetime_dim OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32869)
-- Name: datetime_dim_datetime_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.datetime_dim_datetime_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.datetime_dim_datetime_id_seq OWNER TO postgres;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 227
-- Name: datetime_dim_datetime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.datetime_dim_datetime_id_seq OWNED BY public.datetime_dim.datetime_id;


--
-- TOC entry 226 (class 1259 OID 32861)
-- Name: dropoff_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dropoff_location (
    dolocationid integer NOT NULL,
    borough character varying(255),
    zone character varying(255),
    service_zone character varying(255)
);


ALTER TABLE public.dropoff_location OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32860)
-- Name: dropoff_location_dolocationid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dropoff_location_dolocationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dropoff_location_dolocationid_seq OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 225
-- Name: dropoff_location_dolocationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dropoff_location_dolocationid_seq OWNED BY public.dropoff_location.dolocationid;


--
-- TOC entry 216 (class 1259 OID 32817)
-- Name: hvfhs_license; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hvfhs_license (
    hvfhs_license_num integer NOT NULL,
    licensee_name character varying(255) NOT NULL
);


ALTER TABLE public.hvfhs_license OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 32816)
-- Name: hvfhs_license_hvfhs_license_num_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hvfhs_license_hvfhs_license_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hvfhs_license_hvfhs_license_num_seq OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 215
-- Name: hvfhs_license_hvfhs_license_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hvfhs_license_hvfhs_license_num_seq OWNED BY public.hvfhs_license.hvfhs_license_num;


--
-- TOC entry 218 (class 1259 OID 32824)
-- Name: license; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.license (
    license_id integer NOT NULL,
    hvfhs_license_num integer,
    originating_base_num character varying(255),
    dispatching_base_num character varying(255)
);


ALTER TABLE public.license OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32823)
-- Name: license_license_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.license_license_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.license_license_id_seq OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 217
-- Name: license_license_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.license_license_id_seq OWNED BY public.license.license_id;


--
-- TOC entry 224 (class 1259 OID 32852)
-- Name: pickup_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pickup_location (
    pulocationid integer NOT NULL,
    borough character varying(255),
    zone character varying(255),
    service_zone character varying(255)
);


ALTER TABLE public.pickup_location OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32851)
-- Name: pickup_location_pulocationid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pickup_location_pulocationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pickup_location_pulocationid_seq OWNER TO postgres;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 223
-- Name: pickup_location_pulocationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pickup_location_pulocationid_seq OWNED BY public.pickup_location.pulocationid;


--
-- TOC entry 230 (class 1259 OID 32877)
-- Name: trip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trip (
    trip_id integer NOT NULL, 
    license_id integer, -- change to text
    pulocationid integer,
    dolocationid integer,
    weather_id integer, -- change to timestamp
    datetime_id integer, -- change to timestamp
    trip_status_id integer,
    base_passenger_fare double precision,
    tolls double precision,
    bcf double precision,
    sales_tax double precision,
    congestion_surcharge double precision,
    airport_fee double precision,
    tips double precision,
    driver_pay double precision,
    trip_miles double precision,
    trip_time integer
);


ALTER TABLE public.trip OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32845)
-- Name: trip_flag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trip_flag (
    trip_status_id integer NOT NULL,
    shared_match_flag boolean,
    access_a_ride_flag boolean,
    wav_request_flag boolean,
    wav_match_flag boolean
);


ALTER TABLE public.trip_flag OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32844)
-- Name: trip_flag_trip_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trip_flag_trip_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trip_flag_trip_status_id_seq OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 221
-- Name: trip_flag_trip_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trip_flag_trip_status_id_seq OWNED BY public.trip_flag.trip_status_id;


--
-- TOC entry 229 (class 1259 OID 32876)
-- Name: trip_trip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trip_trip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trip_trip_id_seq OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 229
-- Name: trip_trip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trip_trip_id_seq OWNED BY public.trip.trip_id;


--
-- TOC entry 220 (class 1259 OID 32838)
-- Name: weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weather (
    weather_id integer NOT NULL,
    datetime timestamp without time zone,
    temp double precision,
    feelslike double precision,
    dew double precision,
    humidity double precision,
    precip double precision,
    preciptype character varying(255),
    snow double precision,
    snowdepth double precision,
    windgust double precision,
    visibility double precision
);


ALTER TABLE public.weather OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32837)
-- Name: weather_weather_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weather_weather_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weather_weather_id_seq OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 219
-- Name: weather_weather_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weather_weather_id_seq OWNED BY public.weather.weather_id;


--
-- TOC entry 4729 (class 2604 OID 32873)
-- Name: datetime_dim datetime_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datetime_dim ALTER COLUMN datetime_id SET DEFAULT nextval('public.datetime_dim_datetime_id_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 32864)
-- Name: dropoff_location dolocationid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dropoff_location ALTER COLUMN dolocationid SET DEFAULT nextval('public.dropoff_location_dolocationid_seq'::regclass);


--
-- TOC entry 4723 (class 2604 OID 32820)
-- Name: hvfhs_license hvfhs_license_num; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hvfhs_license ALTER COLUMN hvfhs_license_num SET DEFAULT nextval('public.hvfhs_license_hvfhs_license_num_seq'::regclass);


--
-- TOC entry 4724 (class 2604 OID 32827)
-- Name: license license_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license ALTER COLUMN license_id SET DEFAULT nextval('public.license_license_id_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 32855)
-- Name: pickup_location pulocationid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_location ALTER COLUMN pulocationid SET DEFAULT nextval('public.pickup_location_pulocationid_seq'::regclass);


--
-- TOC entry 4730 (class 2604 OID 32880)
-- Name: trip trip_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip ALTER COLUMN trip_id SET DEFAULT nextval('public.trip_trip_id_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 32848)
-- Name: trip_flag trip_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip_flag ALTER COLUMN trip_status_id SET DEFAULT nextval('public.trip_flag_trip_status_id_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 32841)
-- Name: weather weather_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather ALTER COLUMN weather_id SET DEFAULT nextval('public.weather_weather_id_seq'::regclass);


--
-- TOC entry 4910 (class 0 OID 32870)
-- Dependencies: 228
-- Data for Name: datetime_dim; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.datetime_dim (datetime_id, pickup_datetime, dropoff_datetime, request_datetime, on_scene_datetime) FROM stdin;
\.


--
-- TOC entry 4908 (class 0 OID 32861)
-- Dependencies: 226
-- Data for Name: dropoff_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dropoff_location (dolocationid, borough, zone, service_zone) FROM stdin;
\.


--
-- TOC entry 4898 (class 0 OID 32817)
-- Dependencies: 216
-- Data for Name: hvfhs_license; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hvfhs_license (hvfhs_license_num, licensee_name) FROM stdin;
\.


--
-- TOC entry 4900 (class 0 OID 32824)
-- Dependencies: 218
-- Data for Name: license; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.license (license_id, hvfhs_license_num, originating_base_num, dispatching_base_num) FROM stdin;
\.


--
-- TOC entry 4906 (class 0 OID 32852)
-- Dependencies: 224
-- Data for Name: pickup_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pickup_location (pulocationid, borough, zone, service_zone) FROM stdin;
\.


--
-- TOC entry 4912 (class 0 OID 32877)
-- Dependencies: 230
-- Data for Name: trip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trip (trip_id, license_id, pulocationid, dolocationid, weather_id, datetime_id, trip_status_id, base_passenger_fare, tolls, bcf, sales_tax, congestion_surcharge, airport_fee, tips, driver_pay, trip_miles, trip_time) FROM stdin;
\.


--
-- TOC entry 4904 (class 0 OID 32845)
-- Dependencies: 222
-- Data for Name: trip_flag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trip_flag (trip_status_id, shared_match_flag, access_a_ride_flag, wav_request_flag, wav_match_flag) FROM stdin;
\.


--
-- TOC entry 4902 (class 0 OID 32838)
-- Dependencies: 220
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weather (weather_id, datetime, temp, feelslike, dew, humidity, precip, preciptype, snow, snowdepth, windgust, visibility) FROM stdin;
\.


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 227
-- Name: datetime_dim_datetime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.datetime_dim_datetime_id_seq', 1, false);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 225
-- Name: dropoff_location_dolocationid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dropoff_location_dolocationid_seq', 1, false);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 215
-- Name: hvfhs_license_hvfhs_license_num_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hvfhs_license_hvfhs_license_num_seq', 1, false);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 217
-- Name: license_license_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.license_license_id_seq', 1, false);


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 223
-- Name: pickup_location_pulocationid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pickup_location_pulocationid_seq', 1, false);


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 221
-- Name: trip_flag_trip_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trip_flag_trip_status_id_seq', 1, false);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 229
-- Name: trip_trip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trip_trip_id_seq', 1, false);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 219
-- Name: weather_weather_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weather_weather_id_seq', 1, false);


--
-- TOC entry 4744 (class 2606 OID 32875)
-- Name: datetime_dim datetime_dim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datetime_dim
    ADD CONSTRAINT datetime_dim_pkey PRIMARY KEY (datetime_id);


--
-- TOC entry 4742 (class 2606 OID 32868)
-- Name: dropoff_location dropoff_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dropoff_location
    ADD CONSTRAINT dropoff_location_pkey PRIMARY KEY (dolocationid);


--
-- TOC entry 4732 (class 2606 OID 32822)
-- Name: hvfhs_license hvfhs_license_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hvfhs_license
    ADD CONSTRAINT hvfhs_license_pkey PRIMARY KEY (hvfhs_license_num);


--
-- TOC entry 4734 (class 2606 OID 32831)
-- Name: license license_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license
    ADD CONSTRAINT license_pkey PRIMARY KEY (license_id);


--
-- TOC entry 4740 (class 2606 OID 32859)
-- Name: pickup_location pickup_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_location
    ADD CONSTRAINT pickup_location_pkey PRIMARY KEY (pulocationid);


--
-- TOC entry 4738 (class 2606 OID 32850)
-- Name: trip_flag trip_flag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip_flag
    ADD CONSTRAINT trip_flag_pkey PRIMARY KEY (trip_status_id);


--
-- TOC entry 4746 (class 2606 OID 32882)
-- Name: trip trip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_pkey PRIMARY KEY (trip_id);


--
-- TOC entry 4736 (class 2606 OID 32843)
-- Name: weather weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather
    ADD CONSTRAINT weather_pkey PRIMARY KEY (weather_id);


--
-- TOC entry 4747 (class 2606 OID 32832)
-- Name: license license_hvfhs_license_num_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license
    ADD CONSTRAINT license_hvfhs_license_num_fkey FOREIGN KEY (hvfhs_license_num) REFERENCES public.hvfhs_license(hvfhs_license_num);


--
-- TOC entry 4748 (class 2606 OID 32903)
-- Name: trip trip_datetime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_datetime_id_fkey FOREIGN KEY (datetime_id) REFERENCES public.datetime_dim(datetime_id);


--
-- TOC entry 4749 (class 2606 OID 32893)
-- Name: trip trip_dolocationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_dolocationid_fkey FOREIGN KEY (dolocationid) REFERENCES public.dropoff_location(dolocationid);


--
-- TOC entry 4750 (class 2606 OID 32883)
-- Name: trip trip_license_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_license_id_fkey FOREIGN KEY (license_id) REFERENCES public.license(license_id);


--
-- TOC entry 4751 (class 2606 OID 32888)
-- Name: trip trip_pulocationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_pulocationid_fkey FOREIGN KEY (pulocationid) REFERENCES public.pickup_location(pulocationid);


--
-- TOC entry 4752 (class 2606 OID 32908)
-- Name: trip trip_trip_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_trip_status_id_fkey FOREIGN KEY (trip_status_id) REFERENCES public.trip_flag(trip_status_id);


--
-- TOC entry 4753 (class 2606 OID 32898)
-- Name: trip trip_weather_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_weather_id_fkey FOREIGN KEY (weather_id) REFERENCES public.weather(weather_id);


-- Completed on 2024-03-18 20:47:55

--
-- PostgreSQL database dump complete
--

