--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7
-- Dumped by pg_dump version 13.1

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
-- Name: api_cohort; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.api_cohort (
    id integer NOT NULL,
    platoon character varying(50) NOT NULL,
    current_cohort boolean NOT NULL
);


ALTER TABLE public.api_cohort OWNER TO taprete;

--
-- Name: api_cohort_id_seq; Type: SEQUENCE; Schema: public; Owner: taprete
--

CREATE SEQUENCE public.api_cohort_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_cohort_id_seq OWNER TO taprete;

--
-- Name: api_cohort_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taprete
--

ALTER SEQUENCE public.api_cohort_id_seq OWNED BY public.api_cohort.id;


--
-- Name: api_raffle; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.api_raffle (
    id integer NOT NULL,
    is_active boolean NOT NULL,
    amount numeric(6,2),
    name character varying(20) NOT NULL
);


ALTER TABLE public.api_raffle OWNER TO taprete;

--
-- Name: api_raffle_id_seq; Type: SEQUENCE; Schema: public; Owner: taprete
--

CREATE SEQUENCE public.api_raffle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_raffle_id_seq OWNER TO taprete;

--
-- Name: api_raffle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taprete
--

ALTER SEQUENCE public.api_raffle_id_seq OWNED BY public.api_raffle.id;


--
-- Name: api_raffleparticipant; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.api_raffleparticipant (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    tickets integer NOT NULL,
    raffle_id integer NOT NULL
);


ALTER TABLE public.api_raffleparticipant OWNER TO taprete;

--
-- Name: api_raffleparticipant_id_seq; Type: SEQUENCE; Schema: public; Owner: taprete
--

CREATE SEQUENCE public.api_raffleparticipant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_raffleparticipant_id_seq OWNER TO taprete;

--
-- Name: api_raffleparticipant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taprete
--

ALTER SEQUENCE public.api_raffleparticipant_id_seq OWNED BY public.api_raffleparticipant.id;


--
-- Name: api_user; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.api_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(255) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_verified boolean NOT NULL,
    cohort_id integer,
    current_company character varying(100)
);


ALTER TABLE public.api_user OWNER TO taprete;

--
-- Name: api_user_groups; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.api_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.api_user_groups OWNER TO taprete;

--
-- Name: api_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: taprete
--

CREATE SEQUENCE public.api_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_groups_id_seq OWNER TO taprete;

--
-- Name: api_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taprete
--

ALTER SEQUENCE public.api_user_groups_id_seq OWNED BY public.api_user_groups.id;


--
-- Name: api_user_id_seq; Type: SEQUENCE; Schema: public; Owner: taprete
--

CREATE SEQUENCE public.api_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_id_seq OWNER TO taprete;

--
-- Name: api_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taprete
--

ALTER SEQUENCE public.api_user_id_seq OWNED BY public.api_user.id;


--
-- Name: api_user_user_permissions; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.api_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.api_user_user_permissions OWNER TO taprete;

--
-- Name: api_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: taprete
--

CREATE SEQUENCE public.api_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_user_permissions_id_seq OWNER TO taprete;

--
-- Name: api_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taprete
--

ALTER SEQUENCE public.api_user_user_permissions_id_seq OWNED BY public.api_user_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO taprete;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: taprete
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO taprete;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taprete
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO taprete;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: taprete
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO taprete;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taprete
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO taprete;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: taprete
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO taprete;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taprete
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO taprete;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: taprete
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO taprete;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taprete
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO taprete;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: taprete
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO taprete;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taprete
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO taprete;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: taprete
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO taprete;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taprete
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: taprete
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO taprete;

--
-- Name: api_cohort id; Type: DEFAULT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_cohort ALTER COLUMN id SET DEFAULT nextval('public.api_cohort_id_seq'::regclass);


--
-- Name: api_raffle id; Type: DEFAULT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_raffle ALTER COLUMN id SET DEFAULT nextval('public.api_raffle_id_seq'::regclass);


--
-- Name: api_raffleparticipant id; Type: DEFAULT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_raffleparticipant ALTER COLUMN id SET DEFAULT nextval('public.api_raffleparticipant_id_seq'::regclass);


--
-- Name: api_user id; Type: DEFAULT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user ALTER COLUMN id SET DEFAULT nextval('public.api_user_id_seq'::regclass);


--
-- Name: api_user_groups id; Type: DEFAULT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user_groups ALTER COLUMN id SET DEFAULT nextval('public.api_user_groups_id_seq'::regclass);


--
-- Name: api_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.api_user_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: api_cohort; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.api_cohort (id, platoon, current_cohort) FROM stdin;
1	alpha	f
2	bravo	f
3	charlie	f
4	delta	f
5	echo	f
6	foxtrot	f
7	golf	f
8	hotel	f
9	india	f
10	juliet	f
11	kilo	f
12	lima	f
13	mike	t
\.


