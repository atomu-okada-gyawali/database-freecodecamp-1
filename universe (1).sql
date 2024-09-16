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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(6,2),
    description text NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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
    age_in_millions_of_years integer,
    distance_from_earth numeric(6,2),
    description text NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer NOT NULL
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
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer DEFAULT nextval('public.planet_id_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    planet_types character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(6,2),
    description text NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    star_id integer NOT NULL
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
    age_in_millions_of_years integer,
    distance_from_earth numeric(5,2),
    description text NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0.00, 'The galaxy that contains our Solar System.', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2537.00, 'The nearest major galaxy to the Milky Way.', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 3000.00, 'A member of the Local Group of galaxies.', false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 500, 2300.00, 'A spiral galaxy known for its interacting companion.', false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 9000, 2900.00, 'A spiral galaxy with a bright nucleus and a large central bulge.', false, true);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 500, 5000.00, 'A ring galaxy located about 500 million light-years away.', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 5, 0.38, 'Earths only natural satellite, also known as the Moon.', false, true, 15);
INSERT INTO public.moon VALUES (2, 'Phobos', 0, 0.00, 'One of Mars two moons, known for its irregular shape.', false, true, 16);
INSERT INTO public.moon VALUES (3, 'Deimos', 0, 0.00, 'The smaller of Mars two moons.', false, true, 16);
INSERT INTO public.moon VALUES (4, 'Io', 5, 628.00, 'The most geologically active body in the Solar System.', false, true, 17);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 628.00, 'Known for its smooth ice-covered surface and potential subsurface ocean.', false, true, 17);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 628.00, 'The largest moon in the Solar System.', false, true, 17);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 628.00, 'The most heavily cratered object in the Solar System.', false, true, 17);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 1275.00, 'The largest moon of Saturn, known for its thick atmosphere.', false, true, 18);
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 1275.00, 'The second-largest moon of Saturn.', false, true, 18);
INSERT INTO public.moon VALUES (10, 'Titania', 5, 2725.00, 'The largest moon of Uranus.', false, true, 19);
INSERT INTO public.moon VALUES (11, 'Oberon', 5, 2725.00, 'The second-largest moon of Uranus.', false, true, 19);
INSERT INTO public.moon VALUES (12, 'Triton', 5, 4300.00, 'The largest moon of Neptune, known for its retrograde orbit.', false, true, 20);
INSERT INTO public.moon VALUES (13, 'Proteus', 5, 4300.00, 'One of Neptunes irregularly shaped moons.', false, true, 20);
INSERT INTO public.moon VALUES (14, 'Charon', 5, 0.00, 'The largest moon of Pluto, almost half the size of Pluto itself.', false, true, 21);
INSERT INTO public.moon VALUES (15, 'Keplerian', 5, 40.00, 'Hypothetical moon of Kepler-22b.', false, true, 22);
INSERT INTO public.moon VALUES (16, 'Proxima I', 5, 25.00, 'Hypothetical moon of Proxima b.', false, true, 23);
INSERT INTO public.moon VALUES (17, 'Gliese I', 5, 30.00, 'Hypothetical moon of Gliese 581g.', false, true, 24);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 'Terrestrial', 4500, 57.91, 'Smallest planet and closest to the Sun.', false, true, 1);
INSERT INTO public.planet VALUES (14, 'Venus', 'Terrestrial', 4500, 108.20, 'Hottest planet in the Solar System.', false, true, 1);
INSERT INTO public.planet VALUES (15, 'Earth', 'Terrestrial', 4500, 0.00, 'The only planet known to support life.', true, true, 1);
INSERT INTO public.planet VALUES (16, 'Mars', 'Terrestrial', 4500, 227.90, 'Known as the Red Planet.', false, true, 1);
INSERT INTO public.planet VALUES (17, 'Jupiter', 'Gas Giant', 4500, 778.50, 'The largest planet in the Solar System.', false, true, 1);
INSERT INTO public.planet VALUES (18, 'Saturn', 'Gas Giant', 4500, 142.90, 'Famous for its ring system.', false, true, 2);
INSERT INTO public.planet VALUES (19, 'Uranus', 'Ice Giant', 4500, 287.10, 'Rotates on its side.', false, true, 3);
INSERT INTO public.planet VALUES (20, 'Neptune', 'Ice Giant', 4500, 449.70, 'Known for its intense blue color.', false, true, 3);
INSERT INTO public.planet VALUES (21, 'Pluto', 'Dwarf Planet', 4500, 590.60, 'Formerly the ninth planet, now classified as a dwarf planet.', false, true, 4);
INSERT INTO public.planet VALUES (22, 'Kepler-22b', 'Exoplanet', 4500, 60.00, 'An exoplanet in the habitable zone of a Sun-like star.', false, true, 5);
INSERT INTO public.planet VALUES (23, 'Proxima b', 'Exoplanet', 4500, 4.25, 'An exoplanet orbiting the star Proxima Centauri.', false, true, 6);
INSERT INTO public.planet VALUES (24, 'Gliese 581g', 'Exoplanet', 4500, 20.30, 'A potentially habitable exoplanet.', false, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 150, 8.60, 'The brightest star in the night sky.', false, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 100, 642.50, 'A red supergiant star in the Orion constellation.', false, true, 2);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4, 4.25, 'The closest known star to the Sun.', false, true, 3);
INSERT INTO public.star VALUES (4, 'Vega', 455, 25.04, 'A blue-white star in the constellation Lyra.', false, true, 4);
INSERT INTO public.star VALUES (5, 'Altair', 1, 16.73, 'A bright star in the constellation Aquila.', false, true, 5);
INSERT INTO public.star VALUES (6, 'Antares', 550, 550.00, 'A red supergiant star in the constellation Scorpius.', false, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 17, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


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

