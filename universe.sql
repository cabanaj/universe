--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(100) NOT NULL,
    distance_from_earth integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth integer,
    mass_in_trillion_solar_masses integer,
    age_in_millions_of_years numeric(4,1),
    habitable boolean,
    has_life boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth integer,
    mass integer,
    age_in_millions_of_years numeric(3,1),
    habitable boolean,
    has_life boolean,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth integer,
    mass integer,
    age_in_millions_of_years numeric(4,1),
    habitable boolean,
    has_life boolean,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth integer,
    mass integer,
    age_in_millions_of_years numeric(3,1),
    description text,
    galaxy_id integer,
    variable boolean,
    binary_system boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1);
INSERT INTO public.comet VALUES (3, 'NEOWISE', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 1, 13.2, false, false, 'The Mily Way is a barred spiral galaxy containing billions of stars, including our Solar System. It is part of the Local Group of galaxies');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2, 1, 10.0, false, false, 'The Andromeda Galaxy is a spiral galaxy located in the constellation of Andromeda. It is the closest spiral galaxy to the Milky Way and is on a collision course with our galaxy.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 3, 40, 5.0, false, false, 'The Triangulum Galaxy is a spiral galaxy located in the constellation of Triangulum. It is the third-largest galaxy in the Local Group, after the Milky Way and Adromeda.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 28, 800, 10.0, false, false, 'The  Sombrero Galaxy is a spiral galaxy located in the constellation of Virgo. It is notable for its prominent dust lane, which gives it a hat-like appearance.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 23, 160, 10.0, false, false, 'The Whirlpool Galaxy is a spiral galaxy located in the constellation of Canes Venatici. It is famous for its interacting spiral arms and the companion galaxy, NGC 5195.');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 500, 100, 500.0, false, false, 'The Cartwheel Galaxy is a lenticular galaxy located in the constellation of Sculptor. It is known for its unique shape caused by a collision with a smaller galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Io', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Europa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Rhea', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Dione', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Tethys', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Mimas', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Iapetus', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Oberon', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Titania', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Miranda', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Triton', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Charon', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Nereid', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 77, 0, 450.0, false, false, 'Mercury is the closest planet to the Sun and the smallest planet in our solar system. It is a rocky planet with a heavily cratered surface.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 38, 0, 450.0, false, false, 'Venus is the second planet from the Sun and is often reffered to as Earth''s "sister planet" due to its similar size and compositions. It has a thick atmosphere and a surface covered in volcanic plains and mountains.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 0, 1, 450.0, true, true, 'Earth is the third planet from the Sun and the only known planet to support life. It has a diverse range of ecosystems and is home to millions of species, including humans.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 54, 0, 450.0, false, NULL, 'Mars is the fourth planet from the Sun and is often called the "Red Planet" due to its reddish appearance. It has polar ice caps, a thin atmosphere, and features that suggest the presence of liquid water in the past.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 588, 318, 450.0, false, NULL, 'Jupiter is the largest planet in our solar system and is knwon for its massive size and distinctive bands of clouds. It is a gas giant with no solid surface.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 1200, 95, 450.0, false, NULL, 'Saturn is the sixth planet from the Sun and is recognized by its iconic rings. It is a gas giant similar in composition to Jupiter.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 2800, 14, 450.0, false, NULL, 'Uranus is the seventh planet from the Sun and is known for its unique feature of being titled on its side. It is an ice giant and has a blue-green coloration.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4300, 17, 450.0, false, NULL, 'Neptune is the eight and farthest known planet from the Sun. It is an ice giant similar to Uranus and is characterized by its deep blue color.', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 7500, 0, 450.0, false, NULL, 'Pluto is a dwarf planet and was formerly considered the ninth planet in our solar system. It is composed mainly of rock and ice and has a highly elliptical orbit.', 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 492, NULL, NULL, true, NULL, 'Kepler-186f is an exoplanet orbiting the red dwarf star Kepler-186. It is located in the habitable zone and is considered one of the most Earth-like exoplanets discovered so far.', 7);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 4, NULL, NULL, true, NULL, 'Proxima Centauri b is an exoplanet orbiting the red dwarf star Proxima Centauri, which is the closest known star to our solar system. It is located in the habitable zone and has drawn interest inn the search for extraterrestrial life', 3);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 39, NULL, NULL, true, NULL, 'TRAPPIST-1e is one of the seven Earth-sized exoplanets orbiting the ultra-cool dwarf star TRAPPIST-1. It is located within the star''s habitable zone and has been the subject of study in the search for potentially habitable worlds.', 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 1, 4.6, 'The Sun is a G-type main-sequence star and the central star of our Solar System.', 1, false, false);
INSERT INTO public.star VALUES (2, 'Sirius', 8, 2, 20.0, 'Sirius is a binary star system of a white main-sequence star, Sirius A, and a faint white dwarf companion, Sirius B.', 1, true, true);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4, 0, 4.9, 'Proxima Centauri is a red dwarf star, and it is the closest known star to our Solar System.', 1, true, false);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 642, 11, 10.0, 'Betelgeuse is a red supergiant star and one of the largest known stars in the galaxy.', 1, true, false);
INSERT INTO public.star VALUES (5, 'Vega', 25, 2, 45.0, 'Vega is a bright star in the constellation Lyra and is one of the most luminous stars in the neighborhood of the Sun.', 1, false, false);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 4, 1, 60.0, 'Alpha Centauri A is the larger and brighter component of the Alpha Centauri binary star system.', 1, false, true);
INSERT INTO public.star VALUES (7, 'Kepler-186', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (8, 'TRAPPIST-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Name: comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_host_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_host_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon fk_parent_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_parent_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--