--
-- Data for Name: api_raffle; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.api_raffle (id, is_active, amount, name) FROM stdin;
1	t	\N	December 2020
2	f	\N	January 2021
\.


--
-- Data for Name: api_raffleparticipant; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.api_raffleparticipant (id, email, name, tickets, raffle_id) FROM stdin;
\.


--
-- Data for Name: api_user; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.api_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, is_verified, cohort_id, current_company) FROM stdin;
1	pbkdf2_sha256$216000$eVhuHzNk4Bw8$4k+6AttPUdhym9Rhs78uIMd+sgWzQ8a6Z+Pa3sYgEBU=	\N	f	Halimeda	Miall	Halimeda.Miall@gmail.com	f	t	2020-12-08 14:09:55.799812-06	f	\N	\N
2	pbkdf2_sha256$216000$G07Im3F3MwJo$LzO4zT6sIUU593P/rwJtZw/LSTz9g9gFAwHU9oxMXrE=	\N	f	Maribel	Franseco	Maribel.Franseco@gmail.com	f	t	2020-12-08 14:10:49.134732-06	f	\N	\N
3	pbkdf2_sha256$216000$ChNNpvihCAgB$8XjVd+4clidvzDdSEy6wz/wPdFnkBCWZ6ijHW8fY/Zg=	\N	f	Sarene	Church	Sarene.Church@gmail.com	f	t	2020-12-08 14:11:07.688147-06	f	\N	\N
4	pbkdf2_sha256$216000$JE6LkKl2FfuE$ez1RuQ7JFvR0QJ6S4DEOvcBEQqiD+2DIF9rg3b53N1Q=	\N	f	Thelma	Abelevitz	Thelma.Abelevitz@gmail.com	f	t	2020-12-08 14:12:36.16296-06	f	\N	\N
5	pbkdf2_sha256$216000$vXfdjOexgwi2$vfWUOLBQ7K/Lbi0VfwQwTNtyhC03Qtepj8le4j5sEY4=	\N	f	Fairlie	Twinn	Fairlie.Twinn@gmail.com	f	t	2020-12-08 14:12:51.845155-06	f	\N	\N
6	pbkdf2_sha256$216000$e5AD77HSoFBW$SUihQnd+hdSX44//wj0csonvSSgY+EJzWw4eE/lnex0=	\N	f	Corabella	Chable	Corabella.Chable@gmail.com	f	t	2020-12-08 14:13:10.220907-06	f	\N	\N
7	pbkdf2_sha256$216000$217vl1KtFowF$I2ZWC/978LDwN+6E/KxmloFKTBjUeJr8cz2Gyyh4zK0=	\N	f	Rosita	Heilds	Rosita.Heilds@gmail.com	f	t	2020-12-08 14:13:25.331944-06	f	\N	\N
8	pbkdf2_sha256$216000$Y0VsWnURHtp7$Z8kDK08gCcE2PLexvsxvkKXIaWTgRI+IN2OIAnePZAY=	\N	f	Dominick	Mathissen	Dominick.Mathissen@gmail.com	f	t	2020-12-08 14:13:40.908628-06	f	\N	\N
9	pbkdf2_sha256$216000$yJkA8VMz2sHq$qanOLZkSJjEvPG0z4mvtgvTJHaoysHlnKUgaLSY16Ac=	\N	f	Jecho	McCrory	Jecho.McCrory@gmail.com	f	t	2020-12-08 14:13:56.407589-06	f	\N	\N
10	pbkdf2_sha256$216000$vLNGGkqYi3a0$NeqU/56z956a/XusEweRK4xCWFdCsPYERVEJ2d8F/hY=	\N	f	Casi	Absolon	Casi.Absolon@gmail.com	f	t	2020-12-08 14:14:12.159374-06	f	\N	\N
11	pbkdf2_sha256$216000$JMzA2qKWqm7w$czPmoXrGVlkGl6FCCeZgq0SbZ/iW+R4W+8oID80guhU=	\N	f	Erena	Lowbridge	Erena.Lowbridge@gmail.com	f	t	2020-12-08 14:14:33.085825-06	f	\N	\N
12	pbkdf2_sha256$216000$Xxo4JeUzwOvr$QQAASOxFdgvmiGN2xP+HgzmDA8bC/8DLH4l50S47yds=	\N	f	Tad	Atwill	Tad.Atwill@gmail.com	f	t	2020-12-08 14:14:57.98513-06	f	\N	\N
13	pbkdf2_sha256$216000$eNgdbNorHqhn$hIlp4ZukjvFcSSbX9Cimift49Aj0ULXYWVtyzlbTrJI=	\N	f	Wilt	Kall	Wilt.Kall@gmail.com	f	t	2020-12-08 14:15:25.930552-06	f	\N	\N
14	pbkdf2_sha256$216000$tQinubXSYPIb$UpVAAlUGC4KoKFOayDbccbQWqPDUZgKPIYPlcWhI3D4=	\N	f	Beauregard	Trueman	Beauregard.Trueman@gmail.com	f	t	2020-12-08 14:15:40.633523-06	f	\N	\N
15	pbkdf2_sha256$216000$DqXl42lGWHTN$5GEiehVDDjTFRWK+AGejVG8DnOmn+BsZuml/1EYb+ak=	\N	f	Eulalie	Polo	Eulalie.Polo@gmail.com	f	t	2020-12-08 14:15:55.746101-06	f	\N	\N
16	pbkdf2_sha256$216000$uyKhtq3D8mPH$DuPpdY+l7eAwtxwgCdhduj7XQ/BN7HsUXLpmV+VjKJ0=	\N	f	Norah	Cancutt	Norah.Cancutt@gmail.com	f	t	2020-12-08 14:16:14.254287-06	f	\N	\N
17	pbkdf2_sha256$216000$qsVdz1SvPwko$6toProQQGYiMSzCbdgnt4Hz8sdso4iSCXXxR1sQg9Es=	\N	t	Jane	Doe	admin@email.com	t	t	2020-12-08 14:16:50.541659-06	t	\N	\N
\.


