--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ChefToun_horario; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE "ChefToun_horario" (
    id integer NOT NULL,
    "horaInicio" time without time zone NOT NULL,
    "horaFinal" time without time zone NOT NULL
);


ALTER TABLE "ChefToun_horario" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_horario_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE "ChefToun_horario_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ChefToun_horario_id_seq" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_horario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE "ChefToun_horario_id_seq" OWNED BY "ChefToun_horario".id;


--
-- Name: ChefToun_horariotipoplato; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE "ChefToun_horariotipoplato" (
    id integer NOT NULL,
    horario_id integer NOT NULL,
    "tipoPlato_id" integer NOT NULL
);


ALTER TABLE "ChefToun_horariotipoplato" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_horariotipoplato_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE "ChefToun_horariotipoplato_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ChefToun_horariotipoplato_id_seq" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_horariotipoplato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE "ChefToun_horariotipoplato_id_seq" OWNED BY "ChefToun_horariotipoplato".id;


--
-- Name: ChefToun_ingrediente; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE "ChefToun_ingrediente" (
    id integer NOT NULL,
    ingrediente character varying(60) NOT NULL,
    cantidad integer NOT NULL,
    "cantidadInicial" integer NOT NULL,
    "esUnitario" boolean NOT NULL,
    unidades integer NOT NULL,
    ubicacion_id integer NOT NULL,
    icon character varying(200) NOT NULL
);


ALTER TABLE "ChefToun_ingrediente" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_ingrediente_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE "ChefToun_ingrediente_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ChefToun_ingrediente_id_seq" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_ingrediente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE "ChefToun_ingrediente_id_seq" OWNED BY "ChefToun_ingrediente".id;


--
-- Name: ChefToun_ingredienteplato; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE "ChefToun_ingredienteplato" (
    id integer NOT NULL,
    cantidad integer NOT NULL,
    ingrediente_id integer NOT NULL,
    plato_id integer NOT NULL
);


ALTER TABLE "ChefToun_ingredienteplato" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_ingredienteplato_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE "ChefToun_ingredienteplato_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ChefToun_ingredienteplato_id_seq" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_ingredienteplato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE "ChefToun_ingredienteplato_id_seq" OWNED BY "ChefToun_ingredienteplato".id;


--
-- Name: ChefToun_nino; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE "ChefToun_nino" (
    id integer NOT NULL,
    codigo character varying(10) NOT NULL,
    nickname character varying(30) NOT NULL
);


ALTER TABLE "ChefToun_nino" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_nino_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE "ChefToun_nino_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ChefToun_nino_id_seq" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_nino_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE "ChefToun_nino_id_seq" OWNED BY "ChefToun_nino".id;


--
-- Name: ChefToun_plato; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE "ChefToun_plato" (
    id integer NOT NULL,
    nombre character varying(60) NOT NULL,
    foto character varying(120) NOT NULL,
    state boolean NOT NULL,
    "tipoPlato_id" integer NOT NULL
);


ALTER TABLE "ChefToun_plato" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_plato_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE "ChefToun_plato_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ChefToun_plato_id_seq" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_plato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE "ChefToun_plato_id_seq" OWNED BY "ChefToun_plato".id;


--
-- Name: ChefToun_puntaje; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE "ChefToun_puntaje" (
    id integer NOT NULL,
    puntaje integer NOT NULL,
    fecha timestamp with time zone NOT NULL,
    nino_id integer NOT NULL
);


ALTER TABLE "ChefToun_puntaje" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_puntaje_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE "ChefToun_puntaje_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ChefToun_puntaje_id_seq" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_puntaje_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE "ChefToun_puntaje_id_seq" OWNED BY "ChefToun_puntaje".id;


--
-- Name: ChefToun_tipoplato; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE "ChefToun_tipoplato" (
    id integer NOT NULL,
    tipo character varying(30) NOT NULL,
    costo double precision NOT NULL,
    propina double precision NOT NULL,
    state boolean NOT NULL
);


ALTER TABLE "ChefToun_tipoplato" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_tipoplato_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE "ChefToun_tipoplato_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ChefToun_tipoplato_id_seq" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_tipoplato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE "ChefToun_tipoplato_id_seq" OWNED BY "ChefToun_tipoplato".id;


--
-- Name: ChefToun_ubicacion; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE "ChefToun_ubicacion" (
    id integer NOT NULL,
    ubicacion character varying(60) NOT NULL
);


ALTER TABLE "ChefToun_ubicacion" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_ubicacion_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE "ChefToun_ubicacion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ChefToun_ubicacion_id_seq" OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_ubicacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE "ChefToun_ubicacion_id_seq" OWNED BY "ChefToun_ubicacion".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO yamilnunezaguirre;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO yamilnunezaguirre;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO yamilnunezaguirre;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO yamilnunezaguirre;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO yamilnunezaguirre;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO yamilnunezaguirre;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO yamilnunezaguirre;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO yamilnunezaguirre;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO yamilnunezaguirre;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO yamilnunezaguirre;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO yamilnunezaguirre;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO yamilnunezaguirre;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO yamilnunezaguirre;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO yamilnunezaguirre;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO yamilnunezaguirre;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO yamilnunezaguirre;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO yamilnunezaguirre;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: yamilnunezaguirre
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO yamilnunezaguirre;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yamilnunezaguirre
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: yamilnunezaguirre
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO yamilnunezaguirre;

--
-- Name: ChefToun_horario id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_horario" ALTER COLUMN id SET DEFAULT nextval('"ChefToun_horario_id_seq"'::regclass);


--
-- Name: ChefToun_horariotipoplato id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_horariotipoplato" ALTER COLUMN id SET DEFAULT nextval('"ChefToun_horariotipoplato_id_seq"'::regclass);


--
-- Name: ChefToun_ingrediente id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_ingrediente" ALTER COLUMN id SET DEFAULT nextval('"ChefToun_ingrediente_id_seq"'::regclass);


--
-- Name: ChefToun_ingredienteplato id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_ingredienteplato" ALTER COLUMN id SET DEFAULT nextval('"ChefToun_ingredienteplato_id_seq"'::regclass);


--
-- Name: ChefToun_nino id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_nino" ALTER COLUMN id SET DEFAULT nextval('"ChefToun_nino_id_seq"'::regclass);


--
-- Name: ChefToun_plato id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_plato" ALTER COLUMN id SET DEFAULT nextval('"ChefToun_plato_id_seq"'::regclass);


--
-- Name: ChefToun_puntaje id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_puntaje" ALTER COLUMN id SET DEFAULT nextval('"ChefToun_puntaje_id_seq"'::regclass);


--
-- Name: ChefToun_tipoplato id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_tipoplato" ALTER COLUMN id SET DEFAULT nextval('"ChefToun_tipoplato_id_seq"'::regclass);


--
-- Name: ChefToun_ubicacion id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_ubicacion" ALTER COLUMN id SET DEFAULT nextval('"ChefToun_ubicacion_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: ChefToun_horario; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY "ChefToun_horario" (id, "horaInicio", "horaFinal") FROM stdin;
2	11:00:00	12:59:59
3	13:00:00	15:59:59
4	16:00:00	18:59:59
5	19:00:00	23:59:59
6	00:00:00	04:59:59
1	05:00:00	10:59:59
\.


--
-- Name: ChefToun_horario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('"ChefToun_horario_id_seq"', 6, true);


--
-- Data for Name: ChefToun_horariotipoplato; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY "ChefToun_horariotipoplato" (id, horario_id, "tipoPlato_id") FROM stdin;
1	1	5
2	1	4
\.


--
-- Name: ChefToun_horariotipoplato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('"ChefToun_horariotipoplato_id_seq"', 2, true);


--
-- Data for Name: ChefToun_ingrediente; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY "ChefToun_ingrediente" (id, ingrediente, cantidad, "cantidadInicial", "esUnitario", unidades, ubicacion_id, icon) FROM stdin;
36	pan	12	12	t	12	2	pan
37	pescado	5	5	t	5	1	pescado
40	pimiento verde	5	5	t	5	1	pimiento-verde
41	plátano	1	1	t	24	2	platano
42	pollo (piernitas)	8	8	t	8	1	pollo
43	queso	1	1	t	10	1	queso
44	sal	1	1	t	50	2	sal
45	salsa césar	1	1	t	20	1	salsa-cesar
47	sandía	8	8	t	8	1	sandia
48	tomate	15	15	t	15	1	tomate
32	miel	1	1	t	20	2	miel
33	mora	32	32	t	32	1	mora
34	naranja	15	15	t	15	1	naranja
21	frutilla	30	30	t	30	1	frutilla
50	Agua	100	100	t	1	1	agua
7	aceite de oliva	1	1	t	50	2	aceite-oliva
8	aguacate	8	8	t	8	1	aguacate
10	almendra	2	2	t	150	2	almendra
11	arroz	1	1	t	50	2	arroz
12	banano	1	1	t	24	2	banano
13	cereal	2	2	t	22	2	cereal
14	cereza	1	1	t	25	1	cereza
15	coco	10	10	t	10	1	coco
17	dulce de leche	1	1	t	8	1	dulce-leche
18	durazno	5	5	t	5	1	durazno
19	fideo tallarín	3	3	t	6	2	fideo-tallarin
20	fideo tornillo	3	3	t	6	2	fideo-tornillo
22	limón	1	1	t	1000	1	limon
23	helado de vainilla	1	1	t	5	1	helado-vainilla
24	huevo (s)	30	30	t	30	1	huevo
26	leche	5	5	t	20	1	leche
27	lechuga	4	4	t	4	1	lechuga
28	lomos de atún	2	2	t	10	1	lomos-atun
29	manzana	12	12	t	12	1	manzana
30	mayonesa	1	1	t	20	1	mayonesa
31	mermelada	1	1	t	20	1	mermelada
\.


