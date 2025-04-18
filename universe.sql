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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    light_years integer,
    galaxy_size numeric
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
    moon_type character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    moon_color character varying(30)
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
-- Name: moon_planet_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_planet_star (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.moon_planet_star OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    is_life boolean DEFAULT false
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
    star_type character varying(30),
    name character varying(30) NOT NULL,
    galaxy_id integer,
    star_color text NOT NULL,
    star_size integer
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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Irregular galaxy', 'chaotic', 20000, 22000);
INSERT INTO public.galaxy VALUES (2, 'Elliptical galaxy', 'old', 300000, 351500);
INSERT INTO public.galaxy VALUES (3, 'Spiral galaxy', 'flat', 100000, 105000);
INSERT INTO public.galaxy VALUES (4, 'Barred galaxy', 'linked', 110000, 105000);
INSERT INTO public.galaxy VALUES (5, 'Lencticular galaxy', 'central', 50000, 55000);
INSERT INTO public.galaxy VALUES (6, 'Peculiar galaxy', 'unique', 55000, 60000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Full Moon', 'allTaken', NULL, 'silver');
INSERT INTO public.moon VALUES (2, 'New Moon', 'invisible', NULL, 'no color');
INSERT INTO public.moon VALUES (3, 'Wax Crescent Moon', 'bright', 13, 'pale white');
INSERT INTO public.moon VALUES (4, 'First Quarter Moon', 'half', 13, 'Bright-White');
INSERT INTO public.moon VALUES (5, 'Waxing Gibbous Moon', 'Just', 15, 'Bright-white');
INSERT INTO public.moon VALUES (6, 'Waning Gibbous Moon', 'decreased', 15, 'Bright-white');
INSERT INTO public.moon VALUES (7, 'Third Quarter', 'quarter', 14, 'Bright-white');
INSERT INTO public.moon VALUES (8, 'Waning Crescent Moon', 'remaining', 14, 'Pale-white');
INSERT INTO public.moon VALUES (9, 'SuperMoon', 'earth', NULL, 'Bright-white');
INSERT INTO public.moon VALUES (10, 'Blue Moon', 'second', NULL, 'Silver');
INSERT INTO public.moon VALUES (11, 'Blood Moon', 'likeRed', NULL, 'Reddish-Orange');
INSERT INTO public.moon VALUES (12, 'Harvest Moon', 'equinox', NULL, 'golden');
INSERT INTO public.moon VALUES (13, 'Hunters Moon', 'next harvest', NULL, 'Orange-Blue');
INSERT INTO public.moon VALUES (14, 'Pink Moon', 'flowers', NULL, 'pink');
INSERT INTO public.moon VALUES (15, 'Snow Moon', 'winter', NULL, 'pink');
INSERT INTO public.moon VALUES (16, 'Wolf Moon', 'january', NULL, 'Pale-Red');
INSERT INTO public.moon VALUES (17, 'Cold Moon', 'december', NULL, 'pale-red');
INSERT INTO public.moon VALUES (18, 'Strawberry Moon', 'strawberry', NULL, 'pale-red');
INSERT INTO public.moon VALUES (19, 'Buck Moon', 'july', NULL, 'Bright-White');
INSERT INTO public.moon VALUES (20, 'Sturgeon Moon', 'august', NULL, 'pale-red');


--
-- Data for Name: moon_planet_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_planet_star VALUES (1, 13, 4);
INSERT INTO public.moon_planet_star VALUES (2, 14, 4);
INSERT INTO public.moon_planet_star VALUES (3, 15, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Terrestrial', 'Earth', 4, true);
INSERT INTO public.planet VALUES (14, 'Terrestrial', 'Mars', 4, false);
INSERT INTO public.planet VALUES (15, 'Gas Giant', 'Jupiter', 5, false);
INSERT INTO public.planet VALUES (16, 'Gas Giant', 'Saturn', 5, false);
INSERT INTO public.planet VALUES (17, 'Ice Giant', 'Uranus', 6, false);
INSERT INTO public.planet VALUES (18, 'Ice Giant', 'Neptune', 6, false);
INSERT INTO public.planet VALUES (19, 'Dwarf Planet', 'Pluto', NULL, false);
INSERT INTO public.planet VALUES (20, 'Super-Earth', 'Kepler-452b', 2, true);
INSERT INTO public.planet VALUES (21, 'Mini-Neptune', 'K2-18b', 3, false);
INSERT INTO public.planet VALUES (22, 'Ocean Planet', 'Kepler-22b', 1, false);
INSERT INTO public.planet VALUES (23, 'Rogue Planet', 'PSO J318.5-22', NULL, false);
INSERT INTO public.planet VALUES (24, 'Circumbinary', 'Kepler-16b', NULL, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Main sequence star', 'stable', 4, 'yellow', 12000);
INSERT INTO public.star VALUES (2, 'Red giant star', 'Ancient', 2, 'orange', 1000000000);
INSERT INTO public.star VALUES (3, 'White dwarf star', 'sunny', 5, 'bluish-white', 12000);
INSERT INTO public.star VALUES (4, 'Neutron star', 'supernova', 1, 'not visible', 20);
INSERT INTO public.star VALUES (5, 'Supergiant star', 'huge', 1, 'orange', 2000000000);
INSERT INTO public.star VALUES (6, 'Brown dwarf', 'failed star', 3, 'brownish', 100000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: moon_planet_star moon_planet_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet_star
    ADD CONSTRAINT moon_planet_star_pkey PRIMARY KEY (moon_id, planet_id, star_id);


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
-- Name: moon_planet_star moon_planet_star_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet_star
    ADD CONSTRAINT moon_planet_star_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon_planet_star moon_planet_star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet_star
    ADD CONSTRAINT moon_planet_star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon_planet_star moon_planet_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet_star
    ADD CONSTRAINT moon_planet_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