--
-- Data for Name: api_user_groups; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.api_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: api_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.api_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add cohort	7	add_cohort
26	Can change cohort	7	change_cohort
27	Can delete cohort	7	delete_cohort
28	Can view cohort	7	view_cohort
29	Can add raffle	8	add_raffle
30	Can change raffle	8	change_raffle
31	Can delete raffle	8	delete_raffle
32	Can view raffle	8	view_raffle
33	Can add raffle participant	9	add_raffleparticipant
34	Can change raffle participant	9	change_raffleparticipant
35	Can delete raffle participant	9	delete_raffleparticipant
36	Can view raffle participant	9	view_raffleparticipant
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	api	user
7	api	cohort
8	api	raffle
9	api	raffleparticipant
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-12-08 13:08:45.727575-06
2	contenttypes	0002_remove_content_type_name	2020-12-08 13:08:45.737407-06
3	auth	0001_initial	2020-12-08 13:08:45.760298-06
4	auth	0002_alter_permission_name_max_length	2020-12-08 13:08:45.792698-06
5	auth	0003_alter_user_email_max_length	2020-12-08 13:08:45.798381-06
6	auth	0004_alter_user_username_opts	2020-12-08 13:08:45.805137-06
7	auth	0005_alter_user_last_login_null	2020-12-08 13:08:45.813653-06
8	auth	0006_require_contenttypes_0002	2020-12-08 13:08:45.815981-06
9	auth	0007_alter_validators_add_error_messages	2020-12-08 13:08:45.822871-06
10	auth	0008_alter_user_username_max_length	2020-12-08 13:08:45.83075-06
11	auth	0009_alter_user_last_name_max_length	2020-12-08 13:08:45.836974-06
12	auth	0010_alter_group_name_max_length	2020-12-08 13:08:45.84495-06
13	auth	0011_update_proxy_permissions	2020-12-08 13:08:45.851316-06
14	auth	0012_alter_user_first_name_max_length	2020-12-08 13:08:45.857589-06
15	api	0001_initial	2020-12-08 13:08:45.915781-06
16	admin	0001_initial	2020-12-08 13:08:45.968672-06
17	admin	0002_logentry_remove_auto_add	2020-12-08 13:08:45.994293-06
18	admin	0003_logentry_add_action_flag_choices	2020-12-08 13:08:46.00957-06
19	api	0002_auto_20200902_1613	2020-12-08 13:08:46.099847-06
20	api	0003_auto_20200904_1553	2020-12-08 13:08:46.120591-06
21	api	0004_cohort_current_cohort	2020-12-08 13:08:46.13399-06
22	api	0005_raffle_raffleparticipant	2020-12-08 13:08:46.14748-06
23	api	0006_raffle_name	2020-12-08 13:08:46.157584-06
24	api	0007_auto_20200925_1506	2020-12-08 13:08:46.185108-06
25	api	0008_auto_20201202_1456	2020-12-08 13:08:46.200867-06
26	api	0009_delete_userinfo	2020-12-08 13:08:46.204755-06
27	sessions	0001_initial	2020-12-08 13:08:46.21215-06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: taprete
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: api_cohort_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taprete
--

