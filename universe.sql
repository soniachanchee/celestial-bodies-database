--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    orbit_type text NOT NULL,
    speed_kms numeric NOT NULL,
    is_periodic boolean NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_type character varying(20) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    radius integer NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_planet numeric NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    radius integer NOT NULL,
    has_life boolean NOT NULL,
    distance_from_star numeric NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Elliptical', 70.56, true, 'Visible from Earth every 75-76 years.');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Hyperbolic', 44.25, false, 'Exceptionally bright comet observed in 1997.');
INSERT INTO public.comet VALUES (3, 'Shoemaker-Levy 9', 'Jovian', 60.00, false, 'Collided with Jupiter in 1994.');
INSERT INTO public.comet VALUES (4, 'Encke', 'Elliptical', 65.00, true, 'Shortest periodic comet with a 3.3-year orbit.');
INSERT INTO public.comet VALUES (5, 'Hyakutake', 'Elliptical', 53.00, false, 'Passed close to Earth in 1996.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy to the Milky Way', 'Spiral', 10000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small neighboring galaxy to Andromeda', 'Spiral', 13000, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', 'Irregular', 10000, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Another satellite galaxy of the Milky Way', 'Irregular', 7000, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Galaxy known for its sombrero-like appearance', 'Elliptical', 9000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, true, 0.384);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, true, 0.009);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, true, 0.023);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, true, 0.421);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1561, true, 0.671);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, true, 1.07);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, true, 1.882);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, true, 1.222);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252, true, 0.238);
INSERT INTO public.moon VALUES (10, 'Triton', 8, 1353, true, 0.354);
INSERT INTO public.moon VALUES (11, 'Proxima Moon', 9, 300, true, 0.1);
INSERT INTO public.moon VALUES (12, 'Rigel Moon 1', 10, 500, true, 0.5);
INSERT INTO public.moon VALUES (13, 'Rigel Moon 2', 10, 300, false, 1.5);
INSERT INTO public.moon VALUES (14, 'Alpha Centauri Moon', 11, 400, true, 0.2);
INSERT INTO public.moon VALUES (15, 'Sirius Moon', 12, 600, true, 1.0);
INSERT INTO public.moon VALUES (16, 'Mimas', 6, 198, true, 0.185);
INSERT INTO public.moon VALUES (17, 'Tethys', 6, 531, true, 0.295);
INSERT INTO public.moon VALUES (18, 'Dione', 6, 561, true, 0.377);
INSERT INTO public.moon VALUES (19, 'Rhea', 6, 764, true, 0.527);
INSERT INTO public.moon VALUES (20, 'Iapetus', 6, 735, true, 3.561);
INSERT INTO public.moon VALUES (21, 'Nereid', 8, 170, true, 5.513);
INSERT INTO public.moon VALUES (22, 'Charon', 9, 606, true, 0.195);
INSERT INTO public.moon VALUES (23, 'Nix', 9, 49, true, 0.048);
INSERT INTO public.moon VALUES (24, 'Hydra', 9, 42, true, 0.064);
INSERT INTO public.moon VALUES (25, 'Kerberos', 9, 19, true, 0.058);
INSERT INTO public.moon VALUES (26, 'Styx', 9, 8, true, 0.047);
INSERT INTO public.moon VALUES (27, 'Europa 2', 5, 1400, true, 0.8);
INSERT INTO public.moon VALUES (28, 'Callisto 2', 5, 2600, true, 1.9);
INSERT INTO public.moon VALUES (29, 'Ganymede 2', 5, 2640, true, 1.1);
INSERT INTO public.moon VALUES (30, 'Enceladus 2', 6, 300, true, 0.239);
INSERT INTO public.moon VALUES (31, 'Titania', 7, 789, true, 0.44);
INSERT INTO public.moon VALUES (32, 'Oberon', 7, 761, true, 0.59);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, true, 149.6);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3390, false, 227.9);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 6051, false, 108.2);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 2440, false, 57.9);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69911, false, 778.3);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58232, false, 1427);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 25362, false, 2871);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 24622, false, 4495);
INSERT INTO public.planet VALUES (9, 'Proxima b', 5, 6000, false, 0.05);
INSERT INTO public.planet VALUES (10, 'Rigel b', 4, 8000, false, 350);
INSERT INTO public.planet VALUES (11, 'Alpha Centauri Bb', 2, 6000, false, 0.04);
INSERT INTO public.planet VALUES (12, 'Sirius b', 6, 8000, false, 2.5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1989000000000000000000000000000, true, 4600);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 2188000000000000000000000000000, true, 5500);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 12000000000000000000000000000000, true, 8000);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 21000000000000000000000000000000, true, 7000);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 244600000000000000000000000000, true, 4700);
INSERT INTO public.star VALUES (6, 'Sirius', 2, 3972000000000000000000000000000, true, 250);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 32, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