--
-- Name: ChefToun_ingrediente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('"ChefToun_ingrediente_id_seq"', 50, true);


--
-- Data for Name: ChefToun_ingredienteplato; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY "ChefToun_ingredienteplato" (id, cantidad, ingrediente_id, plato_id) FROM stdin;
5	2	29	4
6	2	34	5
7	6	21	6
8	1	47	7
9	1	15	8
12	12	33	11
13	1	27	12
14	1	42	12
15	1	36	12
16	1	43	12
18	10	22	12
19	4	45	12
20	1	20	13
21	1	48	13
23	1	40	13
24	3	28	13
25	4	30	13
26	1	27	14
27	3	48	14
28	5	24	14
29	5	7	14
30	2	44	14
31	1	36	15
32	1	24	15
36	1	29	16
38	1	36	16
40	1	36	17
45	1	19	18
46	2	11	18
47	1	37	18
48	1	41	18
49	1	8	19
50	2	11	19
51	1	42	19
54	2	19	20
55	12	21	21
57	1	14	21
58	3	18	22
60	5	14	22
61	3	21	22
62	4	32	22
64	15	10	23
65	1	23	23
66	2	17	23
67	1	26	9
68	1	50	4
69	1	50	5
70	1	50	6
71	1	50	7
72	1	26	8
73	1	26	11
42	1	31	17
74	1	26	16
43	1	43	18
41	1	43	17
34	1	13	15
10	1	12	9
11	2	18	10
75	1	26	10
\.


--
-- Name: ChefToun_ingredienteplato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('"ChefToun_ingredienteplato_id_seq"', 75, true);


--
-- Data for Name: ChefToun_nino; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY "ChefToun_nino" (id, codigo, nickname) FROM stdin;
1	11111111	politécnico
2	3265	NICKNAME2
3	4265	NICKNAME3
\.


--
-- Name: ChefToun_nino_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('"ChefToun_nino_id_seq"', 3, true);


--
-- Data for Name: ChefToun_plato; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY "ChefToun_plato" (id, nombre, foto, state, "tipoPlato_id") FROM stdin;
4	Jugo de manzana	https://t2.uc.ltmcdn.com/images/9/6/3/img_32369_apa_260746_600.jpg	t	5
5	Jugo de naranja	http://d2yuxur7ng0ejv.cloudfront.net/wp-content/uploads/2014/08/orangejuice-1.jpg	t	5
6	Jugo de Frutilla	http://www.rapa-nui.cl/wp-content/uploads/2015/10/pulpa-de-frutilla.jpg	t	5
7	Jugo de sandía	https://previews.123rf.com/images/serezniy/serezniy1309/serezniy130903016/22322891-Sand-a-fresca-y-un-vaso-de-jugo-de-sa	t	5
8	Batido de Coco	http://www.cafetito.es/100-large_default/batido-coco-loco-moonshakes.jpg	t	5
9	Batido de Banano	https://2.bp.blogspot.com/--Jfsvis5V84/Vuh4nWtydBI/AAAAAAAAKzk/-RR3nNCac7Ad3dF3mY7AMheM64CJhBx3w/s1600/Foto%2B1%2B-%2BBa	t	5
11	Batido de Mora	http://www.linkverde.com/wp-content/uploads/2014/05/batido-moras-resfriados-668x400x80xX-600x337.jpg	t	5
12	Ensalada 1	FOTO 1	t	3
13	Ensalada 2	FOTO 2	t	3
14	Ensalada 3	FOTO 3	t	3
15	Desayuno 1	Dfoto 1	t	4
16	Desayuno 2	Dfoto 2	t	4
17	Desayuno 3	Dfoto 3	t	4
18	PF 1	PFOTO 1	t	2
19	PF 2	PFOTO 2	t	2
20	PF 3	PFOTO 3	t	2
21	Postre 1	POSFOTO 1	t	1
22	Postre 2	POSFOTO 2	t	1
23	Postre 3	POSFOTO 3	t	1
10	Batido de Durazno	http://laguiadelasvitaminas.com/wp-content/uploads/2014/06/licuado-de-durazno.jpg	t	5
\.


--
-- Name: ChefToun_plato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('"ChefToun_plato_id_seq"', 23, true);


--
-- Data for Name: ChefToun_puntaje; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY "ChefToun_puntaje" (id, puntaje, fecha, nino_id) FROM stdin;
1	100	2017-07-06 21:15:17-05	1
3	450	2017-07-17 08:41:44.4054-05	1
4	650	2017-07-17 08:42:35.385082-05	1
5	850	2017-07-17 08:44:01.782667-05	1
7	1050	2017-07-17 09:28:05.898188-05	1
9	650	2017-07-21 17:20:08.465486-05	1
16	5000	2017-07-30 23:45:39-05	1
\.


--
-- Name: ChefToun_puntaje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('"ChefToun_puntaje_id_seq"', 16, true);


--
-- Data for Name: ChefToun_tipoplato; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY "ChefToun_tipoplato" (id, tipo, costo, propina, state) FROM stdin;
3	ENTRADA	100	10	t
4	DESAYUNO	150	15	t
2	PLATO FUERTE	100	10	t
1	POSTRE	50	5	t
5	Bebidas	50	5	t
\.


--
-- Name: ChefToun_tipoplato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('"ChefToun_tipoplato_id_seq"', 5, true);


--
-- Data for Name: ChefToun_ubicacion; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY "ChefToun_ubicacion" (id, ubicacion) FROM stdin;
1	Refrigeradora
2	Anaquel
\.