SELECT pg_catalog.setval('public.api_cohort_id_seq', 1, false);


--
-- Name: api_raffle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taprete
--

SELECT pg_catalog.setval('public.api_raffle_id_seq', 1, false);


--
-- Name: api_raffleparticipant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taprete
--

SELECT pg_catalog.setval('public.api_raffleparticipant_id_seq', 1, false);


--
-- Name: api_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taprete
--

SELECT pg_catalog.setval('public.api_user_groups_id_seq', 1, false);


--
-- Name: api_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taprete
--

SELECT pg_catalog.setval('public.api_user_id_seq', 17, true);


--
-- Name: api_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taprete
--

SELECT pg_catalog.setval('public.api_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taprete
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taprete
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taprete
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taprete
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taprete
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taprete
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- Name: api_cohort api_cohort_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_cohort
    ADD CONSTRAINT api_cohort_pkey PRIMARY KEY (id);


--
-- Name: api_raffle api_raffle_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_raffle
    ADD CONSTRAINT api_raffle_pkey PRIMARY KEY (id);


--
-- Name: api_raffleparticipant api_raffleparticipant_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_raffleparticipant
    ADD CONSTRAINT api_raffleparticipant_pkey PRIMARY KEY (id);


--
-- Name: api_user api_user_email_9ef5afa6_uniq; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user
    ADD CONSTRAINT api_user_email_9ef5afa6_uniq UNIQUE (email);


--
-- Name: api_user_groups api_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user_groups
    ADD CONSTRAINT api_user_groups_pkey PRIMARY KEY (id);


--
-- Name: api_user_groups api_user_groups_user_id_group_id_9c7ddfb5_uniq; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user_groups
    ADD CONSTRAINT api_user_groups_user_id_group_id_9c7ddfb5_uniq UNIQUE (user_id, group_id);


--
-- Name: api_user api_user_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user
    ADD CONSTRAINT api_user_pkey PRIMARY KEY (id);


--
-- Name: api_user_user_permissions api_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user_user_permissions
    ADD CONSTRAINT api_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: api_user_user_permissions api_user_user_permissions_user_id_permission_id_a06dd704_uniq; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user_user_permissions
    ADD CONSTRAINT api_user_user_permissions_user_id_permission_id_a06dd704_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: api_raffleparticipant_raffle_id_c3f9f36d; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX api_raffleparticipant_raffle_id_c3f9f36d ON public.api_raffleparticipant USING btree (raffle_id);


--
-- Name: api_user_cohort_id_3e778e78; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX api_user_cohort_id_3e778e78 ON public.api_user USING btree (cohort_id);


--
-- Name: api_user_email_9ef5afa6_like; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX api_user_email_9ef5afa6_like ON public.api_user USING btree (email varchar_pattern_ops);


--
-- Name: api_user_groups_group_id_3af85785; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX api_user_groups_group_id_3af85785 ON public.api_user_groups USING btree (group_id);


--
-- Name: api_user_groups_user_id_a5ff39fa; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX api_user_groups_user_id_a5ff39fa ON public.api_user_groups USING btree (user_id);


--
-- Name: api_user_user_permissions_permission_id_305b7fea; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX api_user_user_permissions_permission_id_305b7fea ON public.api_user_user_permissions USING btree (permission_id);


--
-- Name: api_user_user_permissions_user_id_f3945d65; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX api_user_user_permissions_user_id_f3945d65 ON public.api_user_user_permissions USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: taprete
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: api_raffleparticipant api_raffleparticipant_raffle_id_c3f9f36d_fk_api_raffle_id; Type: FK CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_raffleparticipant
    ADD CONSTRAINT api_raffleparticipant_raffle_id_c3f9f36d_fk_api_raffle_id FOREIGN KEY (raffle_id) REFERENCES public.api_raffle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user api_user_cohort_id_3e778e78_fk_api_cohort_id; Type: FK CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user
    ADD CONSTRAINT api_user_cohort_id_3e778e78_fk_api_cohort_id FOREIGN KEY (cohort_id) REFERENCES public.api_cohort(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_groups api_user_groups_group_id_3af85785_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user_groups
    ADD CONSTRAINT api_user_groups_group_id_3af85785_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_groups api_user_groups_user_id_a5ff39fa_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user_groups
    ADD CONSTRAINT api_user_groups_user_id_a5ff39fa_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_user_permissions api_user_user_permis_permission_id_305b7fea_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user_user_permissions
    ADD CONSTRAINT api_user_user_permis_permission_id_305b7fea_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_user_permissions api_user_user_permissions_user_id_f3945d65_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.api_user_user_permissions
    ADD CONSTRAINT api_user_user_permissions_user_id_f3945d65_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: taprete
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

