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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(30)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_twin_galaxy boolean,
    number_of_planets integer,
    star_id integer,
    description character varying(30)
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
    name character varying(30) NOT NULL,
    planet_id integer,
    description character varying(30),
    type text
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
    name character varying(30) NOT NULL,
    constellation_id integer,
    star_id integer,
    number_of_moons integer,
    distance_from_sun numeric,
    moon_id integer,
    description character varying(30)
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    is_round boolean,
    planet_id integer,
    description character varying(30)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Canis Major', NULL);
INSERT INTO public.constellation VALUES (2, 'Aquila', NULL);
INSERT INTO public.constellation VALUES (3, 'Vega', NULL);
INSERT INTO public.constellation VALUES (4, 'Piscis Austrinus', NULL);
INSERT INTO public.constellation VALUES (5, 'Leo', NULL);
INSERT INTO public.constellation VALUES (6, 'Capricornus', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Backward', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Bear Paw', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Antennae', true, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'Butterfly', true, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (30, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (31, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (32, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (33, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (34, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (35, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (36, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (37, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (38, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (39, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (40, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (41, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (42, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (43, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (44, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (45, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (46, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (47, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (48, 'phobos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (49, 'phobos', 1, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Sirius', 1, 6, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Altair', 2, 6, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Vega', 3, 6, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Fomalhaut', 4, 6, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Denebola', 5, 6, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Delta Capricorni', 6, 6, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (15, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (16, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (17, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (18, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (19, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (20, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (21, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (22, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (23, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (24, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (25, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (26, 'Unknown', 7, 7, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (6, 'big', 1, true, NULL, NULL);
INSERT INTO public.star VALUES (7, 'small', 1, true, NULL, NULL);
INSERT INTO public.star VALUES (8, 'red', 1, true, NULL, NULL);
INSERT INTO public.star VALUES (9, 'blue', 2, true, NULL, NULL);
INSERT INTO public.star VALUES (12, 'green', 2, true, NULL, NULL);
INSERT INTO public.star VALUES (13, 'yellow', 2, true, NULL, NULL);
INSERT INTO public.star VALUES (14, 'mediumsmall', 2, true, NULL, NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 49, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 26, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: constellation constellation_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_description_key UNIQUE (description);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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
-- Name: star fk_belongs_to_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_belongs_to_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