--
-- Name: ChefToun_ubicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('"ChefToun_ubicacion_id_seq"', 5, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add ingrediente	7	add_ingrediente
20	Can change ingrediente	7	change_ingrediente
21	Can delete ingrediente	7	delete_ingrediente
22	Can add ingrediente plato	8	add_ingredienteplato
23	Can change ingrediente plato	8	change_ingredienteplato
24	Can delete ingrediente plato	8	delete_ingredienteplato
25	Can add nino	9	add_nino
26	Can change nino	9	change_nino
27	Can delete nino	9	delete_nino
28	Can add plato	10	add_plato
29	Can change plato	10	change_plato
30	Can delete plato	10	delete_plato
31	Can add puntaje	11	add_puntaje
32	Can change puntaje	11	change_puntaje
33	Can delete puntaje	11	delete_puntaje
34	Can add tipo plato	12	add_tipoplato
35	Can change tipo plato	12	change_tipoplato
36	Can delete tipo plato	12	delete_tipoplato
37	Can add ubicacion	13	add_ubicacion
38	Can change ubicacion	13	change_ubicacion
39	Can delete ubicacion	13	delete_ubicacion
40	Can add horario	14	add_horario
41	Can change horario	14	change_horario
42	Can delete horario	14	delete_horario
43	Can add horario tipo plato	15	add_horariotipoplato
44	Can change horario tipo plato	15	change_horariotipoplato
45	Can delete horario tipo plato	15	delete_horariotipoplato
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('auth_permission_id_seq', 45, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$tJ50KNTaYl26$MjO554beZQO9qZw+UJpQ4gXS6FgsYRLcnqJf9GdDl9s=	2018-02-28 16:40:57.903388-05	t	admin				t	t	2017-07-06 20:50:07.564603-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-07-06 21:15:03.350691-05	1	Nino object	1	[{"added": {}}]	9	1
2	2017-07-06 21:15:28.769597-05	1	Puntaje object	1	[{"added": {}}]	11	1
3	2017-07-08 14:19:03.527742-05	1	TipoPlato object	1	[{"added": {}}]	12	1
4	2017-07-08 14:19:23.274787-05	2	TipoPlato object	1	[{"added": {}}]	12	1
5	2017-07-08 14:19:48.252113-05	3	TipoPlato object	1	[{"added": {}}]	12	1
6	2017-07-08 14:20:07.672189-05	4	TipoPlato object	1	[{"added": {}}]	12	1
7	2017-07-08 14:20:26.733552-05	5	TipoPlato object	1	[{"added": {}}]	12	1
8	2017-07-08 14:24:21.663043-05	1	Ubicacion object	1	[{"added": {}}]	13	1
9	2017-07-08 14:24:32.458198-05	2	Ubicacion object	1	[{"added": {}}]	13	1
10	2017-07-08 14:24:42.084037-05	3	Ubicacion object	1	[{"added": {}}]	13	1
11	2017-07-08 14:24:53.506883-05	4	Ubicacion object	1	[{"added": {}}]	13	1
12	2017-07-08 14:25:01.634725-05	5	Ubicacion object	1	[{"added": {}}]	13	1
13	2017-07-08 14:25:36.813123-05	5	Ubicacion object	3		13	1
14	2017-07-08 14:25:46.854743-05	4	Ubicacion object	3		13	1
15	2017-07-08 14:25:55.252222-05	3	Ubicacion object	3		13	1
16	2017-07-08 14:28:19.339289-05	1	Ingrediente object	1	[{"added": {}}]	7	1
17	2017-07-08 14:29:17.446999-05	2	Ingrediente object	1	[{"added": {}}]	7	1
18	2017-07-08 14:30:02.348305-05	3	Ingrediente object	1	[{"added": {}}]	7	1
19	2017-07-08 14:30:40.466238-05	4	Ingrediente object	1	[{"added": {}}]	7	1
20	2017-07-08 14:31:25.568698-05	5	Ingrediente object	1	[{"added": {}}]	7	1
21	2017-07-08 14:31:52.343268-05	6	Ingrediente object	1	[{"added": {}}]	7	1
22	2017-07-08 14:33:26.385573-05	1	Plato object	1	[{"added": {}}]	10	1
23	2017-07-08 14:34:03.066003-05	1	IngredientePlato object	1	[{"added": {}}]	8	1
24	2017-07-08 14:35:00.301216-05	2	Plato object	1	[{"added": {}}]	10	1
25	2017-07-08 14:35:28.07203-05	2	IngredientePlato object	1	[{"added": {}}]	8	1
26	2017-07-08 14:48:44.936429-05	1	Plato object	2	[{"changed": {"fields": ["foto"]}}]	10	1
27	2017-07-09 15:45:40.719333-05	1	Plato object	2	[]	10	1
28	2017-07-09 15:46:30.096833-05	2	Plato object	2	[{"changed": {"fields": ["foto"]}}]	10	1
29	2017-07-09 17:20:16.55731-05	1	Horario object	1	[{"added": {}}]	14	1
30	2017-07-09 17:21:07.292238-05	1	TipoPlato object	2	[]	12	1
31	2017-07-09 17:22:48.045901-05	5	TipoPlato object	2	[]	12	1
32	2017-07-09 17:23:31.87662-05	5	TipoPlato object	2	[{"changed": {"fields": ["tipo"]}}]	12	1
33	2017-07-09 17:23:37.498804-05	5	TipoPlato object	2	[]	12	1
34	2017-07-09 17:30:58.115944-05	1	Horario object	2	[]	14	1
35	2017-07-09 17:39:51.60738-05	1	Horario object	2	[]	14	1
36	2017-07-09 17:40:05.341504-05	1	Horario object	2	[{"changed": {"fields": ["horaFinal"]}}]	14	1
37	2017-07-09 17:40:32.59213-05	2	Horario object	1	[{"added": {}}]	14	1
38	2017-07-09 17:41:04.781976-05	3	Horario object	1	[{"added": {}}]	14	1
39	2017-07-09 17:41:31.11157-05	4	Horario object	1	[{"added": {}}]	14	1
40	2017-07-09 17:42:24.213211-05	5	Horario object	1	[{"added": {}}]	14	1
41	2017-07-09 17:42:50.200002-05	6	Horario object	1	[{"added": {}}]	14	1
42	2017-07-09 17:44:31.496007-05	5	TipoPlato object	2	[{"changed": {"fields": ["tipo"]}}]	12	1
43	2017-07-09 17:44:47.369549-05	4	TipoPlato object	2	[{"changed": {"fields": ["tipo"]}}]	12	1
44	2017-07-09 17:45:03.456519-05	3	TipoPlato object	2	[{"changed": {"fields": ["tipo"]}}]	12	1
45	2017-07-09 17:45:14.543331-05	3	TipoPlato object	2	[]	12	1
46	2017-07-09 17:45:26.51369-05	2	TipoPlato object	2	[{"changed": {"fields": ["tipo"]}}]	12	1
47	2017-07-09 17:45:42.880222-05	1	TipoPlato object	2	[{"changed": {"fields": ["tipo"]}}]	12	1
48	2017-07-09 17:46:36.234473-05	5	TipoPlato object	2	[]	12	1
49	2017-07-09 17:46:38.334323-05	1	HorarioTipoPlato object	1	[{"added": {}}]	15	1
50	2017-07-09 18:02:00.286627-05	1	Horario object	2	[]	14	1
51	2017-07-09 18:06:54.964211-05	1	HorarioTipoPlato object	2	[]	15	1
52	2017-07-09 18:08:40.109669-05	3	TipoPlato object	2	[{"changed": {"fields": ["tipo"]}}]	12	1
53	2017-07-09 18:09:00.21455-05	3	TipoPlato object	2	[{"changed": {"fields": ["tipo"]}}]	12	1
54	2017-07-09 18:14:51.681023-05	4	TipoPlato object	2	[]	12	1
55	2017-07-09 18:14:54.401363-05	2	HorarioTipoPlato object	1	[{"added": {}}]	15	1
56	2017-07-10 08:48:27.13686-05	3	aceite de oliva Ensalada 3	1	[{"added": {}}]	8	1
57	2017-07-10 08:50:39.109919-05	5	Bebidas	2	[{"changed": {"fields": ["tipo"]}}]	12	1
58	2017-07-10 08:53:18.651137-05	2	manzana Jugo de manzana	2	[{"changed": {"fields": ["ingrediente"]}}]	8	1
59	2017-07-10 08:53:41.170345-05	1	sal Jugo de manzana	3		8	1
60	2017-07-10 08:54:01.584882-05	4	lechuga Ensalada 3	1	[{"added": {}}]	8	1
61	2017-07-10 08:56:27.181448-05	3	Ensalada 1	1	[{"added": {}}]	10	1
62	2017-07-15 18:50:21.742448-05	6	sal	3		7	1
63	2017-07-15 18:50:29.234511-05	5	aceite de oliva	3		7	1
64	2017-07-15 18:50:38.883308-05	4	huevo	3		7	1
65	2017-07-15 18:50:46.301649-05	3	tomate	3		7	1
66	2017-07-15 18:50:52.418318-05	2	lechuga	3		7	1
67	2017-07-15 18:52:55.211993-05	7	aceite de oliva	1	[{"added": {}}]	7	1
68	2017-07-15 18:53:38.119995-05	8	aguacate	1	[{"added": {}}]	7	1
69	2017-07-15 18:54:25.116088-05	9	albondiga	1	[{"added": {}}]	7	1
70	2017-07-15 18:55:35.524052-05	10	almendra	1	[{"added": {}}]	7	1
71	2017-07-15 18:56:15.014136-05	11	arroz	1	[{"added": {}}]	7	1
72	2017-07-15 18:56:45.548398-05	12	banano	1	[{"added": {}}]	7	1
73	2017-07-15 18:57:10.004213-05	13	cereal	1	[{"added": {}}]	7	1
74	2017-07-15 18:57:49.614634-05	14	cereza	1	[{"added": {}}]	7	1
75	2017-07-15 19:00:23.750507-05	15	coco	1	[{"added": {}}]	7	1
76	2017-07-15 19:00:50.475822-05	16	crema chantilly	1	[{"added": {}}]	7	1
77	2017-07-15 19:01:27.868051-05	17	dulce de leche	1	[{"added": {}}]	7	1
78	2017-07-15 19:02:03.917273-05	18	durazno	1	[{"added": {}}]	7	1
79	2017-07-15 19:02:41.344013-05	19	fideo tallarín	1	[{"added": {}}]	7	1
80	2017-07-15 19:03:05.360681-05	20	fideo tornillo	1	[{"added": {}}]	7	1
81	2017-07-15 19:03:33.552669-05	21	frutilla	1	[{"added": {}}]	7	1
82	2017-07-15 19:04:00.553208-05	22	limón	1	[{"added": {}}]	7	1
83	2017-07-15 19:04:31.629721-05	23	helado de vainilla	1	[{"added": {}}]	7	1
84	2017-07-15 19:05:14.322526-05	24	huevo (s)	1	[{"added": {}}]	7	1
85	2017-07-15 19:05:39.37935-05	25	kiwi	1	[{"added": {}}]	7	1
86	2017-07-15 19:09:38.081281-05	26	leche	1	[{"added": {}}]	7	1
87	2017-07-15 19:10:00.059665-05	27	lechuga	1	[{"added": {}}]	7	1
88	2017-07-15 19:10:30.126333-05	28	lomos de atún	1	[{"added": {}}]	7	1
89	2017-07-15 19:11:02.148578-05	1	manzana	3		7	1
90	2017-07-15 19:11:24.335909-05	29	manzana	1	[{"added": {}}]	7	1
91	2017-07-15 19:12:01.528411-05	30	mayonesa	1	[{"added": {}}]	7	1
92	2017-07-15 19:12:24.418601-05	31	mermelada	1	[{"added": {}}]	7	1
93	2017-07-15 19:12:53.325887-05	32	miel	1	[{"added": {}}]	7	1
94	2017-07-15 19:13:13.28353-05	33	mora	1	[{"added": {}}]	7	1
95	2017-07-15 19:13:38.379327-05	34	naranja	1	[{"added": {}}]	7	1
96	2017-07-15 19:14:02.714157-05	35	nuez	1	[{"added": {}}]	7	1
97	2017-07-15 19:14:29.47261-05	36	pan	1	[{"added": {}}]	7	1
98	2017-07-15 19:14:54.91679-05	37	pescado	1	[{"added": {}}]	7	1
99	2017-07-15 19:15:16.56872-05	37	pescado	2	[{"changed": {"fields": ["ubicacion"]}}]	7	1
100	2017-07-15 19:15:49.791858-05	38	pimienta	1	[{"added": {}}]	7	1
101	2017-07-15 19:16:16.391412-05	39	pimiento rojo	1	[{"added": {}}]	7	1
102	2017-07-15 19:16:38.123834-05	40	pimiento verde	1	[{"added": {}}]	7	1
103	2017-07-15 19:17:09.151897-05	41	plátano	1	[{"added": {}}]	7	1
104	2017-07-15 19:17:35.365538-05	42	pollo (piernitas)	1	[{"added": {}}]	7	1
105	2017-07-15 19:18:19.36134-05	43	queso	1	[{"added": {}}]	7	1
106	2017-07-15 19:18:41.914806-05	44	sal	1	[{"added": {}}]	7	1
107	2017-07-15 19:19:04.739941-05	45	salsa césar	1	[{"added": {}}]	7	1
108	2017-07-15 19:19:23.923395-05	46	salsa de tomate	1	[{"added": {}}]	7	1
109	2017-07-15 19:19:51.458819-05	47	sandía	1	[{"added": {}}]	7	1
110	2017-07-15 19:20:20.179158-05	48	tomate	1	[{"added": {}}]	7	1
111	2017-07-15 19:20:48.239308-05	49	uva	1	[{"added": {}}]	7	1
112	2017-07-15 19:21:29.403912-05	7	aceite de oliva	2	[]	7	1
113	2017-07-15 19:22:42.57266-05	10	almendra	2	[{"changed": {"fields": ["cantidad"]}}]	7	1
114	2017-07-15 19:23:00.577966-05	11	arroz	2	[{"changed": {"fields": ["cantidad"]}}]	7	1
115	2017-07-15 19:23:14.328734-05	12	banano	2	[{"changed": {"fields": ["cantidad"]}}]	7	1
116	2017-07-15 19:23:26.66802-05	13	cereal	2	[{"changed": {"fields": ["cantidad"]}}]	7	1
117	2017-07-15 19:23:37.747088-05	14	cereza	2	[{"changed": {"fields": ["cantidad"]}}]	7	1
118	2017-07-15 19:23:48.533643-05	15	coco	2	[]	7	1
119	2017-07-15 19:24:01.681496-05	16	crema chantilly	2	[{"changed": {"fields": ["cantidad"]}}]	7	1
120	2017-07-15 19:24:15.341901-05	17	dulce de leche	2	[{"changed": {"fields": ["cantidad"]}}]	7	1
121	2017-07-15 19:24:28.414247-05	18	durazno	2	[]	7	1
122	2017-07-15 19:24:41.580922-05	19	fideo tallarín	2	[{"changed": {"fields": ["cantidad"]}}]	7	1
123	2017-07-15 19:24:54.30243-05	20	fideo tornillo	2	[{"changed": {"fields": ["cantidad"]}}]	7	1
124	2017-07-15 19:25:04.23045-05	21	frutilla	2	[]	7	1
125	2017-07-15 19:25:28.345116-05	22	limón	2	[{"changed": {"fields": ["cantidad", "unidades"]}}]	7	1
126	2017-07-15 19:25:46.767324-05	23	helado de vainilla	2	[{"changed": {"fields": ["cantidad", "unidades"]}}]	7	1
127	2017-07-15 19:26:01.408363-05	24	huevo (s)	2	[]	7	1
128	2017-07-15 19:26:09.640354-05	25	kiwi	2	[]	7	1
129	2017-07-15 19:26:27.873845-05	26	leche	2	[{"changed": {"fields": ["cantidad", "unidades"]}}]	7	1
130	2017-07-15 19:26:39.245156-05	27	lechuga	2	[]	7	1
131	2017-07-15 19:26:57.291017-05	28	lomos de atún	2	[{"changed": {"fields": ["cantidad", "unidades"]}}]	7	1
132	2017-07-15 19:27:06.74905-05	29	manzana	2	[]	7	1
133	2017-07-15 19:27:21.623394-05	30	mayonesa	2	[{"changed": {"fields": ["cantidad", "unidades"]}}]	7	1
134	2017-07-15 19:27:38.725612-05	31	mermelada	2	[{"changed": {"fields": ["cantidad", "unidades"]}}]	7	1
135	2017-07-15 19:27:55.136906-05	32	miel	2	[{"changed": {"fields": ["cantidad", "unidades"]}}]	7	1
136	2017-07-15 19:28:05.065975-05	33	mora	2	[]	7	1
137	2017-07-15 19:28:15.51376-05	34	naranja	2	[]	7	1
138	2017-07-15 19:28:25.145586-05	35	nuez	2	[]	7	1
139	2017-07-15 19:28:33.915847-05	36	pan	2	[]	7	1
140	2017-07-15 19:28:42.308845-05	37	pescado	2	[]	7	1
141	2017-07-15 19:28:59.706107-05	38	pimienta	2	[{"changed": {"fields": ["cantidad", "unidades"]}}]	7	1
142	2017-07-15 19:29:09.395703-05	39	pimiento rojo	2	[]	7	1
143	2017-07-15 19:29:16.496554-05	40	pimiento verde	2	[]	7	1
144	2017-07-15 19:29:30.58432-05	41	plátano	2	[{"changed": {"fields": ["cantidad", "unidades"]}}]	7	1
145	2017-07-15 19:29:39.144992-05	42	pollo (piernitas)	2	[]	7	1
146	2017-07-15 19:29:46.438265-05	43	queso	2	[]	7	1
147	2017-07-15 19:29:51.978349-05	44	sal	2	[]	7	1
148	2017-07-15 19:29:58.751709-05	45	salsa césar	2	[]	7	1
149	2017-07-15 19:30:05.382933-05	46	salsa de tomate	2	[]	7	1
150	2017-07-15 19:30:10.91029-05	47	sandía	2	[]	7	1
151	2017-07-15 19:30:16.740512-05	48	tomate	2	[]	7	1
152	2017-07-15 19:30:22.651523-05	49	uva	2	[]	7	1
153	2017-07-15 19:32:12.845157-05	3	Ensalada 1	3		10	1
154	2017-07-15 19:32:20.104545-05	2	Ensalada 3	3		10	1
155	2017-07-15 19:32:25.522135-05	1	Jugo de manzana	3		10	1
156	2017-07-15 19:33:56.888342-05	4	Jugo de manzana	1	[{"added": {}}]	10	1
157	2017-07-15 19:34:49.60547-05	5	Jugo de naranja	1	[{"added": {}}]	10	1
158	2017-07-15 19:35:46.36126-05	6	Jugo de Frutilla	1	[{"added": {}}]	10	1
159	2017-07-15 19:36:31.827955-05	7	Jugo de sandía	1	[{"added": {}}]	10	1
160	2017-07-15 19:37:24.997921-05	8	Batido de Coco	1	[{"added": {}}]	10	1
161	2017-07-15 19:38:21.464699-05	9	Batido de Banano	1	[{"added": {}}]	10	1
162	2017-07-15 19:40:00.105682-05	10	Batido de durazno	1	[{"added": {}}]	10	1
163	2017-07-15 19:40:36.387425-05	11	Batido de Mora	1	[{"added": {}}]	10	1
164	2017-07-15 19:41:29.176983-05	3	ENTRADAS	2	[{"changed": {"fields": ["tipo"]}}]	12	1
165	2017-07-15 19:41:38.482443-05	3	ENTRADA	2	[{"changed": {"fields": ["tipo"]}}]	12	1
166	2017-07-15 19:46:49.59197-05	12	Ensalada 1	1	[{"added": {}}]	10	1
167	2017-07-15 19:47:09.946726-05	13	Ensalada 2	1	[{"added": {}}]	10	1
168	2017-07-15 19:47:32.955888-05	14	Ensalada 3	1	[{"added": {}}]	10	1
169	2017-07-15 19:48:04.823007-05	15	Desayuno 1	1	[{"added": {}}]	10	1
170	2017-07-15 19:48:20.385167-05	16	Desayuno 2	1	[{"added": {}}]	10	1
171	2017-07-15 19:48:46.730418-05	4	DESAYUNO	2	[{"changed": {"fields": ["tipo"]}}]	12	1
172	2017-07-15 19:48:52.285148-05	17	Desayuno 3	1	[{"added": {}}]	10	1
173	2017-07-15 19:49:24.278892-05	2	PLATO FUERTE	2	[{"changed": {"fields": ["tipo"]}}]	12	1
174	2017-07-15 19:49:26.998842-05	18	PF 1	1	[{"added": {}}]	10	1
175	2017-07-15 19:49:42.640903-05	19	PF 2	1	[{"added": {}}]	10	1
176	2017-07-15 19:50:06.490792-05	20	PF 3	1	[{"added": {}}]	10	1
177	2017-07-15 19:50:38.785449-05	1	POSTRE	2	[{"changed": {"fields": ["tipo"]}}]	12	1
178	2017-07-15 19:50:40.914605-05	21	Postre 1	1	[{"added": {}}]	10	1
179	2017-07-15 19:50:59.130805-05	22	Postre 2	1	[{"added": {}}]	10	1
180	2017-07-15 19:51:34.931547-05	5	BEBIDA	2	[{"changed": {"fields": ["tipo"]}}]	12	1
181	2017-07-15 19:51:45.924871-05	23	Postre 3	1	[{"added": {}}]	10	1
185	2017-07-15 19:53:46.200372-05	8	sandía Jugo de sandía	1	[{"added": {}}]	8	1
187	2017-07-15 19:54:26.974559-05	10	banano Batido de Banano	1	[{"added": {}}]	8	1
189	2017-07-15 19:54:57.30477-05	11	durazno Batido de Durazno	1	[{"added": {}}]	8	1
192	2017-07-15 19:56:01.477984-05	14	pollo (piernitas) Ensalada 1	1	[{"added": {}}]	8	1
193	2017-07-15 19:56:18.091642-05	15	pan Ensalada 1	1	[{"added": {}}]	8	1
194	2017-07-15 19:56:31.381699-05	16	queso Ensalada 1	1	[{"added": {}}]	8	1
182	2017-07-15 19:52:45.073303-05	5	manzana Jugo de manzana	1	[{"added": {}}]	8	1
183	2017-07-15 19:53:05.395642-05	6	naranja Jugo de naranja	1	[{"added": {}}]	8	1
184	2017-07-15 19:53:25.520839-05	7	frutilla Jugo de Frutilla	1	[{"added": {}}]	8	1
186	2017-07-15 19:54:07.507211-05	9	coco Batido de Coco	1	[{"added": {}}]	8	1
188	2017-07-15 19:54:49.114298-05	10	Batido de Durazno	2	[{"changed": {"fields": ["nombre"]}}]	10	1
190	2017-07-15 19:55:13.585383-05	12	mora Batido de Mora	1	[{"added": {}}]	8	1
191	2017-07-15 19:55:39.062422-05	13	lechuga Ensalada 1	1	[{"added": {}}]	8	1
195	2017-07-15 19:56:43.737032-05	17	pimienta Ensalada 1	1	[{"added": {}}]	8	1
196	2017-07-15 19:57:02.340703-05	18	limón Ensalada 1	1	[{"added": {}}]	8	1
197	2017-07-15 19:57:19.580241-05	19	salsa césar Ensalada 1	1	[{"added": {}}]	8	1
198	2017-07-15 19:58:14.401047-05	20	fideo tornillo Ensalada 2	1	[{"added": {}}]	8	1
199	2017-07-15 19:58:39.939149-05	21	tomate Ensalada 2	1	[{"added": {}}]	8	1
200	2017-07-15 19:58:56.884815-05	22	pimiento rojo Ensalada 2	1	[{"added": {}}]	8	1
201	2017-07-15 19:59:09.40291-05	23	pimiento verde Ensalada 2	1	[{"added": {}}]	8	1
202	2017-07-15 19:59:32.504024-05	24	lomos de atún Ensalada 2	1	[{"added": {}}]	8	1
203	2017-07-15 19:59:44.951175-05	25	mayonesa Ensalada 2	1	[{"added": {}}]	8	1
204	2017-07-15 20:00:04.878141-05	26	lechuga Ensalada 3	1	[{"added": {}}]	8	1
205	2017-07-15 20:00:23.410435-05	27	tomate Ensalada 3	1	[{"added": {}}]	8	1
206	2017-07-15 20:00:36.050392-05	28	huevo (s) Ensalada 3	1	[{"added": {}}]	8	1
207	2017-07-15 20:00:51.479531-05	29	aceite de oliva Ensalada 3	1	[{"added": {}}]	8	1
208	2017-07-15 20:01:10.332335-05	30	sal Ensalada 3	1	[{"added": {}}]	8	1
209	2017-07-15 20:01:23.638638-05	31	pan Desayuno 1	1	[{"added": {}}]	8	1
210	2017-07-15 20:01:36.537762-05	32	huevo (s) Desayuno 1	1	[{"added": {}}]	8	1
211	2017-07-15 20:02:01.466284-05	33	leche Desayuno 1	1	[{"added": {}}]	8	1
212	2017-07-15 20:02:14.758215-05	34	cereal Desayuno 1	1	[{"added": {}}]	8	1
213	2017-07-15 20:02:31.692808-05	35	uva Desayuno 2	1	[{"added": {}}]	8	1
214	2017-07-15 20:02:44.163442-05	36	manzana Desayuno 2	1	[{"added": {}}]	8	1
215	2017-07-15 20:03:14.100826-05	37	leche Desayuno 2	1	[{"added": {}}]	8	1
216	2017-07-15 20:03:28.653658-05	38	pan Desayuno 2	1	[{"added": {}}]	8	1
217	2017-07-15 20:03:41.360609-05	39	leche Desayuno 3	1	[{"added": {}}]	8	1
218	2017-07-15 20:03:52.122439-05	40	pan Desayuno 3	1	[{"added": {}}]	8	1
219	2017-07-15 20:04:04.139841-05	41	queso Desayuno 3	1	[{"added": {}}]	8	1
220	2017-07-15 20:04:20.406214-05	42	mermelada Desayuno 3	1	[{"added": {}}]	8	1
221	2017-07-15 20:04:38.314731-05	43	queso PF 1	1	[{"added": {}}]	8	1
222	2017-07-15 20:04:50.179508-05	44	leche PF 1	1	[{"added": {}}]	8	1
223	2017-07-15 20:05:04.403914-05	45	fideo tallarín PF 1	1	[{"added": {}}]	8	1
224	2017-07-15 20:05:31.409342-05	46	arroz PF 1	1	[{"added": {}}]	8	1
225	2017-07-15 20:05:42.925889-05	47	pescado PF 1	1	[{"added": {}}]	8	1
226	2017-07-15 20:06:51.204594-05	48	plátano PF 1	1	[{"added": {}}]	8	1
227	2017-07-15 20:07:03.431279-05	49	aguacate PF 2	1	[{"added": {}}]	8	1
228	2017-07-15 20:07:17.846796-05	50	arroz PF 2	1	[{"added": {}}]	8	1
229	2017-07-15 20:07:35.586293-05	51	pollo (piernitas) PF 2	1	[{"added": {}}]	8	1
230	2017-07-15 20:07:53.640331-05	52	salsa de tomate PF 2	1	[{"added": {}}]	8	1
231	2017-07-15 20:08:17.208071-05	53	albondiga PF 3	1	[{"added": {}}]	8	1
232	2017-07-15 20:08:32.843094-05	54	fideo tallarín PF 3	1	[{"added": {}}]	8	1
233	2017-07-15 20:08:49.964868-05	55	frutilla Postre 1	1	[{"added": {}}]	8	1
234	2017-07-15 20:09:05.844788-05	56	crema chantilly Postre 1	1	[{"added": {}}]	8	1
235	2017-07-15 20:09:18.836181-05	57	cereza Postre 1	1	[{"added": {}}]	8	1
236	2017-07-15 20:09:49.412798-05	58	durazno Postre 2	1	[{"added": {}}]	8	1
237	2017-07-15 20:09:59.996013-05	59	kiwi Postre 2	1	[{"added": {}}]	8	1
238	2017-07-15 20:10:13.326043-05	60	cereza Postre 2	1	[{"added": {}}]	8	1
239	2017-07-15 20:10:27.575937-05	61	frutilla Postre 2	1	[{"added": {}}]	8	1
240	2017-07-15 20:10:41.357627-05	62	miel Postre 2	1	[{"added": {}}]	8	1
241	2017-07-15 20:10:56.641992-05	63	nuez Postre 3	1	[{"added": {}}]	8	1
242	2017-07-15 20:11:12.911432-05	64	almendra Postre 3	1	[{"added": {}}]	8	1
243	2017-07-15 20:11:28.191098-05	65	helado de vainilla Postre 3	1	[{"added": {}}]	8	1
244	2017-07-15 20:11:43.151983-05	66	dulce de leche Postre 3	1	[{"added": {}}]	8	1
245	2017-07-16 18:45:14.941386-05	5	Bebidas	2	[{"changed": {"fields": ["tipo"]}}]	12	1
246	2017-07-16 23:22:25.919474-05	49	uva	2	[{"changed": {"fields": ["icon"]}}]	7	1
247	2017-07-16 23:24:20.136065-05	36	pan	2	[{"changed": {"fields": ["icon"]}}]	7	1
248	2017-07-16 23:24:26.667823-05	43	queso	2	[{"changed": {"fields": ["icon"]}}]	7	1
249	2017-07-16 23:24:34.233195-05	13	cereal	2	[{"changed": {"fields": ["icon"]}}]	7	1
250	2017-07-16 23:24:41.095666-05	24	huevo (s)	2	[{"changed": {"fields": ["icon"]}}]	7	1
251	2017-07-16 23:24:48.43258-05	26	leche	2	[{"changed": {"fields": ["icon"]}}]	7	1
252	2017-07-16 23:24:58.546372-05	29	manzana	2	[{"changed": {"fields": ["icon"]}}]	7	1
253	2017-07-17 07:59:37.672568-05	2	3265	1	[{"added": {}}]	9	1
254	2017-07-17 07:59:50.965897-05	3	4265	1	[{"added": {}}]	9	1
255	2017-07-17 08:00:25.921205-05	2	3265 2003	1	[{"added": {}}]	11	1
256	2017-07-30 13:06:42.632477-05	67	leche Batido de Banano	1	[{"added": {}}]	8	1
257	2017-07-30 13:08:27.80709-05	50	Agua	1	[{"added": {}}]	7	1
258	2017-07-30 13:09:17.927095-05	68	Agua Jugo de manzana	1	[{"added": {}}]	8	1
259	2017-07-30 13:09:24.091773-05	69	Agua Jugo de naranja	1	[{"added": {}}]	8	1
260	2017-07-30 13:09:34.47635-05	70	Agua Jugo de Frutilla	1	[{"added": {}}]	8	1
261	2017-07-30 13:09:41.274895-05	71	Agua Jugo de sandía	1	[{"added": {}}]	8	1
262	2017-07-30 13:09:54.774674-05	72	leche Batido de Coco	1	[{"added": {}}]	8	1
263	2017-07-30 13:10:01.78487-05	73	leche Batido de Mora	1	[{"added": {}}]	8	1
264	2017-07-31 22:08:29.902638-05	48	tomate	2	[{"changed": {"fields": ["icon"]}}]	7	1
265	2017-07-31 22:16:30.881195-05	8	aguacate	2	[{"changed": {"fields": ["icon"]}}]	7	1
266	2017-07-31 22:18:52.372948-05	48	tomate	2	[{"changed": {"fields": ["icon"]}}]	7	1
267	2017-07-31 22:32:06.697245-05	8	aguacate	2	[{"changed": {"fields": ["icon"]}}]	7	1
268	2017-07-31 23:41:55.088371-05	34	naranja	2	[{"changed": {"fields": ["icon"]}}]	7	1
269	2017-07-31 23:45:51.68042-05	34	naranja	2	[{"changed": {"fields": ["icon"]}}]	7	1
270	2017-07-31 23:48:52.931529-05	21	frutilla	2	[{"changed": {"fields": ["icon"]}}]	7	1
271	2017-07-31 23:49:19.509514-05	21	frutilla	2	[{"changed": {"fields": ["icon"]}}]	7	1
272	2017-07-31 23:51:34.313502-05	15	coco	2	[{"changed": {"fields": ["icon"]}}]	7	1
273	2017-07-31 23:52:50.487334-05	15	coco	2	[{"changed": {"fields": ["icon"]}}]	7	1
274	2017-08-05 17:08:14.840321-05	9	albondiga	2	[{"changed": {"fields": ["icon"]}}]	7	1
275	2017-08-05 17:48:07.548801-05	8	aguacate	2	[{"changed": {"fields": ["icon"]}}]	7	1
276	2017-08-05 18:18:21.104805-05	10	almendra	2	[{"changed": {"fields": ["icon"]}}]	7	1
277	2017-08-05 18:18:30.891283-05	11	arroz	2	[{"changed": {"fields": ["icon"]}}]	7	1
278	2017-08-05 18:23:08.36845-05	12	banano	2	[{"changed": {"fields": ["icon"]}}]	7	1
279	2017-08-05 18:25:58.007816-05	15	coco	2	[{"changed": {"fields": ["icon"]}}]	7	1
280	2017-08-05 18:25:58.34114-05	14	cereza	2	[{"changed": {"fields": ["icon"]}}]	7	1
281	2017-08-05 18:35:28.82511-05	8	aguacate	2	[]	7	1
282	2017-08-05 18:43:34.877903-05	16	crema chantilly	2	[{"changed": {"fields": ["icon"]}}]	7	1
283	2017-08-05 19:14:20.596854-05	17	dulce de leche	2	[{"changed": {"fields": ["icon"]}}]	7	1
284	2017-08-05 19:14:29.99255-05	18	durazno	2	[{"changed": {"fields": ["icon"]}}]	7	1
285	2017-08-05 19:14:59.069353-05	20	fideo tornillo	2	[{"changed": {"fields": ["icon"]}}]	7	1
286	2017-08-05 19:15:12.22384-05	19	fideo tallarín	2	[{"changed": {"fields": ["icon"]}}]	7	1
287	2017-08-05 19:42:19.988534-05	23	helado de vainilla	2	[{"changed": {"fields": ["icon"]}}]	7	1
288	2017-08-05 19:42:32.711432-05	25	kiwi	2	[{"changed": {"fields": ["icon"]}}]	7	1
289	2017-08-05 19:42:59.56125-05	21	frutilla	2	[{"changed": {"fields": ["icon"]}}]	7	1
290	2017-08-05 19:49:23.246837-05	19	fideo tallarín	2	[{"changed": {"fields": ["icon"]}}]	7	1
291	2017-08-05 19:50:11.577995-05	17	dulce de leche	2	[{"changed": {"fields": ["icon"]}}]	7	1
292	2017-08-05 20:14:04.919469-05	28	lomos de atún	2	[{"changed": {"fields": ["icon"]}}]	7	1
293	2017-08-05 20:14:58.896686-05	27	lechuga	2	[{"changed": {"fields": ["icon"]}}]	7	1
294	2017-08-05 20:25:56.182144-05	31	mermelada	2	[{"changed": {"fields": ["icon"]}}]	7	1
295	2017-08-05 20:26:04.417624-05	30	mayonesa	2	[{"changed": {"fields": ["icon"]}}]	7	1
296	2017-08-05 21:01:27.844326-05	32	miel	2	[{"changed": {"fields": ["icon"]}}]	7	1
297	2017-08-05 21:35:29.36094-05	33	mora	2	[{"changed": {"fields": ["icon"]}}]	7	1
298	2017-08-05 21:35:44.561074-05	34	naranja	2	[{"changed": {"fields": ["icon"]}}]	7	1
299	2017-08-05 21:45:05.279778-05	39	pimiento rojo	2	[{"changed": {"fields": ["icon"]}}]	7	1
300	2017-08-05 22:14:29.779391-05	42	pollo (piernitas)	2	[{"changed": {"fields": ["icon"]}}]	7	1
301	2017-08-05 22:14:42.201951-05	41	plátano	2	[{"changed": {"fields": ["icon"]}}]	7	1
302	2017-08-05 22:15:22.073322-05	40	pimiento verde	2	[{"changed": {"fields": ["icon"]}}]	7	1
303	2017-08-05 22:15:33.225386-05	38	pimienta	2	[{"changed": {"fields": ["icon"]}}]	7	1
304	2017-08-05 22:15:41.779368-05	37	pescado	2	[{"changed": {"fields": ["icon"]}}]	7	1
305	2017-08-05 22:15:49.441404-05	35	nuez	2	[{"changed": {"fields": ["icon"]}}]	7	1
306	2017-08-05 22:24:56.318771-05	45	salsa césar	2	[{"changed": {"fields": ["icon"]}}]	7	1
307	2017-08-05 22:25:09.461995-05	46	salsa de tomate	2	[{"changed": {"fields": ["icon"]}}]	7	1
308	2017-08-05 22:25:20.403193-05	47	sandía	2	[{"changed": {"fields": ["icon"]}}]	7	1
309	2017-08-05 22:26:08.25626-05	22	limón	2	[{"changed": {"fields": ["icon"]}}]	7	1
310	2017-08-05 22:26:15.825549-05	44	sal	2	[{"changed": {"fields": ["icon"]}}]	7	1
311	2017-08-05 22:26:33.765117-05	44	sal	2	[]	7	1
312	2017-08-05 22:38:22.503002-05	7	aceite de oliva	2	[{"changed": {"fields": ["icon"]}}]	7	1
313	2017-08-05 22:51:30.651211-05	48	tomate	2	[{"changed": {"fields": ["icon"]}}]	7	1
314	2017-08-05 22:55:02.475433-05	50	Agua	2	[{"changed": {"fields": ["icon"]}}]	7	1
315	2017-08-05 22:58:35.192218-05	7	aceite de oliva	2	[]	7	1
316	2017-08-05 22:58:46.060446-05	50	Agua	2	[]	7	1
317	2017-08-05 22:58:53.187286-05	8	aguacate	2	[]	7	1
318	2017-08-05 22:59:05.786418-05	9	albondiga	2	[]	7	1
319	2017-08-05 23:00:16.367045-05	10	almendra	2	[]	7	1
320	2017-08-05 23:00:55.328858-05	50	Agua	2	[]	7	1
321	2017-08-05 23:01:01.697419-05	7	aceite de oliva	2	[]	7	1
322	2017-08-05 23:01:06.666742-05	8	aguacate	2	[]	7	1
323	2017-08-05 23:01:10.974502-05	9	albondiga	2	[]	7	1
324	2017-08-05 23:01:15.978046-05	10	almendra	2	[]	7	1
325	2017-08-05 23:01:31.106655-05	11	arroz	2	[]	7	1
326	2017-08-05 23:01:37.819595-05	12	banano	2	[]	7	1
327	2017-08-05 23:01:41.763041-05	13	cereal	2	[]	7	1
328	2017-08-05 23:01:49.094356-05	14	cereza	2	[]	7	1
329	2017-08-05 23:01:57.984059-05	15	coco	2	[]	7	1
330	2017-08-05 23:02:32.694382-05	16	crema chantilly	2	[]	7	1
331	2017-08-05 23:02:45.078439-05	17	dulce de leche	2	[]	7	1
332	2017-08-05 23:02:50.89216-05	18	durazno	2	[]	7	1
333	2017-08-05 23:02:59.862836-05	19	fideo tallarín	2	[]	7	1
334	2017-08-05 23:03:08.882336-05	20	fideo tornillo	2	[]	7	1
335	2017-08-05 23:03:33.43254-05	21	frutilla	2	[]	7	1
336	2017-08-05 23:03:45.236169-05	22	limón	2	[]	7	1
337	2017-08-05 23:03:51.51428-05	23	helado de vainilla	2	[]	7	1
338	2017-08-05 23:04:06.116077-05	24	huevo (s)	2	[]	7	1
339	2017-08-05 23:05:16.073105-05	25	kiwi	2	[]	7	1
340	2017-08-05 23:05:24.452801-05	26	leche	2	[]	7	1
341	2017-08-05 23:05:37.383998-05	27	lechuga	2	[]	7	1
342	2017-08-05 23:06:15.188001-05	28	lomos de atún	2	[]	7	1
343	2017-08-05 23:07:51.800519-05	50	Agua	2	[]	7	1
344	2017-08-05 23:08:00.626594-05	7	aceite de oliva	2	[]	7	1
345	2017-08-05 23:08:04.925817-05	8	aguacate	2	[]	7	1
346	2017-08-05 23:08:25.590699-05	9	albondiga	2	[]	7	1
347	2017-08-05 23:08:29.232562-05	10	almendra	2	[]	7	1
348	2017-08-05 23:08:33.098623-05	11	arroz	2	[]	7	1
349	2017-08-05 23:08:36.888635-05	12	banano	2	[]	7	1
350	2017-08-05 23:08:59.589701-05	13	cereal	2	[]	7	1
351	2017-08-05 23:09:02.950864-05	14	cereza	2	[]	7	1
352	2017-08-05 23:09:10.124249-05	15	coco	2	[]	7	1
353	2017-08-05 23:10:14.22423-05	16	crema chantilly	2	[]	7	1
354	2017-08-05 23:10:20.357089-05	17	dulce de leche	2	[]	7	1
355	2017-08-05 23:10:27.403826-05	18	durazno	2	[]	7	1
356	2017-08-05 23:11:16.106508-05	19	fideo tallarín	2	[]	7	1
357	2017-08-05 23:12:47.23122-05	20	fideo tornillo	2	[]	7	1
358	2017-08-05 23:12:53.415852-05	21	frutilla	2	[]	7	1
359	2017-08-05 23:13:06.984346-05	22	limón	2	[]	7	1
360	2017-08-05 23:13:19.043193-05	23	helado de vainilla	2	[]	7	1
361	2017-08-05 23:13:25.982401-05	24	huevo (s)	2	[]	7	1
362	2017-08-05 23:13:53.52948-05	25	kiwi	2	[]	7	1
363	2017-08-05 23:13:59.540451-05	26	leche	2	[]	7	1
364	2017-08-05 23:14:09.529457-05	27	lechuga	2	[]	7	1
365	2017-08-05 23:14:18.139137-05	28	lomos de atún	2	[]	7	1
366	2017-08-05 23:14:35.443668-05	29	manzana	2	[]	7	1
367	2017-08-05 23:14:44.01589-05	30	mayonesa	2	[]	7	1
368	2017-08-05 23:14:52.183718-05	31	mermelada	2	[]	7	1
369	2017-08-05 23:15:40.7418-05	32	miel	2	[]	7	1
370	2017-08-05 23:15:54.320989-05	33	mora	2	[]	7	1
371	2017-08-05 23:16:00.057062-05	34	naranja	2	[]	7	1
372	2017-08-05 23:16:05.66364-05	35	nuez	2	[]	7	1
373	2017-08-05 23:16:11.601729-05	36	pan	2	[]	7	1
374	2017-08-05 23:16:19.253848-05	37	pescado	2	[]	7	1
375	2017-08-05 23:16:28.764771-05	38	pimienta	2	[]	7	1
376	2017-08-05 23:16:35.157849-05	39	pimiento rojo	2	[]	7	1
377	2017-08-05 23:16:44.813441-05	40	pimiento verde	2	[]	7	1
378	2017-08-05 23:17:04.980678-05	41	plátano	2	[]	7	1
379	2017-08-05 23:19:18.686504-05	42	pollo (piernitas)	2	[]	7	1
380	2017-08-05 23:19:24.977139-05	43	queso	2	[]	7	1
381	2017-08-05 23:19:33.944283-05	44	sal	2	[]	7	1
382	2017-08-05 23:19:41.485837-05	45	salsa césar	2	[]	7	1
383	2017-08-05 23:19:49.022615-05	46	salsa de tomate	2	[]	7	1
384	2017-08-05 23:19:55.979659-05	47	sandía	2	[]	7	1
385	2017-08-05 23:20:27.673805-05	48	tomate	2	[]	7	1
386	2017-08-05 23:20:33.335453-05	49	uva	2	[]	7	1
387	2017-08-05 23:24:25.67462-05	32	miel	2	[]	7	1
388	2017-08-05 23:27:51.164485-05	33	mora	2	[]	7	1
389	2017-08-05 23:27:57.991378-05	34	naranja	2	[]	7	1
390	2017-08-05 23:28:23.065038-05	35	nuez	2	[]	7	1
391	2017-08-07 00:36:14.228971-05	15	11111111 1650	3		11	1
392	2017-08-07 00:36:14.24562-05	14	11111111 1650	3		11	1
393	2017-08-07 00:36:14.258631-05	13	11111111 1650	3		11	1
394	2017-08-07 00:36:14.267403-05	12	11111111 1650	3		11	1
395	2017-08-07 00:36:44.540882-05	11	11111111 250	3		11	1
396	2017-08-07 00:36:44.560826-05	10	11111111 450	3		11	1
397	2017-08-07 00:36:44.572803-05	8	11111111 450	3		11	1
398	2017-08-07 00:36:44.587741-05	6	11111111 450	3		11	1
399	2017-08-07 00:37:14.08828-05	2	3265 2003	3		11	1
400	2017-08-09 11:50:36.766053-05	16	11111111 5000	2	[{"changed": {"fields": ["puntaje"]}}]	11	1
401	2017-08-30 00:30:27.995237-05	21	frutilla	2	[]	7	1
402	2017-08-30 13:43:15.971497-05	49	uva	3		7	1
403	2017-08-30 13:43:21.862397-05	38	pimienta	3		7	1
404	2017-08-30 13:43:29.134725-05	39	pimiento rojo	3		7	1
405	2017-08-30 13:43:34.483859-05	25	kiwi	3		7	1
406	2017-08-30 13:43:49.852349-05	46	salsa de tomate	3		7	1
407	2017-08-30 13:43:54.872808-05	9	albondiga	3		7	1
408	2017-08-30 13:44:31.78976-05	44	leche PF 1	3		8	1
409	2017-08-30 13:44:36.456782-05	39	leche Desayuno 3	3		8	1
410	2017-08-30 13:44:39.962075-05	37	leche Desayuno 2	3		8	1
411	2017-08-30 13:44:43.431498-05	33	leche Desayuno 1	3		8	1
412	2017-08-30 13:46:29.914208-05	16	crema chantilly	3		7	1
413	2017-08-30 13:46:34.194648-05	35	nuez	3		7	1
414	2017-08-30 14:18:07.720047-05	74	leche Desayuno 2	1	[{"added": {}}]	8	1
415	2017-08-30 16:44:41.042161-05	42	mermelada Desayuno 3	2	[{"changed": {"fields": ["cantidad"]}}]	8	1
416	2017-08-30 16:44:45.381747-05	74	leche Desayuno 2	2	[{"changed": {"fields": ["cantidad"]}}]	8	1
417	2017-08-30 16:44:54.084373-05	43	queso PF 1	2	[{"changed": {"fields": ["cantidad"]}}]	8	1
418	2017-08-30 16:45:00.845353-05	41	queso Desayuno 3	2	[{"changed": {"fields": ["cantidad"]}}]	8	1
419	2017-08-30 16:45:11.584798-05	34	cereal Desayuno 1	2	[{"changed": {"fields": ["cantidad"]}}]	8	1
420	2017-08-31 23:46:33.360591-05	10	banano Batido de Banano	2	[{"changed": {"fields": ["cantidad"]}}]	8	1
421	2017-08-31 23:50:01.122006-05	11	durazno Batido de Durazno	2	[]	8	1
422	2017-08-31 23:50:13.044118-05	75	leche Batido de Durazno	1	[{"added": {}}]	8	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 422, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	ChefToun	ingrediente
8	ChefToun	ingredienteplato
9	ChefToun	nino
10	ChefToun	plato
11	ChefToun	puntaje
12	ChefToun	tipoplato
13	ChefToun	ubicacion
14	ChefToun	horario
15	ChefToun	horariotipoplato
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('django_content_type_id_seq', 15, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	ChefToun	0001_initial	2017-07-06 20:49:21.210862-05
2	ChefToun	0002_auto_20170612_0328	2017-07-06 20:49:22.182054-05
3	ChefToun	0003_remove_plato_valor	2017-07-06 20:49:22.200978-05
4	contenttypes	0001_initial	2017-07-06 20:49:22.76525-05
5	auth	0001_initial	2017-07-06 20:49:26.437795-05
6	admin	0001_initial	2017-07-06 20:49:27.294048-05
7	admin	0002_logentry_remove_auto_add	2017-07-06 20:49:27.321366-05
8	contenttypes	0002_remove_content_type_name	2017-07-06 20:49:27.393281-05
9	auth	0002_alter_permission_name_max_length	2017-07-06 20:49:27.427115-05
10	auth	0003_alter_user_email_max_length	2017-07-06 20:49:27.454623-05
11	auth	0004_alter_user_username_opts	2017-07-06 20:49:27.473771-05
12	auth	0005_alter_user_last_login_null	2017-07-06 20:49:27.499885-05
13	auth	0006_require_contenttypes_0002	2017-07-06 20:49:27.511392-05
14	auth	0007_alter_validators_add_error_messages	2017-07-06 20:49:27.531697-05
15	auth	0008_alter_user_username_max_length	2017-07-06 20:49:27.60095-05
16	sessions	0001_initial	2017-07-06 20:49:28.136218-05
17	ChefToun	0004_ingrediente_icon	2017-07-16 19:52:44.757465-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yamilnunezaguirre
--

SELECT pg_catalog.setval('django_migrations_id_seq', 17, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: yamilnunezaguirre
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
utaykbc2le2g7v6r15d1x9y9rhlmm5vz	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-07-20 21:14:33.53764-05
1b9zjc0qk6v42rtdy2lpyvb5aswjc4jq	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-07-21 23:06:57.277629-05
qa6snbamgu2t366s2qot5ymtrki4osye	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-07-21 23:19:32.001051-05
dv0b5rhsktdwwenzh6eyr48qjofpeohk	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-07-24 11:33:19.765298-05
ocesnqruvtlo3dcavwu4syyy95ibqftv	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-07-31 22:06:08.286478-05
wptukz7q9xlz15sz2p0i6pqt7w6t116a	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-08-04 17:12:26.534355-05
twpr6dabljbqa9uuohs4gn8rofioyge2	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-08-13 17:42:29.963427-05
arlu05kazh86j8eo9qyolpa5tevqp2b2	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-08-14 22:04:57.685019-05
uqvn1ntsd0z0f5jl8j18t9q94b7om02q	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-08-19 17:06:04.216512-05
awln1q7435z641qb02s84a8afu3qtdfy	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-08-19 17:06:08.03874-05
i5me1g31wxjvk1nj9u7nzh6la4wc9u71	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-08-19 17:08:56.237682-05
164vuin934azpr1lzpfhd9zv2wibn316	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-08-21 09:34:15.463091-05
2t5ukfmikvixmamfibbyr3awe55xyinp	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-08-29 00:41:46.346948-05
u1o7u5y9pxyp4hhsxssuku6bh6l9p6ok	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-09-13 00:29:55.161016-05
pra4i70mc9g1s0kdf55g6sj2tqqsuya5	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2017-09-13 13:42:32.941618-05
1okt5m16f5oc9wkm1y11rkznt34zjxsq	ZDExNTkyZmEyNDUzNjUyYzUyYjUyMWMyMzIxMWExZGYxYWU2MjgwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDM2M2RhYjkxZTk1NDZlNzQ1MjQzMTEwYjEzNmFiYWYwNTVkYzhjIn0=	2018-03-14 16:40:57.910447-05
\.


--
-- Name: ChefToun_horario ChefToun_horario_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_horario"
    ADD CONSTRAINT "ChefToun_horario_pkey" PRIMARY KEY (id);


--
-- Name: ChefToun_horariotipoplato ChefToun_horariotipoplato_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_horariotipoplato"
    ADD CONSTRAINT "ChefToun_horariotipoplato_pkey" PRIMARY KEY (id);


--
-- Name: ChefToun_ingrediente ChefToun_ingrediente_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_ingrediente"
    ADD CONSTRAINT "ChefToun_ingrediente_pkey" PRIMARY KEY (id);


--
-- Name: ChefToun_ingredienteplato ChefToun_ingredienteplato_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_ingredienteplato"
    ADD CONSTRAINT "ChefToun_ingredienteplato_pkey" PRIMARY KEY (id);


--
-- Name: ChefToun_nino ChefToun_nino_codigo_key; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_nino"
    ADD CONSTRAINT "ChefToun_nino_codigo_key" UNIQUE (codigo);


--
-- Name: ChefToun_nino ChefToun_nino_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_nino"
    ADD CONSTRAINT "ChefToun_nino_pkey" PRIMARY KEY (id);


--
-- Name: ChefToun_plato ChefToun_plato_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_plato"
    ADD CONSTRAINT "ChefToun_plato_pkey" PRIMARY KEY (id);


--
-- Name: ChefToun_puntaje ChefToun_puntaje_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_puntaje"
    ADD CONSTRAINT "ChefToun_puntaje_pkey" PRIMARY KEY (id);


--
-- Name: ChefToun_tipoplato ChefToun_tipoplato_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_tipoplato"
    ADD CONSTRAINT "ChefToun_tipoplato_pkey" PRIMARY KEY (id);


--
-- Name: ChefToun_ubicacion ChefToun_ubicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_ubicacion"
    ADD CONSTRAINT "ChefToun_ubicacion_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: ChefToun_horariotipoplato_horario_id_cf9d65d9; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX "ChefToun_horariotipoplato_horario_id_cf9d65d9" ON "ChefToun_horariotipoplato" USING btree (horario_id);


--
-- Name: ChefToun_horariotipoplato_tipoPlato_id_3d1f9cc9; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX "ChefToun_horariotipoplato_tipoPlato_id_3d1f9cc9" ON "ChefToun_horariotipoplato" USING btree ("tipoPlato_id");


--
-- Name: ChefToun_ingrediente_ubicacion_id_bb57842f; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX "ChefToun_ingrediente_ubicacion_id_bb57842f" ON "ChefToun_ingrediente" USING btree (ubicacion_id);


--
-- Name: ChefToun_ingredienteplato_ingrediente_id_84cfea5f; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX "ChefToun_ingredienteplato_ingrediente_id_84cfea5f" ON "ChefToun_ingredienteplato" USING btree (ingrediente_id);


--
-- Name: ChefToun_ingredienteplato_plato_id_17aee8a5; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX "ChefToun_ingredienteplato_plato_id_17aee8a5" ON "ChefToun_ingredienteplato" USING btree (plato_id);


--
-- Name: ChefToun_nino_codigo_fe86c1e3_like; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX "ChefToun_nino_codigo_fe86c1e3_like" ON "ChefToun_nino" USING btree (codigo varchar_pattern_ops);


--
-- Name: ChefToun_plato_tipoPlato_id_acfd5bc1; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX "ChefToun_plato_tipoPlato_id_acfd5bc1" ON "ChefToun_plato" USING btree ("tipoPlato_id");


--
-- Name: ChefToun_puntaje_nino_id_a1ecb8ff; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX "ChefToun_puntaje_nino_id_a1ecb8ff" ON "ChefToun_puntaje" USING btree (nino_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: yamilnunezaguirre
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: ChefToun_horariotipoplato ChefToun_horariotipo_horario_id_cf9d65d9_fk_ChefToun_; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_horariotipoplato"
    ADD CONSTRAINT "ChefToun_horariotipo_horario_id_cf9d65d9_fk_ChefToun_" FOREIGN KEY (horario_id) REFERENCES "ChefToun_horario"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ChefToun_horariotipoplato ChefToun_horariotipo_tipoPlato_id_3d1f9cc9_fk_ChefToun_; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_horariotipoplato"
    ADD CONSTRAINT "ChefToun_horariotipo_tipoPlato_id_3d1f9cc9_fk_ChefToun_" FOREIGN KEY ("tipoPlato_id") REFERENCES "ChefToun_tipoplato"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ChefToun_ingredienteplato ChefToun_ingrediente_ingrediente_id_84cfea5f_fk_ChefToun_; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_ingredienteplato"
    ADD CONSTRAINT "ChefToun_ingrediente_ingrediente_id_84cfea5f_fk_ChefToun_" FOREIGN KEY (ingrediente_id) REFERENCES "ChefToun_ingrediente"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ChefToun_ingredienteplato ChefToun_ingrediente_plato_id_17aee8a5_fk_ChefToun_; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_ingredienteplato"
    ADD CONSTRAINT "ChefToun_ingrediente_plato_id_17aee8a5_fk_ChefToun_" FOREIGN KEY (plato_id) REFERENCES "ChefToun_plato"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ChefToun_ingrediente ChefToun_ingrediente_ubicacion_id_bb57842f_fk_ChefToun_; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_ingrediente"
    ADD CONSTRAINT "ChefToun_ingrediente_ubicacion_id_bb57842f_fk_ChefToun_" FOREIGN KEY (ubicacion_id) REFERENCES "ChefToun_ubicacion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ChefToun_plato ChefToun_plato_tipoPlato_id_acfd5bc1_fk_ChefToun_tipoplato_id; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_plato"
    ADD CONSTRAINT "ChefToun_plato_tipoPlato_id_acfd5bc1_fk_ChefToun_tipoplato_id" FOREIGN KEY ("tipoPlato_id") REFERENCES "ChefToun_tipoplato"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ChefToun_puntaje ChefToun_puntaje_nino_id_a1ecb8ff_fk_ChefToun_nino_id; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY "ChefToun_puntaje"
    ADD CONSTRAINT "ChefToun_puntaje_nino_id_a1ecb8ff_fk_ChefToun_nino_id" FOREIGN KEY (nino_id) REFERENCES "ChefToun_nino"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: yamilnunezaguirre
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

