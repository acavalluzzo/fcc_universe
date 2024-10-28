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
    name character varying(50) NOT NULL,
    description text,
    diameter_ly integer,
    galaxy_type character varying(30)
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
    order_discovered integer,
    planet_id integer NOT NULL,
    description character varying(100)
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
    description text,
    visited boolean,
    has_life boolean,
    order_from_star integer NOT NULL,
    planet_type_id integer NOT NULL,
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    constellation character varying(50),
    distance_from_earth_ly numeric(13,8),
    star_type_id integer,
    galaxy_id integer
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(10) NOT NULL,
    min_temp_kelvin integer,
    max_temp_kelvin integer
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'home galaxy of earth', 87400, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 'Ursa Major III', 'satellite galaxy of milky way', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Draco II', 'satellite galaxy of milky way', 120, NULL);
INSERT INTO public.galaxy VALUES (4, 'Tucana III', 'satellite galaxy of milky way that is being tidally disrupted', 220, NULL);
INSERT INTO public.galaxy VALUES (5, 'Segue 1', 'satellite galaxy of milky way', NULL, 'dSph or Glob Clus');
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf Sphr SagDEG', 'satellite galaxy of milky way, partial accretion of Milky Way', 10000, 'dSph/E7');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 3, 'Our Moon - theres a moon in the sky and its called the moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 4, '');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 4, '');
INSERT INTO public.moon VALUES (4, 'Titan', 1, 6, '');
INSERT INTO public.moon VALUES (5, 'Rhea', 2, 6, '');
INSERT INTO public.moon VALUES (6, 'Iapetus', 3, 6, '');
INSERT INTO public.moon VALUES (7, 'Dione', 4, 6, '');
INSERT INTO public.moon VALUES (8, 'Tethys', 5, 6, '');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 6, '');
INSERT INTO public.moon VALUES (10, 'Mimas', 7, 6, '');
INSERT INTO public.moon VALUES (11, 'Ganymede', 3, 5, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (12, 'Io', 1, 5, '');
INSERT INTO public.moon VALUES (13, 'Europa', 2, 5, '');
INSERT INTO public.moon VALUES (14, 'Callisto', 4, 5, '');
INSERT INTO public.moon VALUES (15, 'Amalthea', 5, 5, '');
INSERT INTO public.moon VALUES (16, 'Himalia', 6, 5, '');
INSERT INTO public.moon VALUES (17, 'Elara', 7, 5, '');
INSERT INTO public.moon VALUES (18, 'Pasiphae', 8, 5, '');
INSERT INTO public.moon VALUES (19, 'Sinope', 9, 5, '');
INSERT INTO public.moon VALUES (20, 'Lysithea', 10, 5, '');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', '', true, false, 1, 18, 1);
INSERT INTO public.planet VALUES (2, 'Venus', '', true, false, 2, 18, 1);
INSERT INTO public.planet VALUES (3, 'Earth', '', true, true, 3, 18, 1);
INSERT INTO public.planet VALUES (4, 'Mars', '', true, false, 4, 18, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', '', true, false, 5, 6, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', '', true, false, 6, 6, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', '', true, false, 7, 9, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', '', true, false, 8, 9, 1);
INSERT INTO public.planet VALUES (9, '51 Pegasi b', 'Also called Bellerephon or 51 Peg b', false, false, 1, 6, 7);
INSERT INTO public.planet VALUES (10, '47 Ursae Majoris b', 'Taphau Thong', false, false, 1, 6, 8);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', '', false, false, 1, 18, 2);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri c', 'May be a mini gas planet or a super-terran. this is still unknown', false, false, 2, 5, 2);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri d', 'Mars-sized planet orbiting 4.3 million km from Proxima Centauri', false, false, 3, 18, 2);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Chthonian planet', 'An extrasolar planet that orbits close to its parent star. Most Chthonian planets are expected to be gas giants that had their atmospheres stripped away, leaving their cores.');
INSERT INTO public.planet_type VALUES (2, 'Carbon planet', 'A theoretical terrestrial planet that could form if protoplanetary discs are carbon-rich and oxygen-poor.');
INSERT INTO public.planet_type VALUES (3, 'Coreless planet', 'A theoretical planet that has undergone planetary differentiation but has no metallic core. Not to be confused with the Hollow Earth concept.');
INSERT INTO public.planet_type VALUES (4, 'Desert planet', 'A terrestrial planet with an arid surface consistency similar to Earth deserts. Mars is arguably an example of a desert planet.');
INSERT INTO public.planet_type VALUES (5, 'Gas dwarf', 'A low-mass planet composed primarily of hydrogen and helium.');
INSERT INTO public.planet_type VALUES (6, 'Gas giant', 'A massive planet composed primarily of hydrogen and helium.');
INSERT INTO public.planet_type VALUES (7, 'Helium planet', 'A theoretical planet that may form via mass loss from a low-mass white dwarf. Helium planets are predicted to have roughly the same diameter as hydrogen–helium planets of the same mass.');
INSERT INTO public.planet_type VALUES (8, 'Hycean planet', 'A hypothetical type of habitable planet described as a hot, water-covered planet with a hydrogen-rich atmosphere.');
INSERT INTO public.planet_type VALUES (9, 'Ice giant', 'A giant planet composed mainly of ices—volatile substances heavier than hydrogen and helium, such as water, methane, and ammonia—as opposed to gas (hydrogen and helium).');
INSERT INTO public.planet_type VALUES (10, 'Ice planet', 'A theoretical planet with an icy surface and consists of a global cryosphere.');
INSERT INTO public.planet_type VALUES (11, 'Iron planet', 'A theoretical planet that consists primarily of an iron-rich core with little or no mantle.');
INSERT INTO public.planet_type VALUES (12, 'Lava planet', 'A theoretical terrestrial planet with a surface mostly or entirely covered by molten lava.');
INSERT INTO public.planet_type VALUES (13, 'Ocean planet', 'A theoretical planet which has a substantial fraction of its mass made of water.');
INSERT INTO public.planet_type VALUES (14, 'Protoplanet', 'A large planetary embryo that originates within protoplanetary discs and has undergone internal melting to produce differentiated interiors. Protoplanets are believed to form out of kilometer-sized planetesimals that attract each other gravitationally and collide.');
INSERT INTO public.planet_type VALUES (15, 'Puffy planet', 'A gas giant with a large radius and very low density which is similar to or lower than Saturn.');
INSERT INTO public.planet_type VALUES (16, 'Super-puff', 'A type of exoplanet with a mass only a few times larger than Earth but with a radius larger than that of Neptune, giving it a very low mean density.');
INSERT INTO public.planet_type VALUES (17, 'Silicate planet', 'A terrestrial planet that is composed primarily of silicate rocks. All four inner planets in the Solar System are silicon-based.');
INSERT INTO public.planet_type VALUES (18, 'Terrestrial planet', 'Also known as a telluric planet or rocky planet. A planet that is composed primarily of carbonaceous or silicate rocks or metals.');
INSERT INTO public.planet_type VALUES (19, 'Dwarf planet', '');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', NULL, 0.00001581, 5, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'centaurus', 4.24650000, 7, 1);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 'centaurus', 4.34410000, 5, 1);
INSERT INTO public.star VALUES (4, 'Toliman', 'centaurus', 4.34410000, 6, 1);
INSERT INTO public.star VALUES (5, 'Barnards Star', 'ophiucius', 5.96290000, 7, 1);
INSERT INTO public.star VALUES (6, 'Wolf 359', 'Leo', 7.85580000, 7, 1);
INSERT INTO public.star VALUES (7, '51 Pegasi', 'Pegasus', 50.10000000, 5, 1);
INSERT INTO public.star VALUES (8, '47 Ursae Majoris', 'Ursa Major', 45.30000000, 5, 1);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'O', 33000, NULL);
INSERT INTO public.star_type VALUES (2, 'B', 10000, 33000);
INSERT INTO public.star_type VALUES (3, 'A', 7300, 10000);
INSERT INTO public.star_type VALUES (4, 'F', 6000, 7300);
INSERT INTO public.star_type VALUES (5, 'G', 5300, 6000);
INSERT INTO public.star_type VALUES (6, 'K', 3900, 5300);
INSERT INTO public.star_type VALUES (7, 'M', 2300, 3900);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 7, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_name_key UNIQUE (name);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

