--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: preisnunes
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO preisnunes;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: preisnunes
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    external_id integer NOT NULL,
    subregion_id integer,
    ready_for_updates boolean
);


ALTER TABLE public.cities OWNER TO preisnunes;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: preisnunes
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO preisnunes;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: preisnunes
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: houses; Type: TABLE; Schema: public; Owner: preisnunes
--

CREATE TABLE public.houses (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    external_id character varying(255) NOT NULL,
    price double precision,
    total_area double precision,
    typology character varying(255),
    type_id integer,
    city_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    built_area double precision NOT NULL,
    url character varying(255)
);


ALTER TABLE public.houses OWNER TO preisnunes;

--
-- Name: houses_id_seq; Type: SEQUENCE; Schema: public; Owner: preisnunes
--

CREATE SEQUENCE public.houses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.houses_id_seq OWNER TO preisnunes;

--
-- Name: houses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: preisnunes
--

ALTER SEQUENCE public.houses_id_seq OWNED BY public.houses.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: preisnunes
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    external_id integer NOT NULL
);


ALTER TABLE public.regions OWNER TO preisnunes;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: preisnunes
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO preisnunes;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: preisnunes
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: subregions; Type: TABLE; Schema: public; Owner: preisnunes
--

CREATE TABLE public.subregions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    external_id integer NOT NULL,
    region_id integer
);


ALTER TABLE public.subregions OWNER TO preisnunes;

--
-- Name: subregions_id_seq; Type: SEQUENCE; Schema: public; Owner: preisnunes
--

CREATE SEQUENCE public.subregions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subregions_id_seq OWNER TO preisnunes;

--
-- Name: subregions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: preisnunes
--

ALTER SEQUENCE public.subregions_id_seq OWNED BY public.subregions.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: preisnunes
--

CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.types OWNER TO preisnunes;

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: preisnunes
--

CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO preisnunes;

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: preisnunes
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: houses id; Type: DEFAULT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.houses ALTER COLUMN id SET DEFAULT nextval('public.houses_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: subregions id; Type: DEFAULT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.subregions ALTER COLUMN id SET DEFAULT nextval('public.subregions_id_seq'::regclass);


--
-- Name: types id; Type: DEFAULT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: preisnunes
--

COPY public.alembic_version (version_num) FROM stdin;
87396c6b0aa3
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: preisnunes
--

COPY public.cities (id, name, external_id, subregion_id, ready_for_updates) FROM stdin;
14	Guia Ilha e Mata Mourisca	10501138	2	t
15	Pombal	10501129	2	t
17	Carriço	10501125	2	t
18	Almagreira	10501123	2	t
19	Vermoil	10501133	2	t
1	Bajouca	10495001	1	t
2	Monte Redondo e Carreira	10495012	1	t
3	Leiria Pousos Barreira e Cortes	10495009	1	t
4	Marrazes e Barosa	10495010	1	t
5	Souto da Carpalhosa e Ortigosa	10495016	1	t
6	Monte Real e Carvide	10495011	1	t
7	Bidoeira de Cima	10495002	1	t
8	Colmeias e Memória	10495008	1	t
9	Milagres	10494991	1	t
10	Amor	10494977	1	t
11	Coimbrão	10494985	1	t
12	Parceiros e Azóia	10495013	1	t
13	Regueira de Pontes	10494997	1	t
\.


--
-- Data for Name: houses; Type: TABLE DATA; Schema: public; Owner: preisnunes
--

COPY public.houses (id, name, external_id, price, total_area, typology, type_id, city_id, created_on, updated_on, built_area, url) FROM stdin;
2643	Requinte e charme	16sUF	199500	\N		2	1	2022-02-11 20:58:53.310783	2022-02-11 20:58:53.310792	206	\N
2644	Moradia V4	14LkZ	286000	796.27		2	1	2022-02-11 20:58:53.32597	2022-02-11 20:58:53.325978	223.48	\N
2645	Moradia T4, Bajouca, Leiria	15kTE	289000	800		2	1	2022-02-11 20:58:53.347502	2022-02-11 20:58:53.347512	360	\N
2646	Moradia T3+1 Venda em Bajouca,Leiria	16f0V	286000	796		2	1	2022-02-11 20:58:53.377529	2022-02-11 20:58:53.377542	361	\N
2647	Moradia T4 de cave e r/c, terreno c/+-800m2. Bajouca-Leiria	14OfO	286000	796		2	1	2022-02-11 20:58:53.416544	2022-02-11 20:58:53.416555	205	\N
2648	Moradia T3 Venda em Bajouca,Leiria	15cQY	250000	1100		2	1	2022-02-11 20:58:53.440067	2022-02-11 20:58:53.440075	320	\N
2649	Moradia individual T3+1 na Bajouca	14Ot0	286000	796		2	1	2022-02-11 20:58:53.46212	2022-02-11 20:58:53.462131	205	\N
2650	Moradia - 420 m² - T4	13XdV	420000	6220		2	2	2022-02-11 20:58:55.350776	2022-02-11 20:58:55.350788	420	\N
2651	Moradia T3, Térrea, Isolada, com terreno, no centro de Mo...	180jV	193500	935		2	2	2022-02-11 20:58:55.535332	2022-02-11 20:58:55.535339	133	\N
2652	Moradia T3; Porto Longo; Monte Redondo; Leiria	17ajW	189000	1200		2	2	2022-02-11 20:58:55.580932	2022-02-11 20:58:55.580945	120	\N
2653	Moradia T3 Isolada em construção em Monte Redondo, Leiria	16lg1	240000	941		2	2	2022-02-11 20:58:55.598637	2022-02-11 20:58:55.598645	290	\N
2654	Moradia T3 em Leiria	XXNz	250000	1300		2	2	2022-02-11 20:58:55.616185	2022-02-11 20:58:55.616192	220	\N
2655	Moradia T3 c/piscina, em terreno c/+-1195m2. Monte Redondo-Carreira	16Myh	350000	1195		2	2	2022-02-11 20:58:55.634226	2022-02-11 20:58:55.634236	542	\N
2656	Moradia  para restaurar/ Paço / Monte Redondo/ Leiria	16529	30000	405		2	2	2022-02-11 20:58:55.656306	2022-02-11 20:58:55.656314	136	\N
2657	Moradia térrea T3+1 na zona de Monte Redondo	13aQR	145000	1000		2	2	2022-02-11 20:58:55.684447	2022-02-11 20:58:55.684458	100	\N
2658	Moradia T3 r/c, implantada em terreno c/860m2. Monte Redondo	15mqr	249500	860		2	2	2022-02-11 20:58:55.726805	2022-02-11 20:58:55.726816	150	\N
2659	Moradia T3 cave e r/c, implantada em terreno c/+-900m2. Monte Redondo.	17rh8	240000	900		2	2	2022-02-11 20:58:55.760554	2022-02-11 20:58:55.760565	309	\N
2660	2 Moradias para Remodelar	13Hia	130000	\N		2	2	2022-02-11 20:58:55.825685	2022-02-11 20:58:55.825699	281	\N
2661	Moradia T3 | Lote 843m2 | 2 frentes de estrada	177d2	75000	843		2	2	2022-02-11 20:58:55.848536	2022-02-11 20:58:55.848547	78	\N
2662	Moradia individual T3+1 r/c, terreno c/+-6220m2. Monte Redondo	130jM	420000	6220		2	2	2022-02-11 20:58:55.869878	2022-02-11 20:58:55.869888	329	\N
2663	Moradia T5+1para Venda	17NDo	295000	1339		2	2	2022-02-11 20:58:55.889419	2022-02-11 20:58:55.889432	317	\N
2664	Moradia geminada T4 com jardim e logradouro. Monte Redondo	16CgP	195000	\N		2	2	2022-02-11 20:58:55.909939	2022-02-11 20:58:55.909951	232	\N
2665	Moradia em ruínas em Carreira	116X0	44000	\N		2	2	2022-02-11 20:58:55.932584	2022-02-11 20:58:55.932592	75	\N
2666	Moradia T3 Venda em Monte Redondo e Carreira,Leiria	14q2r	\N	397		2	2	2022-02-11 20:58:55.948276	2022-02-11 20:58:55.948289	196	\N
2667	Propriedade c/+-3095m2, c/casa p/restauro. Carreira	YiuQ	124000	3095		2	2	2022-02-11 20:58:55.97628	2022-02-11 20:58:55.976288	210	\N
2668	Moradia T4, Monte Redondo	15dJi	200000	350		2	2	2022-02-11 20:58:55.994015	2022-02-11 20:58:55.994026	200	\N
2669	Moradia T5, Lavegadas - Monte Redondo	15cQB	330000	1260		2	2	2022-02-11 20:58:56.015293	2022-02-11 20:58:56.015301	338	\N
2670	Casa de rés-do-chão p/restauro. Monte Redondo	15zeV	32000	\N		2	2	2022-02-11 20:58:56.038207	2022-02-11 20:58:56.038215	50	\N
2671	Moradia T3 na zona de Monte Redondo	13Iv4	218000	397		2	2	2022-02-11 20:58:56.071879	2022-02-11 20:58:56.071891	198	\N
2672	Moradia para restaurar, Carreira, Leiria	15faK	55000	\N		2	2	2022-02-11 20:58:56.109575	2022-02-11 20:58:56.109584	110	\N
2673	Moradia T5 Térrea em construção- Monte redondo	13qdP	330000	1260		2	2	2022-02-11 20:58:56.14044	2022-02-11 20:58:56.140452	341	\N
2674	Moradia em Monte Redondo	17NA0	65000	\N		2	2	2022-02-11 20:58:56.166978	2022-02-11 20:58:56.166986	90	\N
2675	Mobil home casas moveis	17r0I	15500	\N		2	2	2022-02-11 20:58:56.187865	2022-02-11 20:58:56.187883	32	\N
2676	MORADIA PARA RESTAURO NUM TERRENO COM 2.400M2	17NzZ	75000	2400		2	2	2022-02-11 20:58:56.21061	2022-02-11 20:58:56.210618	145	\N
2677	Moradia T2 para reconstrução  – Monte Redondo	15f8B	122500	1385		2	2	2022-02-11 20:58:56.228371	2022-02-11 20:58:56.228381	70.14	\N
2678	Moradia T2 – Monte Redondo	15fd3	75000	1385		2	2	2022-02-11 20:58:56.248692	2022-02-11 20:58:56.248702	70.14	\N
2680	Bajouca T4	PQR	150000	500	T4	2	1	2022-02-11 22:34:36.79125	2022-02-11 22:34:36.791352	200	\N
2681	Moradia terrea isolada 4 quartos (2 suites) em lote 1000m2 para Venda	17O05	350000	1000		2	3	2022-02-11 22:38:50.474521	2022-02-11 22:38:50.474554	100	\N
2682	Moradia T3+1 / Construção Nova / Acabamentos Contemporâneos / Cortes	17Ar2	249500	390		2	3	2022-02-11 22:38:50.522395	2022-02-11 22:38:50.522411	161	\N
2683	Moradia T3+1 / Construção Nova / Acabamentos Contemporâneos / Cortes	17Ar3	249500	394		2	3	2022-02-11 22:38:50.571246	2022-02-11 22:38:50.571254	159	\N
2684	Moradia T3+1 || Bajouca || Leiria	17ApD	340000	906		2	3	2022-02-11 22:38:50.614837	2022-02-11 22:38:50.614844	204	\N
2685	MORADIA V3+1 GEMINADA || ANDRINOS || LEIRIA	17zTx	315000	\N		2	3	2022-02-11 22:38:50.650113	2022-02-11 22:38:50.650124	151	\N
2686	Moradia T3+1 / Construção Nova / Acabamentos Contemporâneos / Cortes	17zq0	249500	380		2	3	2022-02-11 22:38:50.694749	2022-02-11 22:38:50.694757	160	\N
2687	Moradia individual | o refugio a um passo da cidade de Leiria	17vpk	200000	\N		2	3	2022-02-11 22:38:50.7278	2022-02-11 22:38:50.727818	130	\N
2688	Moradia T3+1 / Projecto Chave na Mão / Acabamentos Contemporâneos / Co	17fAH	360000	790		2	3	2022-02-11 22:38:50.767926	2022-02-11 22:38:50.767935	148	\N
2689	Moradia T6 / Bifamiliar / Garagem / Aquecimento Central / Pousos	179J3	220000	115		2	3	2022-02-11 22:38:50.800872	2022-02-11 22:38:50.80088	190	\N
2690	Moradia T7 na cidade de Leiria	14IHW	765000	1720		2	3	2022-02-11 22:38:50.837585	2022-02-11 22:38:50.837593	900	\N
2691	2 Moradias  5 quatros + 3 quartos, loja armazém, garagem e pavilhão in	176bn	450000	2850		2	3	2022-02-11 22:38:50.876631	2022-02-11 22:38:50.876639	220	\N
2692	Moradia T4 Nova para Venda em Leiria	16RIB	340000	800		2	3	2022-02-11 22:38:50.909527	2022-02-11 22:38:50.909541	155	\N
2693	Moradia T5 para Venda em Leiria	16BUb	425000	649.8		2	3	2022-02-11 22:38:50.95063	2022-02-11 22:38:50.950638	532.34	\N
2694	Restaurante + Moradia T2 para Venda na Mourã	168Bt	275000	109.5		2	3	2022-02-11 22:38:50.990327	2022-02-11 22:38:50.990339	192.06	\N
2695	Moradia única e singular / Centro da cidade / Traça típica / 4 suites	14r9v	795000	815		2	3	2022-02-11 22:38:51.033026	2022-02-11 22:38:51.033033	200	\N
2696	Moradia T4 / Terreno 1900m2 / Piscina Aquecida / Jardim / Pousos	17ueF	\N	1900		2	3	2022-02-11 22:38:51.083097	2022-02-11 22:38:51.083105	370	\N
2697	Moradia individual térrea T4 (flD1783)	186Pg	320000	500		2	3	2022-02-11 22:38:51.131705	2022-02-11 22:38:51.131714	221	\N
2698	Moradia antiga para Restaurar	187l5	50000	\N		2	3	2022-02-11 22:38:51.171001	2022-02-11 22:38:51.171014	81	\N
2699	Moradia térrea 4quartos Isolada linhas direitas lote 650m2 zona verdes	17Gd0	350000	650		2	3	2022-02-11 22:38:51.210619	2022-02-11 22:38:51.210628	235	\N
2700	Moradia T3+1 / Construção Nova / Acabamentos Contemporâneos / Cortes	17Ar4	249500	371		2	3	2022-02-11 22:38:51.249466	2022-02-11 22:38:51.249473	161	\N
2701	Moradia T3 / Nova / Térrea / Acabamentos Contemporâneos / Cortes	17vpF	215000	150		2	3	2022-02-11 22:38:51.284142	2022-02-11 22:38:51.284149	84	\N
2702	Moradia de luxo V6 com piscina interior e sauna	15ZLD	650000	2223		2	3	2022-02-11 22:38:51.321402	2022-02-11 22:38:51.321411	760	\N
2703	Moradia / Remodelada / Térrea / Pousos	17PDX	67500	35		2	3	2022-02-11 22:38:51.36087	2022-02-11 22:38:51.360879	35	\N
2704	Moradia 4+1 quartos Leiria em zona tranquila com garagem na zona centr	17OOS	315000	325		2	3	2022-02-11 22:38:51.407015	2022-02-11 22:38:51.407023	223	\N
2705	Moradia T4 (flD1764)	185ln	350000	1670		2	3	2022-02-11 22:38:51.46024	2022-02-11 22:38:51.460247	190	\N
2706	Moradia V4+2 Casal dos Matos	17cmM	250000	280		2	3	2022-02-11 22:38:51.501632	2022-02-11 22:38:51.501641	200	\N
2707	Excelente Moradia T3	15RyF	600000	603		2	3	2022-02-11 22:38:51.558462	2022-02-11 22:38:51.558476	185.8	\N
2708	Moradia - 367 m² - T6	15rHr	689000	980		2	3	2022-02-11 22:38:51.600126	2022-02-11 22:38:51.600135	367	\N
2709	Moradia T5 para venda	180mg	407000	590		2	3	2022-02-11 22:38:51.63406	2022-02-11 22:38:51.634068	272	\N
2710	Excelente moradia T6 no centro da cidade	13LKl	550000	1138		2	3	2022-02-11 22:38:51.677695	2022-02-11 22:38:51.677702	262.55	\N
2711	Moradia em Zambujo Cortes	12in1	289000	811		2	3	2022-02-11 22:38:51.745889	2022-02-11 22:38:51.745896	321	\N
2712	Moradia de charme T6 em Leiria	Y1Wi	650000	2223		2	3	2022-02-11 22:38:52.001858	2022-02-11 22:38:52.00187	1223	\N
2713	Moradia Nova T5+1 Centro de Leiria	17UeS	650000	513		2	3	2022-02-11 22:38:52.038353	2022-02-11 22:38:52.038362	300	\N
2714	Moradia individual T4 térrea (flD1561B)	17Syp	350000	1000		2	3	2022-02-11 22:38:52.077617	2022-02-11 22:38:52.077627	200	\N
2715	MORADIA no Centro da Cidade de Leiria	16XcE	450000	78		2	3	2022-02-11 22:38:52.120203	2022-02-11 22:38:52.120213	168.4	\N
2716	Moradia T3+1 - Centro de Leiria	17cQR	450000	78		2	3	2022-02-11 22:38:52.257173	2022-02-11 22:38:52.25718	160	\N
2717	Moradia T4 nova com excelentes acabamentos em Pousos	16Xkk	400000	540		2	3	2022-02-11 22:38:52.287086	2022-02-11 22:38:52.287094	428	\N
2718	Moradia T5 | Leiria | Moderna	117Pj	356000	600		2	3	2022-02-11 22:38:52.344609	2022-02-11 22:38:52.344618	225	\N
2719	Moradia de Luxo T4 + 1, com Piscina Aquecida	17TSH	795000	2500		2	3	2022-02-11 22:38:52.380224	2022-02-11 22:38:52.38023	340	\N
2720	Moradia triplex T5 (flA1772)	17Q7v	\N	380		2	3	2022-02-11 22:38:52.474533	2022-02-11 22:38:52.474544	308	\N
2721	Moradia V4+2 Casal dos Matos	17cmN	250000	280		2	3	2022-02-11 22:38:52.512408	2022-02-11 22:38:52.512418	200	\N
2722	Moradia T4 em Leiria	14JmO	285000	296		2	3	2022-02-11 22:38:52.544695	2022-02-11 22:38:52.544704	167.7	\N
2723	Moradia Contemporânea de Luxo em Casal dos Matos	13fjv	660000	290		2	3	2022-02-11 22:38:52.574834	2022-02-11 22:38:52.574845	290	\N
2724	MORADIA T5	17xwQ	750000	836		2	3	2022-02-11 22:38:52.609018	2022-02-11 22:38:52.609026	360	\N
2725	Moradia V4 - Touria, Leiria	15b7u	400000	400		2	3	2022-02-11 22:38:52.654189	2022-02-11 22:38:52.654206	400	\N
2726	**Moradia Térrea c/ Piscina**	17hma	397500	1790		2	3	2022-02-11 22:38:52.705659	2022-02-11 22:38:52.705671	214	\N
2727	Moradia T3 para venda	18038	240000	2339		2	3	2022-02-11 22:38:52.754714	2022-02-11 22:38:52.75472	130	\N
2728	Moradia nos Pousos	17NBn	490000	237.71		2	3	2022-02-11 22:38:52.792758	2022-02-11 22:38:52.792766	189	\N
2729	Moradia Unifamiliar com piscina de água salgada	17NB6	700000	1216		2	3	2022-02-11 22:38:52.826611	2022-02-11 22:38:52.826619	451	\N
2730	Moradia Casal dos Matos - Leiria	14Sh8	365000	550		2	3	2022-02-11 22:38:52.86975	2022-02-11 22:38:52.869763	267	\N
2731	Moradia t-6 de luxo Cruz da Areia-Leiria	16SsR	650000	2223		2	3	2022-02-11 22:38:52.90235	2022-02-11 22:38:52.902357	300	\N
2732	Moradia T3+1 no centro Leiria, com garagem	16ACa	450000	78		2	3	2022-02-11 22:38:52.937851	2022-02-11 22:38:52.937862	185	\N
2733	Moradia T10 com piscina Leiria	10J6o	650000	2223		2	3	2022-02-11 22:38:52.977392	2022-02-11 22:38:52.977401	1200	\N
2734	MORADIA|VISTAS DESAFOGADAS|PROJETO APROVADO|LEIRIA	15zV1	79000	450		2	3	2022-02-11 22:38:53.026208	2022-02-11 22:38:53.026221	100	\N
2735	Moradia T6 a 3 minutos de Leiria	12nTV	308000	1388		2	3	2022-02-11 22:38:53.055886	2022-02-11 22:38:53.055894	404.77	\N
2736	Excelente moradia T6 +1	128iB	380000	\N		2	3	2022-02-11 22:38:53.085848	2022-02-11 22:38:53.085855	460	\N
2737	Moradia V7-  Com Piscina interior, Cruz Areia - LEIRIA	14X9p	650000	2223		2	3	2022-02-11 22:38:53.119464	2022-02-11 22:38:53.119476	350	\N
2738	Moradia T4 para venda	17NGx	590000	8796		2	3	2022-02-11 22:38:53.158665	2022-02-11 22:38:53.158674	280	\N
2739	Moradia T4+1 em Zambujo -Leiria	17MsV	330000	\N		2	3	2022-02-11 22:38:53.193713	2022-02-11 22:38:53.193729	213.8	\N
2740	Moradia isolada com piscina interior	17Gfd	650000	2223		2	3	2022-02-11 22:38:53.231175	2022-02-11 22:38:53.231183	761	\N
2741	Moradia 4Suites + Piscina	16c1f	497000	608		2	3	2022-02-11 22:38:53.265414	2022-02-11 22:38:53.265423	276	\N
2742	Moradia T5 de Luxo - Leiria	17JJH	\N	\N		2	3	2022-02-11 22:38:53.294834	2022-02-11 22:38:53.294847	371	\N
2743	Moradia Isolada T3 Venda em Leiria, Pousos, Barreira e Cortes,Leiria	13Onv	345000	500		2	3	2022-02-11 22:38:53.331583	2022-02-11 22:38:53.331594	142	\N
2744	Moradia Isolada T3 Venda em Leiria, Pousos, Barreira e Cortes,Leiria	13Ont	370000	500		2	3	2022-02-11 22:38:53.368741	2022-02-11 22:38:53.368753	160	\N
2745	Moradia Isolada T4 Venda em Leiria, Pousos, Barreira e Cortes,Leiria	P9Sj	370000	500		2	3	2022-02-11 22:38:53.468843	2022-02-11 22:38:53.468855	215	\N
2746	MORADIA UNIFAMILIAR T4 EM EXCELENTE ESTADO, NA QUINTA DO ...	180mU	285000	295		2	3	2022-02-11 22:38:53.507417	2022-02-11 22:38:53.507426	295	\N
2747	Moradia T6 Venda em Leiria, Pousos, Barreira e Cortes,Leiria	16S7b	380000	253		2	3	2022-02-11 22:38:53.539378	2022-02-11 22:38:53.539388	222	\N
2748	Moradia T3 + 1 - Centro Leiria	16A6D	450000	\N		2	3	2022-02-11 22:38:53.575052	2022-02-11 22:38:53.57506	160	\N
2749	Moradia V4, térrea e arquitetura moderna	17Yz0	350000	1056		2	3	2022-02-11 22:38:53.609252	2022-02-11 22:38:53.609261	170	\N
2750	Excelente Moradia em zona nobre nos arredores de Leiria	14tkW	850000	3962		2	3	2022-02-11 22:38:53.641292	2022-02-11 22:38:53.6413	260	\N
2751	Moradia Catedral Sustentável - Leiria	13VZg	299000	3000		2	3	2022-02-11 22:38:53.672149	2022-02-11 22:38:53.672157	310	\N
2752	Moradia em Banda T5 Venda em Leiria, Pousos, Barreira e Cortes,Leiria	EQUG	275000	135		2	3	2022-02-11 22:38:53.703832	2022-02-11 22:38:53.703843	235	\N
2753	Moradia para recuperar com projeto aprovado	17GeZ	45000	1330		2	3	2022-02-11 22:38:53.743053	2022-02-11 22:38:53.743063	115	\N
2754	Moradia de arquitectura singular com projecto aprovado pa...	17nTe	295000	2283.6		2	3	2022-02-11 22:38:53.778523	2022-02-11 22:38:53.778532	632.6	\N
2755	MORADIA T4 NOVA , LEIRIA	16nPX	285000	230		2	3	2022-02-11 22:38:53.815669	2022-02-11 22:38:53.81568	2	\N
2756	MORADIA V3+1|NOVA|VISTAS|PISCINA|CHAVE NA MÃO	13N5U	272000	450		2	3	2022-02-11 22:38:53.861626	2022-02-11 22:38:53.861639	180	\N
2757	MORADIA DE CHARME T5, LEIRIA COM 3.384M2 DE TERRENO	17Dx8	\N	3384		2	3	2022-02-11 22:38:53.914129	2022-02-11 22:38:53.914137	307.55	\N
2758	Moradia- T5 - Leiria	16Q8V	367500	\N		2	3	2022-02-11 22:38:53.947661	2022-02-11 22:38:53.947675	182	\N
2759	Moradia T4+1 - Pousos	13u76	285000	178		2	3	2022-02-11 22:38:54.005212	2022-02-11 22:38:54.005222	214	\N
2760	Moradia T4 Áreas Generosas	Zzs8	350000	1055		2	3	2022-02-11 22:38:54.043223	2022-02-11 22:38:54.043231	260	\N
2761	Moradia individual térrea T4 (flD1767)	17Guy	350000	650		2	3	2022-02-11 22:38:54.073856	2022-02-11 22:38:54.073864	235	\N
2762	Moradia V4 com 3 suites	14y2e	370000	500		2	3	2022-02-11 22:38:54.107924	2022-02-11 22:38:54.10793	215	\N
2763	Moradia Isolada T4 Venda em Leiria, Pousos, Barreira e Cortes,Leiria	13Onp	370000	500		2	3	2022-02-11 22:38:54.138795	2022-02-11 22:38:54.138803	215	\N
2764	Moradia Isolada T5 Venda em Leiria, Pousos, Barreira e Cortes,Leiria	13Onq	495000	1433		2	3	2022-02-11 22:38:54.172211	2022-02-11 22:38:54.172219	277	\N
2765	Moradia Isolada T4 Venda em Leiria, Pousos, Barreira e Cortes,Leiria	PngM	370000	565		2	3	2022-02-11 22:38:54.21123	2022-02-11 22:38:54.211239	209	\N
2766	Moradia Isolada T4 Venda em Leiria, Pousos, Barreira e Cortes,Leiria	P9SV	370000	623		2	3	2022-02-11 22:38:54.241566	2022-02-11 22:38:54.241573	175	\N
2767	Moradia Isolada T4 Venda em Leiria, Pousos, Barreira e Cortes,Leiria	P9ST	370000	663		2	3	2022-02-11 22:38:54.273985	2022-02-11 22:38:54.273992	192	\N
2768	Moradia Isolada T3+1 Venda em Leiria, Pousos, Barreira e Cortes,Leiria	Gi7e	360000	500		2	3	2022-02-11 22:38:54.309034	2022-02-11 22:38:54.309046	283	\N
2769	Moradia para reconstruir - Centro Histórico de Leiria	11ttR	350000	291		2	3	2022-02-11 22:38:54.347824	2022-02-11 22:38:54.347832	626	\N
2770	Moradia Geminada T4 em Leiria	14DYf	265000	\N		2	3	2022-02-11 22:38:54.382807	2022-02-11 22:38:54.382819	330	\N
2771	MORADIA PARA RESTAURAR EM REIXIDA, CORTES	17NCK	97500	130		2	3	2022-02-11 22:38:54.420428	2022-02-11 22:38:54.420439	100	\N
2772	MORADIA RECUPERADA T2, LEIRIA	17ePM	150000	\N		2	3	2022-02-11 22:38:54.454628	2022-02-11 22:38:54.454635	88	\N
2773	Moradia em lote urbano de 874 m2, composto por 5 apartamentos	178j7	495000	874		2	3	2022-02-11 22:38:54.488513	2022-02-11 22:38:54.488523	224	\N
2774	Moradia T3+1 - Leiria	16EB0	239000	\N		2	3	2022-02-11 22:38:54.520945	2022-02-11 22:38:54.520953	250	\N
2775	Sr Investidor!! Oportunidade	16pJL	350000	590		2	3	2022-02-11 22:38:54.553886	2022-02-11 22:38:54.553898	222	\N
2776	Moradia - Oportunidade!	13fmw	75000	66.5		2	3	2022-02-11 22:38:54.582308	2022-02-11 22:38:54.582319	66.5	\N
2777	Moradia T3 / Totalmente Remodelada / Vista Castelo / Centro da Cidade	185JK	285000	273		2	4	2022-02-12 14:09:22.439097	2022-02-12 14:09:22.439112	158	\N
2778	Moradia para recuperar, Gândara dos Olivais, Leiria	16GQC	240000	982		2	4	2022-02-12 14:09:22.570871	2022-02-12 14:09:22.570879	260	\N
2779	Moradia T4 para Venda em Marrazes	16Xfk	260000	91.28		2	4	2022-02-12 14:09:22.644173	2022-02-12 14:09:22.644238	138.5	\N
2780	Moradia T3 /  Para Reconstrução / Lote 542 m2 / Leiria	16wYz	110000	542		2	4	2022-02-12 14:09:22.695161	2022-02-12 14:09:22.695171	110	\N
2781	Moradia V4 nova e isolada em Leiria	17Gf7	285000	330		2	4	2022-02-12 14:09:22.806522	2022-02-12 14:09:22.806536	145	\N
2782	Venda de Moradia V4+1 térrea, isolada c/ jardim, Mindelo,Vila do Cond	17gU5	890000	\N		2	4	2022-02-12 14:09:22.863287	2022-02-12 14:09:22.863297	3000	\N
2783	Moradia T3+1 / Garagem / Terreno / Gândara dos Olivais / Leiria	17ghu	189000	820		2	4	2022-02-12 14:09:23.047759	2022-02-12 14:09:23.047769	240	\N
2784	Moradia T6 / Sismaria / Leiria	16VPB	400000	731		2	4	2022-02-12 14:09:23.56577	2022-02-12 14:09:23.565781	395	\N
2785	A 5 minutos do centro de Leiria	16UOb	46000	\N		2	4	2022-02-12 14:09:23.606786	2022-02-12 14:09:23.606792	80	\N
2786	Moradia T3 + T1 / Logradouro / Rentabilidade 5% / Centro de Leiria	15Xzn	138800	91		2	4	2022-02-12 14:09:23.63563	2022-02-12 14:09:23.635637	135	\N
2787	Moradia T4/ Marrazes / Leiria	17yq8	225000	19		2	4	2022-02-12 14:09:23.669099	2022-02-12 14:09:23.669107	150	\N
2788	Moradia T3 / isolada / terreno 560 m2 / Gândara / Leiria	172Z9	195000	650		2	4	2022-02-12 14:09:23.704413	2022-02-12 14:09:23.70442	187	\N
2789	Moradia Térrea para recuperar em Leiria	16hqh	210000	1685		2	4	2022-02-12 14:09:23.738372	2022-02-12 14:09:23.73838	353.5	\N
2790	Moradia Geminada, 234m2, Gandara De Olivais	17AtR	187000	\N		2	4	2022-02-12 14:09:23.776747	2022-02-12 14:09:23.776762	147	\N
2791	Moradia T2+2 em Gândara dos Olivais - Leiria	17cRK	65000	120		2	4	2022-02-12 14:09:23.81458	2022-02-12 14:09:23.814589	92	\N
2792	Moradia junto as margens do rio Lis	152Yx	289000	\N		2	4	2022-02-12 14:09:23.8526	2022-02-12 14:09:23.852608	321	\N
2793	Moradia T7 Leiria com Vista Castelo	15cCK	630000	585		2	4	2022-02-12 14:09:23.889919	2022-02-12 14:09:23.889927	232	\N
2794	Moradia T5+1 – Sismaria – Marrazes / Leiria	16NMb	400000	395		2	4	2022-02-12 14:09:23.922513	2022-02-12 14:09:23.922523	395	\N
2795	Moradia - 299 m² - T6	17Dje	250000	1380		2	4	2022-02-12 14:09:23.967352	2022-02-12 14:09:23.96736	299	\N
2796	Moradia - 172 m² - T4	17glp	330000	748		2	4	2022-02-12 14:09:24.003331	2022-02-12 14:09:24.003339	172	\N
2797	Moradia - 248 m² - T4	16KK1	280000	487		2	4	2022-02-12 14:09:24.043001	2022-02-12 14:09:24.043009	248	\N
2798	Moradia térrea/Reconstrução/Terreno/Marrazes e Barosa	17ZsX	98500	390		2	4	2022-02-12 14:09:24.07717	2022-02-12 14:09:24.077185	70.91	\N
2799	Moradia individual T3+1 (flD1775)	17SvG	285000	330		2	4	2022-02-12 14:09:24.115502	2022-02-12 14:09:24.115509	145	\N
2800	Moradia T4/ Bairro das Almoínhas / Leiria	17yq7	115000	\N		2	4	2022-02-12 14:09:24.157509	2022-02-12 14:09:24.157532	100	\N
2801	Moradia T3 para reconstruir / Barosa / Leiria	17duy	36000	104		2	4	2022-02-12 14:09:24.208266	2022-02-12 14:09:24.208274	64	\N
2802	Moradia térrea para restaurar / Marrazes / Leiria	16ZTZ	85000	100		2	4	2022-02-12 14:09:24.247588	2022-02-12 14:09:24.247596	80	\N
2803	Moradia com terreno nos Pinheiros	16t85	80000	1095		2	4	2022-02-12 14:09:24.281869	2022-02-12 14:09:24.28188	221	\N
2804	Moradia T4 - Leiria	15b2R	185000	142		2	4	2022-02-12 14:09:24.336602	2022-02-12 14:09:24.336609	102	\N
2805	Moradia T3, em Marrazes, Leiria	13vI8	160000	2000		2	4	2022-02-12 14:09:24.385393	2022-02-12 14:09:24.385847	213	\N
2806	Moradia T5, Gândara dos Olivais, em Leiria	137o6	135000	80		2	4	2022-02-12 14:09:24.429278	2022-02-12 14:09:24.429294	220	\N
2807	Moradia T5 para venda	17NEn	575000	630		2	4	2022-02-12 14:09:24.46983	2022-02-12 14:09:24.469839	360	\N
2808	Moradia Individual NOVA a 5 minutos do Centro de Leiria	15GlV	285000	329.5		2	4	2022-02-12 14:09:24.516612	2022-02-12 14:09:24.516621	206.3	\N
2809	Moradia Isolada T4 Venda em Marrazes e Barosa,Leiria	14q2g	280000	487		2	4	2022-02-12 14:09:24.550939	2022-02-12 14:09:24.55095	248	\N
2810	Moradia T4 geminada (flD1781)	17WA4	275000	312		2	4	2022-02-12 14:09:24.598498	2022-02-12 14:09:24.598506	200	\N
2811	Moradia T5 para venda	17NH4	950000	14850		2	4	2022-02-12 14:09:24.644516	2022-02-12 14:09:24.644613	308	\N
2812	Moradia T5 para venda	17tOI	400000	1170		2	4	2022-02-12 14:09:24.68244	2022-02-12 14:09:24.682447	326	\N
2813	Moradias Unifamiliares de R/Chão Tipo T3 - Picheleiro -Para Construção	16hlT	\N	\N		2	4	2022-02-12 14:09:24.722021	2022-02-12 14:09:24.72203	190	\N
2814	Duas moradias para restaurar, nos Marrazes, Leiria	133h9	165000	\N		2	4	2022-02-12 14:09:24.764319	2022-02-12 14:09:24.764326	850	\N
2815	Moradia Geminada - Marrazes - Leiria	17VHA	265000	311		2	4	2022-02-12 14:09:24.800779	2022-02-12 14:09:24.800789	183	\N
2816	Moradia Individual Térrea T4 - Leiria	17vpK	175000	456		2	4	2022-02-12 14:09:24.837399	2022-02-12 14:09:24.837408	129	\N
2817	MORADIA UNIFAMILIAR T4 DE ARQUITETURA CONTEMPORÂNEA NOVA	15gSu	285000	330		2	4	2022-02-12 14:09:24.87184	2022-02-12 14:09:24.871847	220	\N
2818	Moradia tipo T1+1 (flA1774)	17Sry	110000	\N		2	4	2022-02-12 14:09:24.912423	2022-02-12 14:09:24.91243	60	\N
2819	Moradia T4 Venda em Marrazes e Barosa,Leiria	17t00	280000	487		2	4	2022-02-12 14:09:24.951661	2022-02-12 14:09:24.95167	248	\N
2820	Moradia Unifamiliar para Venda. Venha Conhecer!!!	171nq	288000	\N		2	4	2022-02-12 14:09:24.986997	2022-02-12 14:09:24.987006	390	\N
2821	Moradia T4 nova, a 5 minutos de Leiria	15XCR	285000	330		2	4	2022-02-12 14:09:25.02345	2022-02-12 14:09:25.023461	145	\N
2822	Moradia t2+1 - Gândara dos Olivais	15WCb	180000	131.5		2	4	2022-02-12 14:09:25.061002	2022-02-12 14:09:25.061011	131.5	\N
2823	Moradia Unifamiliar T4 de Arquitetura Contemporânea	15Ma4	285000	330		2	4	2022-02-12 14:09:25.109595	2022-02-12 14:09:25.109604	145	\N
2824	Moradia T3 Individual - Parceiros	17vtw	185000	343		2	4	2022-02-12 14:09:25.152009	2022-02-12 14:09:25.152019	220	\N
2825	Moradia T3 para venda	1822f	235000	290		2	4	2022-02-12 14:09:25.207668	2022-02-12 14:09:25.207678	256	\N
2826	Moradia T4 para venda	17NFx	305000	840.75		2	4	2022-02-12 14:09:25.251382	2022-02-12 14:09:25.251389	191.52	\N
2827	Moradia V3 em construção a 5min do centro de Leiria!	181xE	265000	316.8		2	4	2022-02-12 14:09:25.286226	2022-02-12 14:09:25.286233	156	\N
2828	Moradia T2 em Leiria	17WZl	49000	\N		2	4	2022-02-12 14:09:25.358916	2022-02-12 14:09:25.358924	142	\N
2829	Moradia T6 Venda em Marrazes e Barosa,Leiria	18003	180000	550		2	4	2022-02-12 14:09:25.398543	2022-02-12 14:09:25.398551	300	\N
2830	Moradia Unifamiliar T3 NOVA	17Uwr	265000	\N		2	4	2022-02-12 14:09:25.438796	2022-02-12 14:09:25.438804	156	\N
2831	Moradia T7 para venda	17CF6	230000	449.71		2	4	2022-02-12 14:09:25.483529	2022-02-12 14:09:25.483537	360	\N
2832	Moradia Rústica T2 Venda em Marrazes e Barosa,Leiria	15gtM	80000	1070		2	4	2022-02-12 14:09:25.531996	2022-02-12 14:09:25.532004	120	\N
2833	Moradias em LSF T1 / T2 / T3 / T4	LH4P	60000	\N		2	4	2022-02-12 14:09:25.585099	2022-02-12 14:09:25.585111	50	\N
2834	Moradia T4 - Marrazes, Leiria	17MvX	260000	\N		2	4	2022-02-12 14:09:25.63743	2022-02-12 14:09:25.637438	139	\N
2835	Moradia Isolada T5 Venda em Marrazes e Barosa,Leiria	14qsA	250000	695		2	4	2022-02-12 14:09:25.675613	2022-02-12 14:09:25.675622	310	\N
2836	Moradia T4+1 Venda em Marrazes e Barosa,Leiria	14Ski	255000	162		2	4	2022-02-12 14:09:25.758646	2022-02-12 14:09:25.758656	208	\N
2837	Moradia unifamiliar de Tipologia T3 localizada em Leiria-Gare	10cVA	250000	\N		2	4	2022-02-12 14:09:25.807029	2022-02-12 14:09:25.807041	298	\N
2838	Moradia com 4 Quartos em Gândara dos Olivais /Marrazes/ Leiria	168Bz	255000	330		2	4	2022-02-12 14:09:25.858694	2022-02-12 14:09:25.858701	208	\N
2839	Moradia com 4 quartos em Gândara dos Olivais /Marrazes/ Leiria	167OA	255000	330		2	4	2022-02-12 14:09:25.897632	2022-02-12 14:09:25.89764	208	\N
2840	Moradia T3 em construção - Gandara -  Leiria	13T41	250000	255.4		2	4	2022-02-12 14:09:25.937669	2022-02-12 14:09:25.937676	144	\N
2841	Vende-se MORADIA T5, com terreno, no centro de Leiria	15CRQ	280000	419		2	4	2022-02-12 14:09:25.98372	2022-02-12 14:09:25.983729	272	\N
2842	Moradia T3, térrea, em Marrazes, Leiria.	135WD	58000	202		2	4	2022-02-12 14:09:26.030867	2022-02-12 14:09:26.030876	152	\N
2843	Moradia T4 - Marrazes, Leiria	17MvY	260000	\N		2	4	2022-02-12 14:09:26.115666	2022-02-12 14:09:26.115675	139	\N
2844	Moradia T4 em construção,  Arquitetura Moderna	16JkJ	280000	396		2	4	2022-02-12 14:09:26.168843	2022-02-12 14:09:26.168862	215	\N
2845	Moradia T4 Nova - Condomínio fechado	16VtB	280000	396		2	4	2022-02-12 14:09:26.254547	2022-02-12 14:09:26.254559	215	\N
2846	Moradia T5 em Leiria	13tsD	280000	550		2	4	2022-02-12 14:09:26.30607	2022-02-12 14:09:26.306079	208	\N
2847	Venda Moradia T3	126FH	250000	304		2	4	2022-02-12 14:09:26.347531	2022-02-12 14:09:26.347539	304	\N
2848	Moradia T3+1 Venda em Marrazes e Barosa,Leiria	17ro9	260000	\N		2	4	2022-02-12 14:09:26.388513	2022-02-12 14:09:26.388524	138.5	\N
2849	Moradia T4 em construção - Arquitectura Moderna.	16JkF	300000	663		2	4	2022-02-12 14:09:26.430244	2022-02-12 14:09:26.43025	219	\N
2850	Moradia T3 para venda em Leiria	135WC	345000	800		2	4	2022-02-12 14:09:26.467159	2022-02-12 14:09:26.46717	347	\N
2851	Moradia Isolada T1+1 Venda em Marrazes e Barosa,Leiria	17WN0	106000	47		2	4	2022-02-12 14:09:26.508219	2022-02-12 14:09:26.508228	47	\N
2852	Moradia t2 Pombal	17QvD	111449	\N		2	4	2022-02-12 14:09:26.549812	2022-02-12 14:09:26.54982	80	\N
2853	Moradia - 147 m² - T4	186SZ	187000	200		2	4	2022-02-12 14:09:26.609003	2022-02-12 14:09:26.609012	147	\N
2854	Moradia Térrea em Barosa	173IV	295000	\N		2	4	2022-02-12 14:09:26.673238	2022-02-12 14:09:26.67325	335	\N
2855	Vende-se terreno com 2 habitações, 2 frentes - Pinheiros - Leiria	15CRH	98000	1100		2	4	2022-02-12 14:09:26.729461	2022-02-12 14:09:26.729469	1100	\N
2856	Moradia térrea isolada em Leiria num lote com aproximadamente 500m2	17QFF	250000	492		2	5	2022-02-12 15:09:25.711296	2022-02-12 15:09:25.71131	176	\N
2857	Moradia T5 para Venda na Ortigosa	1561M	320000	726		2	5	2022-02-12 15:09:25.750756	2022-02-12 15:09:25.750775	304	\N
2858	Moradia T2	17KlG	125000	\N		2	5	2022-02-12 15:09:25.885268	2022-02-12 15:09:25.885275	56	\N
2859	Moradia T3; Unifamiliar; Logradouro; Ortigosa; Leiria	176jt	119000	458.5		2	5	2022-02-12 15:09:25.927049	2022-02-12 15:09:25.927058	151	\N
2860	Moradia para restaurar/ Várzeas / Ortigosa	1668z	45000	301		2	5	2022-02-12 15:09:25.961059	2022-02-12 15:09:25.961071	164	\N
2861	Moradia - 406 m² - T5	17Wxv	800000	21481		2	5	2022-02-12 15:09:25.996646	2022-02-12 15:09:25.996747	406	\N
2862	Moradia T4 Venda em Souto da Carpalhosa e Ortigosa,Leiria	16ruy	410000	1120		2	5	2022-02-12 15:09:26.030398	2022-02-12 15:09:26.030406	294	\N
2863	Moradia - 310 m² - T3	17hZ6	120000	6000		2	5	2022-02-12 15:09:26.074103	2022-02-12 15:09:26.074111	310	\N
2864	Moradia - Souto da Carpalhosa	11KkZ	370000	4117		2	5	2022-02-12 15:09:26.105008	2022-02-12 15:09:26.105015	283	\N
2865	Fantástica Moradia T5 C/ piscinas S. da Carpalhosa	17NAz	430000	4117		2	5	2022-02-12 15:09:26.196076	2022-02-12 15:09:26.196082	283	\N
2866	Moradia T3 / Unifamiliar / Ortigosa / Leiria	17RKw	83000	598		2	5	2022-02-12 15:09:26.263416	2022-02-12 15:09:26.263424	235	\N
2867	Moradia T3 NOVA - Lameira, Leiria	17Uws	229000	300		2	5	2022-02-12 15:09:26.308033	2022-02-12 15:09:26.308049	140	\N
2868	Moradia Isolada T3	177xR	78000	\N		2	5	2022-02-12 15:09:26.348022	2022-02-12 15:09:26.34813	105	\N
2869	Moradia térrea a 10 minutos da praia da vieira	16Msc	350000	1195		2	5	2022-02-12 15:09:26.409368	2022-02-12 15:09:26.409378	271	\N
2870	Moradia Individual T4	17sh4	248000	400		2	5	2022-02-12 15:09:26.483947	2022-02-12 15:09:26.483957	185	\N
2871	Moradia T4 em Construção - Monte Real	186Y1	235000	410		2	6	2022-02-12 15:09:28.716623	2022-02-12 15:09:28.716632	171	\N
2872	Moradia T4 próximo Termas de Monte Real	11I2G	325000	\N		2	6	2022-02-12 15:09:28.763147	2022-02-12 15:09:28.763154	329	\N
2873	Casa de Campo Moradia T4	13u2K	209000	\N		2	6	2022-02-12 15:09:28.811597	2022-02-12 15:09:28.811612	153	\N
2874	Casa antiga + Terreno - Granja, Monte Real	17jFH	65000	1279		2	6	2022-02-12 15:09:28.845204	2022-02-12 15:09:28.845211	63	\N
2875	Terreno e projeto p/ moradia- Zona Monte Real	16UEa	45000	968		2	6	2022-02-12 15:09:28.880351	2022-02-12 15:09:28.880361	183	\N
2876	Moradia V4 - Monte Real	17KCt	209000	\N		2	6	2022-02-12 15:09:28.922063	2022-02-12 15:09:28.92207	153	\N
2877	Moradia T5 c/piscina, terreno c/+-1600m2. Zona Monte Real	15XWi	498000	1600		2	6	2022-02-12 15:09:28.959843	2022-02-12 15:09:28.959859	382	\N
2878	Moradia T4 para remodelar / Terreno / Poço / Carvide	17SjO	75000	1579		2	6	2022-02-12 15:09:28.997586	2022-02-12 15:09:28.997602	98	\N
2879	Moradia Individual T3 térrea (flD1750)	17ufg	285000	968		2	6	2022-02-12 15:09:29.033088	2022-02-12 15:09:29.033096	160	\N
2880	Moradia geminada T3+1 (flA1533B)	17jcc	240000	430		2	6	2022-02-12 15:09:29.076166	2022-02-12 15:09:29.076174	150	\N
2881	Moradia - Monte Real	15UKt	390000	600		2	6	2022-02-12 15:09:29.109422	2022-02-12 15:09:29.109431	335.1	\N
2882	Moradia V5 - Monte Real	17KpZ	240000	1420		2	6	2022-02-12 15:09:29.190552	2022-02-12 15:09:29.190563	215	\N
2883	Moradia V4 - Monte Real	17Fe3	325000	876		2	6	2022-02-12 15:09:29.234794	2022-02-12 15:09:29.234801	375	\N
2884	Moradia T3 para Venda	17NDG	210000	1107		2	6	2022-02-12 15:09:29.272251	2022-02-12 15:09:29.27226	145	\N
2885	Oportunidade! Moradia V4+5 | Monte Real, Leiria	17TaJ	325000	876		2	6	2022-02-12 15:09:29.31674	2022-02-12 15:09:29.316747	400	\N
2886	Moradia V3, Carvide	15faL	188000	2400		2	6	2022-02-12 15:09:29.360826	2022-02-12 15:09:29.360837	117	\N
2887	Moradia com 7 quartos, com terreno, em Monte Real, Leiria	133ha	280000	2850		2	6	2022-02-12 15:09:29.410919	2022-02-12 15:09:29.410927	200	\N
2888	Moradia T4 em Construção - Monte Real	185mM	\N	410		2	6	2022-02-12 15:09:29.441855	2022-02-12 15:09:29.441863	171	\N
2889	Moradia Isolada T8	115Kg	280000	\N		2	6	2022-02-12 15:09:29.472199	2022-02-12 15:09:29.472207	227	\N
2890	Moradia Isolada T3	15JTE	251500	\N		2	6	2022-02-12 15:09:29.507804	2022-02-12 15:09:29.507812	138	\N
2891	Casa térrea T2 para recuperar na zona de Carvide	17c8B	65000	1000		2	6	2022-02-12 15:09:29.542891	2022-02-12 15:09:29.542901	60	\N
2892	Casa térrea T3 para recuperar no centro de Carvide.	17c3P	65000	490		2	6	2022-02-12 15:09:29.574063	2022-02-12 15:09:29.574085	75	\N
2893	Casa térrea T3 no Lameiro / Vieira de Leiria	171rN	86500	1100		2	6	2022-02-12 15:09:29.636318	2022-02-12 15:09:29.636329	170	\N
2894	Moradias T3 +1 na zona de Monte Real	16nFw	255000	550		2	6	2022-02-12 15:09:29.6741	2022-02-12 15:09:29.674108	160	\N
2895	Casa antiga V3 - Monte Real	15Lka	112500	279		2	6	2022-02-12 15:09:29.710311	2022-02-12 15:09:29.710318	72	\N
2896	Moradia com piscina T3 nos Moinhos de Carvide	13SGv	289000	1540		2	6	2022-02-12 15:09:29.742141	2022-02-12 15:09:29.742148	190	\N
2897	Casa antiga T3 em Monte Real	13ZEC	107000	878		2	6	2022-02-12 15:09:29.783795	2022-02-12 15:09:29.78381	72	\N
2898	Moradia térrea em Moinhos de Carvide	17c3A	\N	2562		2	6	2022-02-12 15:09:29.819407	2022-02-12 15:09:29.819415	232	\N
2899	Moradia T4 em construção	FxHd	235000	417		2	6	2022-02-12 15:09:29.854956	2022-02-12 15:09:29.854964	224.4	\N
2900	Moradia independente em Monte-Real	105ij	200000	\N		2	6	2022-02-12 15:09:29.887256	2022-02-12 15:09:29.887262	566.95	\N
2901	Moradia para Restaurar T3 Venda em Monte Real e Carvide,Leiria	16k2Y	86500	1122		2	6	2022-02-12 15:09:29.931393	2022-02-12 15:09:29.9314	178	\N
2902	Casa antiga para recuperar no Boco - Carvide	17I0H	100000	2082		2	6	2022-02-12 15:09:30.021242	2022-02-12 15:09:30.021249	204	\N
2903	Moradia isolada 5 quartos em Carvide	12A2a	\N	430		2	6	2022-02-12 15:09:30.05571	2022-02-12 15:09:30.055724	279.5	\N
2904	Casa - Ruína em Moinhos de Carvide	Vs8M	28000	458		2	6	2022-02-12 15:09:30.094411	2022-02-12 15:09:30.094419	80	\N
2905	Moradia de rés de chão T3, a necessitar de  algumas obras de restau...	16xCb	87900	1122		2	6	2022-02-12 15:09:30.129639	2022-02-12 15:09:30.129647	63	\N
2906	Moradia T3 | Espaços Exterior | Exposição solar	142TT	259000	171.56		2	7	2022-02-12 15:09:31.316181	2022-02-12 15:09:31.316192	171.56	\N
2907	MORADIA T4 Individual Semi Nova - Bidoeira de Cima	16cvj	320000	1300		2	7	2022-02-12 15:09:31.359813	2022-02-12 15:09:31.359825	212	\N
2908	Moradia individual- Bidoeira de Cima	14bUp	249000	1520		2	7	2022-02-12 15:09:31.427425	2022-02-12 15:09:31.427438	475	\N
2909	Moradia Unifamiliar de luxo-  Bidoeira de Cima.	179cf	399000	1320		2	7	2022-02-12 15:09:31.465623	2022-02-12 15:09:31.46563	407	\N
2910	Moradia T4 para venda	17NDJ	265000	1645		2	7	2022-02-12 15:09:31.503586	2022-02-12 15:09:31.503595	178.7	\N
2911	Moradia V2 - Bidoeira, Leiria	14Tt2	76000	1848		2	7	2022-02-12 15:09:31.549372	2022-02-12 15:09:31.549379	75	\N
2912	Moradia T3 / Para Remodelar / Terreno 1462m2 / Leiria	183my	47000	1462		2	8	2022-02-12 15:09:33.928438	2022-02-12 15:09:33.928447	126	\N
2913	Moradia individual	17eYq	117000	\N		2	8	2022-02-12 15:09:34.348656	2022-02-12 15:09:34.348672	206	\N
2914	Moradia T5 / Térrea / Piso Radiante / Jardim / Colmeias	16IoC	399000	2800		2	8	2022-02-12 15:09:34.38146	2022-02-12 15:09:34.381468	353	\N
2915	Moradia com terreno poço e árvores de fruto em zona tranq...	13Hnl	85000	\N		2	8	2022-02-12 15:09:34.420238	2022-02-12 15:09:34.420249	53	\N
2916	Moradia T3 para restauro / Lameiria / Colmeias/ Leiria	16w09	79000	1260		2	8	2022-02-12 15:09:34.453287	2022-02-12 15:09:34.453297	140	\N
2917	Casa Antiga para remodelação em Lourais, Colmeias	12DMC	50000	\N		2	8	2022-02-12 15:09:34.484415	2022-02-12 15:09:34.484423	840	\N
2918	Quinta na chumbaria - Privacidade e Sossego	17WTR	139950	3530		2	8	2022-02-12 15:09:34.52882	2022-02-12 15:09:34.528828	100	\N
2919	Moradia para recuperar em Colmeias	17NBQ	35000	220		2	8	2022-02-12 15:09:34.57473	2022-02-12 15:09:34.574737	55	\N
2920	Casal do Toco - Para recuperar - Descida de preço!	10x2L	49920	1590		2	8	2022-02-12 15:09:34.602762	2022-02-12 15:09:34.602771	100	\N
2921	Moradia T2 para venda	17xtz	168500	7232		2	8	2022-02-12 15:09:34.636233	2022-02-12 15:09:34.636247	168	\N
2922	Moradia com terreno- Baixa de preço!!	Rcxu	36000	1535		2	8	2022-02-12 15:09:34.665932	2022-02-12 15:09:34.665944	190	\N
2923	Casa de rés-do-chão	17S6K	68000	967		2	8	2022-02-12 15:09:34.700447	2022-02-12 15:09:34.700454	967	\N
2924	Moradia Térrea T3, Leiria	184TC	220000	620		2	8	2022-02-12 15:09:34.733101	2022-02-12 15:09:34.733111	128	\N
2925	Moradia T2 para venda	17xii	73000	\N		2	8	2022-02-12 15:09:34.770759	2022-02-12 15:09:34.770773	117	\N
2926	Moradia - 90 m² - T2	17Gbr	68500	670		2	8	2022-02-12 15:09:34.817312	2022-02-12 15:09:34.817323	90	\N
2927	Moradia T4 para venda	17xjn	24500	4070		2	8	2022-02-12 15:09:34.858457	2022-02-12 15:09:34.858466	4070	\N
2928	Moradia Térrea T3, Leiria	1846M	220000	620		2	8	2022-02-12 15:09:34.894314	2022-02-12 15:09:34.894326	128	\N
2929	Moradia T3 para venda	17WRI	248000	900		2	8	2022-02-12 15:09:34.940762	2022-02-12 15:09:34.940778	150	\N
2930	Moradia T2 para venda	17NFG	67000	4138.5		2	8	2022-02-12 15:09:34.982431	2022-02-12 15:09:34.982443	49.5	\N
2931	Moradia Unifamiliar Térrea com cave - NOVA	17EUm	220000	650		2	8	2022-02-12 15:09:35.024555	2022-02-12 15:09:35.024565	164	\N
2932	Moradia Isolada T2 Venda em Colmeias e Memória,Leiria	17oUQ	95000	214		2	8	2022-02-12 15:09:35.063896	2022-02-12 15:09:35.063904	64	\N
2933	Moradia para reconstrução com anexos e terreno	17NAV	65000	5590		2	8	2022-02-12 15:09:35.094673	2022-02-12 15:09:35.094689	60	\N
2934	Moradia - 113 m² - T2	13XeU	131900	2600		2	8	2022-02-12 15:09:35.13006	2022-02-12 15:09:35.130081	113	\N
2935	Moradia para reconstruir - Memória	15m1d	82900	2000		2	8	2022-02-12 15:09:35.170343	2022-02-12 15:09:35.170361	250	\N
2936	Casa + terreno para venda	12jHo	68500	\N		2	8	2022-02-12 15:09:35.209902	2022-02-12 15:09:35.209918	90	\N
2937	Moradia T4 +1	17DAk	319000	\N		2	9	2022-02-12 15:09:36.648471	2022-02-12 15:09:36.64848	198	\N
2938	Moradia T4 unifamiliar / 3 pisos / Milagres	17c7k	349000	501		2	9	2022-02-12 15:09:36.684226	2022-02-12 15:09:36.684236	402	\N
2939	Moradia T4; unifamiliar; piscina interior; terreno; Milagres.	17ajV	449000	1069		2	9	2022-02-12 15:09:36.717296	2022-02-12 15:09:36.717397	320	\N
2940	Moradia para reconstruir / Terreno / Poço / Milagres	17aEt	83000	300		2	9	2022-02-12 15:09:36.759619	2022-02-12 15:09:36.759634	143	\N
2941	Moradia para reconstruir / Terreno / Poço / Milagres	17ajU	98000	820		2	9	2022-02-12 15:09:36.880007	2022-02-12 15:09:36.880017	56	\N
2942	Moradia-T3- Leiria	17rL5	90000	\N		2	9	2022-02-12 15:09:36.924219	2022-02-12 15:09:36.924227	172.45	\N
2943	Moradia V4 - Oportunidade	17ZLr	317500	273		2	9	2022-02-12 15:09:36.968762	2022-02-12 15:09:36.968772	260	\N
2944	Moradia - 173 m² - T2	16Vqq	90000	820		2	9	2022-02-12 15:09:37.010266	2022-02-12 15:09:37.010277	173	\N
2945	Moradia para recuperar	17wQa	65000	1958		2	9	2022-02-12 15:09:37.111464	2022-02-12 15:09:37.111471	72	\N
2946	Moradia T6 Venda em Milagres,Leiria	15C15	125000	220		2	9	2022-02-12 15:09:37.213771	2022-02-12 15:09:37.213785	190	\N
2947	Moradia T4 - Milagres-Leiria	17pg9	75000	\N		2	9	2022-02-12 15:09:37.254289	2022-02-12 15:09:37.2543	189.5	\N
2948	House/Villa/Residential em Leiria, Leiria REF:1105	14hM4	11550	100		2	9	2022-02-12 15:09:37.296939	2022-02-12 15:09:37.296955	100	\N
2949	Moradia para recuperar, Milagres	13vej	100000	820		2	9	2022-02-12 15:09:37.327209	2022-02-12 15:09:37.327217	173	\N
3063	Moradia T3 para venda	17NFT	50000	500		2	14	2022-02-12 16:50:03.336445	2022-02-12 16:50:03.336456	42	\N
2950	Moradia em ruínas com 100 m2, localizada na freguesia de ...	ZvNQ	11550	100		2	9	2022-02-12 15:09:37.363661	2022-02-12 15:09:37.363668	100	\N
2951	Moradia T3 Geminada em construção para Venda em Amor	17i9x	235000	284		2	10	2022-02-12 15:09:38.532508	2022-02-12 15:09:38.532515	171	\N
2952	Moradia T3 Geminada em construção para Venda em Amor	17i9y	245000	315.9		2	10	2022-02-12 15:09:38.566813	2022-02-12 15:09:38.566824	167	\N
2953	Moradia V4+2, apenas a 5 minutos de Leiria	17GJS	330000	637		2	10	2022-02-12 15:09:38.598718	2022-02-12 15:09:38.598733	251	\N
2954	Moradia T3 Amor	1713z	245000	\N		2	10	2022-02-12 15:09:38.634877	2022-02-12 15:09:38.63489	210	\N
2955	Moradia T3 Amor	1713y	235000	\N		2	10	2022-02-12 15:09:38.670987	2022-02-12 15:09:38.671005	210	\N
2956	Moradia de requinte com piscina interior	14xKT	325000	\N		2	10	2022-02-12 15:09:38.702913	2022-02-12 15:09:38.70292	300	\N
2957	Moradia individual T4 (flA1777)	17UHV	\N	1046		2	10	2022-02-12 15:09:38.745742	2022-02-12 15:09:38.745749	230	\N
2958	Moradia Geminada T3 NOVA - Amor, Leiria	17Few	235000	284		2	10	2022-02-12 15:09:38.798321	2022-02-12 15:09:38.798327	171	\N
2959	Moradia Geminada NOVA - Amor, Leiria	17EpC	245000	316		2	10	2022-02-12 15:09:38.85419	2022-02-12 15:09:38.854197	167	\N
2960	Moradia T3 para venda	17NGY	245000	\N		2	10	2022-02-12 15:09:38.889481	2022-02-12 15:09:38.889489	316	\N
2961	Moradia T3 para venda	17NGF	235000	\N		2	10	2022-02-12 15:09:38.987181	2022-02-12 15:09:38.987196	300	\N
2962	Moradia V3 - Geminada pela Garagem	17yNM	230000	285		2	10	2022-02-12 15:09:39.029448	2022-02-12 15:09:39.029459	186	\N
2963	Moradia Individual T3 + 2 - AMOR - Leiria	180pd	250000	982		2	10	2022-02-12 15:09:39.068262	2022-02-12 15:09:39.068274	270	\N
2964	Moradia V3 - Geminada pela Garagem	17yNN	230000	414		2	10	2022-02-12 15:09:39.110215	2022-02-12 15:09:39.110222	186	\N
2965	Moradia V3 - Geminada pela Garagem	17yNO	230000	363		2	10	2022-02-12 15:09:39.142403	2022-02-12 15:09:39.142417	186	\N
2966	Moradia T4 Para recuperar	16XWA	89500	325		2	10	2022-02-12 15:09:39.223417	2022-02-12 15:09:39.223428	105	\N
2967	Moradia Geminada T3 Venda em Amor,Leiria	17Lz0	245000	\N		2	10	2022-02-12 15:09:39.263362	2022-02-12 15:09:39.263371	226	\N
2968	Venda Moradia T3	126hh	47500	550		2	10	2022-02-12 15:09:39.303653	2022-02-12 15:09:39.303662	330	\N
2969	Moradia para restaurar, Casal Novo	15faH	105000	\N		2	10	2022-02-12 15:09:39.357594	2022-02-12 15:09:39.357608	98	\N
2970	MORADIA T3 GEMINADAS PELA A GARAGEM A 11KM DE LEIRIA.	16YXp	235000	283.5		2	10	2022-02-12 15:09:39.401589	2022-02-12 15:09:39.401597	170.8	\N
2971	MORADIA T3 GEMINADAS PELA A GARAGEM A 11KM DE LEIRIA.	16YXv	245000	315.9		2	10	2022-02-12 15:09:39.437492	2022-02-12 15:09:39.437502	167	\N
2972	Moradia T3+2 de r/c e sótão, com anexos, terreno c/1500m2. Coimbrão	17b72	215000	1500		2	11	2022-02-12 15:09:41.942691	2022-02-12 15:09:41.942698	180	\N
2973	Moradia T3 para venda	17NFJ	220000	1772.9		2	11	2022-02-12 15:09:41.979318	2022-02-12 15:09:41.979326	160.66	\N
2974	Moradia em projeto com 4 Quartos /Coimbrão / Leiria	167OB	340000	1208		2	11	2022-02-12 15:09:42.016336	2022-02-12 15:09:42.016344	316	\N
2975	Excelente Moradia T6 na Praia do Pedrogão	14bxA	370000	\N		2	11	2022-02-12 15:09:42.066001	2022-02-12 15:09:42.066011	240	\N
2976	Moradia T5 implantada em terreno c/+-1700m2. Coimbrão	17rfz	\N	1700		2	11	2022-02-12 15:09:42.096517	2022-02-12 15:09:42.096524	300	\N
2977	Moradia T3 em condomínio fechado com piscina - Coimbrão	17UhX	220000	128		2	11	2022-02-12 15:09:42.130866	2022-02-12 15:09:42.130874	186	\N
2978	Moradia T3 térrea em condomínio fechado com piscina - Coi...	17UgR	315000	240		2	11	2022-02-12 15:09:42.168423	2022-02-12 15:09:42.168432	156	\N
2979	Moradia T3 térrea em condomínio com piscina - Coimbrão	17UgB	315000	264		2	11	2022-02-12 15:09:42.215959	2022-02-12 15:09:42.215968	150	\N
2980	Moradia T3 para venda	17NFu	220000	1772.9		2	11	2022-02-12 15:09:42.267396	2022-02-12 15:09:42.267413	160.66	\N
2981	Moradia T3 para venda	17NEq	315000	1772		2	11	2022-02-12 15:09:42.302387	2022-02-12 15:09:42.302401	156	\N
2982	Moradia T3 para venda	17NEm	315000	1772		2	11	2022-02-12 15:09:42.357476	2022-02-12 15:09:42.357486	149	\N
2983	Moradia com piscina e 7 km da praia	17Mzj	425000	1150		2	11	2022-02-12 15:09:42.397965	2022-02-12 15:09:42.397976	172	\N
2984	Moradia térrea com piscina	17M7I	395000	1537		2	11	2022-02-12 15:09:42.442554	2022-02-12 15:09:42.44257	152	\N
2985	Moradia geminada T3 (flA1739D)	17j8c	220000	\N		2	11	2022-02-12 15:09:42.480379	2022-02-12 15:09:42.48039	176	\N
2986	Moradia Contemporânea T4+1 | Lote com 1206m2 - 2 frentes	16gN2	340000	1206		2	11	2022-02-12 15:09:42.516653	2022-02-12 15:09:42.516661	235	\N
2987	Moradia V6 de traça antiga localizada em Coimbrão, zona próxima de ...	176tF	310000	2983		2	11	2022-02-12 15:09:42.550242	2022-02-12 15:09:42.550249	387	\N
2988	Moradia individual T3 térrea (flA1739B)	16C2J	305000	\N		2	11	2022-02-12 15:09:42.584197	2022-02-12 15:09:42.58421	125	\N
2989	Moradia individual T3 térrea (flA1739A)	16C1p	315000	\N		2	11	2022-02-12 15:09:42.61748	2022-02-12 15:09:42.61749	125	\N
2990	Moradia - praia do Pedrogão	13RME	160000	210		2	11	2022-02-12 15:09:42.650898	2022-02-12 15:09:42.650905	182	\N
2991	Moradia - praia do Pedrogão.	139OA	87500	298		2	11	2022-02-12 15:09:42.682193	2022-02-12 15:09:42.682204	48	\N
2992	Moradia V3+1 com terreno em zona tranquila próxima de praias	16uwx	325000	1070		2	11	2022-02-12 15:09:42.714986	2022-02-12 15:09:42.714996	197	\N
2993	Moradia T2 de r/c e sótão, implantada em terreno c/624m2. Coimbrão	17EyN	97500	624		2	11	2022-02-12 15:09:42.858108	2022-02-12 15:09:42.858121	82	\N
2994	Moradia T5 Venda em Coimbrão,Leiria	17qNp	325000	1683		2	11	2022-02-12 15:09:42.89422	2022-02-12 15:09:42.894227	195	\N
2995	MORADIA T3 TÉRREA - CONDOMÍNIO FECHADO COM PISCINA - COIM...	17lRh	315000	\N		2	11	2022-02-12 15:09:42.93631	2022-02-12 15:09:42.936323	318	\N
2996	MORADIA T3 GEMINADA - CONDOMÍNIO FECHADO COM PISCINA - CO...	17lRf	220000	\N		2	11	2022-02-12 15:09:42.985628	2022-02-12 15:09:42.985636	240	\N
2997	Moradia V2 - Praia do Pedrogão	16OkF	98500	63		2	11	2022-02-12 15:09:43.026738	2022-02-12 15:09:43.026749	63	\N
2998	Moradia T3 para venda, Coimbrão, Leiria	133he	85000	517		2	11	2022-02-12 15:09:43.069911	2022-02-12 15:09:43.069927	153	\N
2999	Moradia T2 para venda	17NAQ	45000	1666		2	11	2022-02-12 15:09:43.098948	2022-02-12 15:09:43.098959	50	\N
3000	Moradia T3 r/c, 1ºandar em terreno c/3.200m2. Coimbrão	17EyB	174000	3200		2	11	2022-02-12 15:09:43.133472	2022-02-12 15:09:43.133481	125	\N
3001	Casa de campo p/restauro, implantada em terreno c/+-700m2. MR-1448	10eOb	45000	700		2	11	2022-02-12 15:09:43.165368	2022-02-12 15:09:43.165379	152	\N
3002	Moradia Unifamiliar Térrea - Coimbrão, Leiria	17p49	340000	1208		2	11	2022-02-12 15:09:43.20453	2022-02-12 15:09:43.204541	235	\N
3003	Moradia T4 para venda	186K6	550000	467.3		2	12	2022-02-12 15:09:45.397237	2022-02-12 15:09:45.39725	247.7	\N
3004	Moradia T3+1 / Terraço / Piso Radiante / Construção Nova / Parceiros	17t9b	297500	500		2	12	2022-02-12 15:09:45.432362	2022-02-12 15:09:45.432375	200	\N
3062	Moradia térrea com terreno a cerca de 10m de lindas praias	175Al	150000	\N		2	14	2022-02-12 16:50:03.302546	2022-02-12 16:50:03.302554	100	\N
3005	Pavilhão com licenciamento industrial área de bruta privativa de 1390m	174Sd	450000	2849.23		2	12	2022-02-12 15:09:45.464025	2022-02-12 15:09:45.464032	1612	\N
3006	Moradia T3+1, em Azoia	16Q0J	179900	\N		2	12	2022-02-12 15:09:45.592914	2022-02-12 15:09:45.592922	150	\N
3007	Moradia T4 / Projeto aprovado / Potencial de Remodelação / 1480m2  de	17knI	152500	1480		2	12	2022-02-12 15:09:45.630126	2022-02-12 15:09:45.630133	193.7	\N
3008	Moradia T3+1 / Terraço / Piso Radiante / Construção Nova / Parceiros	17z7V	297500	500		2	12	2022-02-12 15:09:45.676359	2022-02-12 15:09:45.676367	200	\N
3009	Moradia contemporânea T4 localizada nos Parceiros.	17IzX	539000	1306		2	12	2022-02-12 15:09:45.710641	2022-02-12 15:09:45.710651	242.3	\N
3010	Moradia Bi-familiar Rés do Chão	13ddF	90000	\N		2	12	2022-02-12 15:09:45.743378	2022-02-12 15:09:45.743385	157	\N
3011	Moradia de charme	175wP	\N	\N		2	12	2022-02-12 15:09:45.803797	2022-02-12 15:09:45.803813	704	\N
3012	Moradia Bi-familiar 1º Andar	13d8p	165000	\N		2	12	2022-02-12 15:09:45.851542	2022-02-12 15:09:45.851552	157	\N
3013	Moradia Geminada T4 vista Castelo em Santa Clara Parceiros	17h20	320000	262		2	12	2022-02-12 15:09:45.889614	2022-02-12 15:09:45.88962	184	\N
3014	Moradia T5 com espaço para eventos e festividades, Leiria	16vJW	639500	3170		2	12	2022-02-12 15:09:45.934557	2022-02-12 15:09:45.934564	200	\N
3015	Moradia T2 para remodelar / Terreno / Parceiros	17fFo	62000	293		2	12	2022-02-12 15:09:45.96524	2022-02-12 15:09:45.965264	43	\N
3016	Moradia T5 individual  c/ terreno - Pernelhas / Parceiros	16655	525000	4000		2	12	2022-02-12 15:09:46.001166	2022-02-12 15:09:46.001172	547	\N
3017	Moradia Individual	16Zur	60000	\N		2	12	2022-02-12 15:09:46.03386	2022-02-12 15:09:46.03387	296	\N
3018	MORADIA UNIFAMILIAR T4 - PARCEIROS	17UHW	365000	301		2	12	2022-02-12 15:09:46.071998	2022-02-12 15:09:46.072005	375.5	\N
3019	Moradia Uni familiar Térrea T3+1 Com Cave - Parceiros	16QC3	340000	467		2	12	2022-02-12 15:09:46.103409	2022-02-12 15:09:46.103418	175	\N
3020	Moradia Individual T4, com piscina	1438w	350000	460		2	12	2022-02-12 15:09:46.138471	2022-02-12 15:09:46.138479	460	\N
3021	Moradia T3 para venda	17NFA	199000	870		2	12	2022-02-12 15:09:46.178282	2022-02-12 15:09:46.17829	202	\N
3022	Moradia T4 - Urb. Sta Clara, Parceiros	15QE2	365000	172.9		2	12	2022-02-12 15:09:46.23114	2022-02-12 15:09:46.231154	172.9	\N
3023	Moradia T4	14PUL	390000	230		2	12	2022-02-12 15:09:46.286593	2022-02-12 15:09:46.286601	230	\N
3024	Moradia T3 para venda	17NFv	286000	1216		2	12	2022-02-12 15:09:46.383419	2022-02-12 15:09:46.383484	638	\N
3025	Moradia V3 Térrea – Chave na Mão	17uej	260000	138.4		2	12	2022-02-12 15:09:46.417704	2022-02-12 15:09:46.417712	138.4	\N
3026	Moradia T4 em banda	15QFZ	365000	170.05		2	12	2022-02-12 15:09:46.453938	2022-02-12 15:09:46.453948	170.05	\N
3027	Moradia T4 em banda	15QF9	365000	172.9		2	12	2022-02-12 15:09:46.500061	2022-02-12 15:09:46.50007	172.9	\N
3028	Moradia V3 Em Construção	16BrZ	255000	433		2	12	2022-02-12 15:09:46.534935	2022-02-12 15:09:46.534942	194	\N
3029	Moradia V3+1 - Rés-do-Chão - Parceiros	15Ylc	270000	463		2	12	2022-02-12 15:09:46.571071	2022-02-12 15:09:46.571084	151	\N
3030	Moradia V3+1 - Rés-do-Chão e Cave - Parceiros	15Ylb	285000	381		2	12	2022-02-12 15:09:46.616322	2022-02-12 15:09:46.616333	170	\N
3031	Moradia T3	182dO	130000	\N		2	12	2022-02-12 15:09:46.655228	2022-02-12 15:09:46.655236	300	\N
3032	Moradia T8	12h3q	\N	5733		2	12	2022-02-12 15:09:46.691254	2022-02-12 15:09:46.691263	1380	\N
3033	Moradia T3 – Leiria - Perto do Shopping	16vWU	215000	90		2	12	2022-02-12 15:09:46.732927	2022-02-12 15:09:46.73294	139	\N
3034	Moradia T6 Venda em Parceiros e Azoia,Leiria	16GIx	450000	2850		2	12	2022-02-12 15:09:46.76912	2022-02-12 15:09:46.769128	1768	\N
3035	Moradia Unifamiliar NOVA - Tipo T4 com Cave	15Ebw	310000	\N		2	12	2022-02-12 15:09:46.799977	2022-02-12 15:09:46.79999	160	\N
3036	Moradia Unifamiliar NOVA - Parceiros, Leiria	17WUK	375000	493		2	12	2022-02-12 15:09:46.828614	2022-02-12 15:09:46.828621	160	\N
3037	Moradia T5em Azoia a 5 min do centro da cidade de Leiria	17631	105000	362		2	12	2022-02-12 15:09:46.859774	2022-02-12 15:09:46.859808	140	\N
3038	Moradia T3	17T2p	215000	\N		2	12	2022-02-12 15:09:46.89882	2022-02-12 15:09:46.898827	139	\N
3039	Moradia geminada de Tipologia T4 localizada em Parceiros - Leiria	13ItA	255000	235		2	12	2022-02-12 15:09:46.933458	2022-02-12 15:09:46.933468	149	\N
3040	Permuta T3 por vivenda terrea	17KgX	210000	\N		2	12	2022-02-12 15:09:46.970324	2022-02-12 15:09:46.970337	125	\N
3041	Moradia T2+2 - Ótimo Estado de Conservação	12jth	186000	\N		2	12	2022-02-12 15:09:47.012324	2022-02-12 15:09:47.012334	231	\N
3042	Moradia com 4 Quartos /Piscina /Regueira de Pontes / Leiria	167OC	879000	2110		2	13	2022-02-12 15:09:48.338215	2022-02-12 15:09:48.338226	815	\N
3043	Moradia térrea para recuperar com terreno em Regueira de Pontes	17wXU	137500	2460		2	13	2022-02-12 15:09:48.382857	2022-02-12 15:09:48.382865	98	\N
3044	Fantástica Moradia T5 - Ponte da Pedra	11xYt	\N	2110		2	13	2022-02-12 15:09:48.420909	2022-02-12 15:09:48.420919	815.45	\N
3045	Moradia T4 Venda em Regueira de Pontes,Leiria	16Diw	855000	2110		2	13	2022-02-12 15:09:48.459223	2022-02-12 15:09:48.459235	815.45	\N
3046	Moradia Rústica Isolada T5 em Regueira de Pontes - Leiria	11TkJ	600000	\N		2	13	2022-02-12 15:09:48.496592	2022-02-12 15:09:48.496599	266	\N
3047	Moradia T4 para Venda	17NKp	390000	1640		2	13	2022-02-12 15:09:48.534344	2022-02-12 15:09:48.534362	145.55	\N
3048	Moradia de luxo T4	1558t	298000	\N		2	13	2022-02-12 15:09:48.56946	2022-02-12 15:09:48.569472	300	\N
3049	Esplêndida moradia moderna, com todo o conforto, a 8Km da...	184ZC	430000	638		2	14	2022-02-12 16:50:02.813997	2022-02-12 16:50:02.814011	258.1	\N
3050	Moradia T3 terreno c/+- 4870m2. zona Mata Mourisca. MR-1451	10fbI	300000	4870		2	14	2022-02-12 16:50:02.878414	2022-02-12 16:50:02.878422	180	\N
3051	Moradia V5 com Terreno 2000m2 Renovada em 2021	16NrZ	230000	1700		2	14	2022-02-12 16:50:02.928451	2022-02-12 16:50:02.928459	300	\N
3052	Quintinha com Moradia V3 - Pombal	108XS	300000	4870		2	14	2022-02-12 16:50:02.966336	2022-02-12 16:50:02.966345	205.8	\N
3053	Moradia M3 em excelente estado perto de Pombal	10e3R	300000	4870		2	14	2022-02-12 16:50:03.00888	2022-02-12 16:50:03.008887	205.8	\N
3054	Moradia T2 para venda	17NFo	60000	1492		2	14	2022-02-12 16:50:03.041977	2022-02-12 16:50:03.041985	42	\N
3055	Moradia T6 - Guia	14MvC	269999	\N		2	14	2022-02-12 16:50:03.072389	2022-02-12 16:50:03.072403	800	\N
3056	Moradia c/ logradouro - Pedrogueira	17IiB	110000	360		2	14	2022-02-12 16:50:03.103252	2022-02-12 16:50:03.103261	133	\N
3057	Moradia T3 para venda	17NGg	160000	562		2	14	2022-02-12 16:50:03.136307	2022-02-12 16:50:03.136314	109.38	\N
3058	Vende-se moradia com 13 000 de terreno, junto à Guia - Pombal	HuyS	320000	\N		2	14	2022-02-12 16:50:03.169205	2022-02-12 16:50:03.169214	120	\N
3059	House/Villa/Residential em Leiria, Pombal REF:1251	14ftK	107511	1935		2	14	2022-02-12 16:50:03.20476	2022-02-12 16:50:03.204767	162	\N
3060	Moradia T4 Nova Mata-Mourisca	14Uuz	227000	225		2	14	2022-02-12 16:50:03.237739	2022-02-12 16:50:03.237746	225	\N
3061	Moradia T0 para Venda	17PhW	110000	2165		2	14	2022-02-12 16:50:03.269949	2022-02-12 16:50:03.269957	45	\N
3064	Moradia T4 Nova Mata-Mourisca	14UuA	227000	225		2	14	2022-02-12 16:50:03.368786	2022-02-12 16:50:03.368794	225	\N
3065	Ruína - Carriço	11P8W	56000	\N		2	14	2022-02-12 16:50:03.402866	2022-02-12 16:50:03.402877	200	\N
3066	MORADIA NO CENTRO DE POMBAL	17Cv8	395000	\N		2	15	2022-02-13 13:56:26.391488	2022-02-13 13:56:26.391507	229	\N
3067	Moradia T5+1 com piscina, jardim, garagem em Pombal, Coimbra	17Kaj	675000	2185		2	15	2022-02-13 13:56:26.474875	2022-02-13 13:56:26.474897	450	\N
3068	Moradia T2 (S. Simão Litém - Pombal) com Piscina	17GFe	128000	\N		2	15	2022-02-13 13:56:26.546541	2022-02-13 13:56:26.546552	114	\N
3069	MORADIA T4, em zona calma de Pombal (Leiria)	175tu	345000	\N		2	15	2022-02-13 13:56:26.613485	2022-02-13 13:56:26.613502	230	\N
3070	Excelente Moradia T8 de luxo em Pombal	15iCC	980000	\N		2	15	2022-02-13 13:56:26.65831	2022-02-13 13:56:26.658321	4600	\N
3071	Moradia em Pombal a menos de 500 m do Centro.	17ND6	199900	892		2	15	2022-02-13 13:56:26.778352	2022-02-13 13:56:26.778361	222.6	\N
3072	Moradia recente em Casal Fernão João, Pombal	17NC1	650700	1264		2	15	2022-02-13 13:56:26.824529	2022-02-13 13:56:26.824538	722	\N
3073	Moradia T3 para Venda em Vila Cã	17uG4	108000	390		2	15	2022-02-13 13:56:26.877439	2022-02-13 13:56:26.87745	120	\N
3074	Moradia T4 / isolada / Terreno / Pombal	17t99	250000	500		2	15	2022-02-13 13:56:26.920064	2022-02-13 13:56:26.920074	200	\N
3075	Moradia com vista para o castelo do Pombal com terreno	14Xlh	278000	1000		2	15	2022-02-13 13:56:27.220902	2022-02-13 13:56:27.220913	285	\N
3076	Moradia T 3 próximo da escola Gualdim Pais	11Ilv	85000	\N		2	15	2022-02-13 13:56:27.287663	2022-02-13 13:56:27.287675	100	\N
3077	Real Quinta do Barco - Preparada para AL | 678m2 | 5800m2 Totalmente m	16zmb	1498000	5800		2	15	2022-02-13 13:56:27.331254	2022-02-13 13:56:27.331264	588	\N
3078	Moradia Em Granja Pombal a 2 Km do Centro Pombal.	17NCg	298000	1110		2	15	2022-02-13 13:56:27.378859	2022-02-13 13:56:27.378871	253	\N
3079	Moradia T3 para restaurar - Pombal	174yZ	95000	135		2	15	2022-02-13 13:56:27.417958	2022-02-13 13:56:27.417972	81	\N
3080	Moradia T2 a 2 minutos de Pombal	13N9q	110000	133		2	15	2022-02-13 13:56:27.456975	2022-02-13 13:56:27.456985	98	\N
3081	Moradia em Pombal, T4 a 1 minuto do Mercado Municipal de ...	WMlZ	299000	950		2	15	2022-02-13 13:56:27.49432	2022-02-13 13:56:27.494338	300	\N
3082	Moradia T5 isolada / Terreno / Poço / Charneca / Pombal	17yqa	120000	1400		2	15	2022-02-13 13:56:27.534014	2022-02-13 13:56:27.534034	62.5	\N
3083	Moradia T4 Pombal	15imk	480000	320		2	15	2022-02-13 13:56:27.577919	2022-02-13 13:56:27.577946	305	\N
3084	Magnifica Moradia com piscina aquecida em Pombal	11KlG	320000	326		2	15	2022-02-13 13:56:27.628571	2022-02-13 13:56:27.628591	324	\N
3085	Moradia - 376 m² - T4	14nYb	480000	980		2	15	2022-02-13 13:56:27.676883	2022-02-13 13:56:27.676894	376	\N
3086	Moradia Isolada T3 - Pombal	16LVQ	139000	\N		2	15	2022-02-13 13:56:27.725385	2022-02-13 13:56:27.725396	116	\N
3087	Moradia em Pombal	Fl3f	320000	488		2	15	2022-02-13 13:56:27.764985	2022-02-13 13:56:27.764998	648	\N
3088	Moradia T3 / Restaurar / Catela / Pombal	173Xy	59000	2500		2	15	2022-02-13 13:56:27.803905	2022-02-13 13:56:27.803921	110	\N
3089	Moradia em Pombal. 4 quartos. zona calma na avenida Herói...	16dwo	430000	\N		2	15	2022-02-13 13:56:27.876449	2022-02-13 13:56:27.87646	486	\N
3090	Moradia para reconstruir junto ao IC2	17NBX	78900	910		2	15	2022-02-13 13:56:27.928777	2022-02-13 13:56:27.928792	66	\N
3091	Terreno c/ casa p/ recuperar ou construções novas.	17NBW	250000	1040		2	15	2022-02-13 13:56:28.007046	2022-02-13 13:56:28.007055	1040	\N
3092	Moradia T7 para venda	17NAi	110000	199		2	15	2022-02-13 13:56:28.06195	2022-02-13 13:56:28.061963	386	\N
3093	Moradia T3+1 res do chão, nova localizada a 10 minutos de...	17yWR	460000	2600		2	15	2022-02-13 13:56:28.24155	2022-02-13 13:56:28.241557	425	\N
3094	Moradia Geminada (Nova) - Pombal	173iA	375000	626.5		2	15	2022-02-13 13:56:28.285064	2022-02-13 13:56:28.285077	224	\N
3095	Moradia T3 para venda	17NG1	110000	57		2	15	2022-02-13 13:56:28.379961	2022-02-13 13:56:28.379972	96	\N
3096	Moradia T4 para venda	17NFZ	215000	246.5		2	15	2022-02-13 13:56:28.428919	2022-02-13 13:56:28.428929	175.6	\N
3097	Moradia para reconstruir / Terreno  / Pombal	17ghs	80000	2000		2	15	2022-02-13 13:56:28.503956	2022-02-13 13:56:28.503972	90	\N
3098	Casa Antiga para remodelar a  5 Km de Pombal.	16n8f	17500	\N		2	15	2022-02-13 13:56:28.546649	2022-02-13 13:56:28.546658	184	\N
3099	Moradia T3 para venda	17xje	140000	2070		2	15	2022-02-13 13:56:28.613605	2022-02-13 13:56:28.613615	108	\N
3100	Moradia T4 para venda	17xk3	330000	249		2	15	2022-02-13 13:56:28.696412	2022-02-13 13:56:28.696422	172	\N
3101	Moradia T3 para venda	17xjj	218000	800		2	15	2022-02-13 13:56:28.739795	2022-02-13 13:56:28.739814	186	\N
3102	Moradia T3 - Pombal	14vUO	144988	\N		2	15	2022-02-13 13:56:28.787094	2022-02-13 13:56:28.787107	200	\N
3103	Moradia T2 - Pombal	13ICR	112499	\N		2	15	2022-02-13 13:56:28.861378	2022-02-13 13:56:28.86139	150	\N
3104	Moradia T4 - Barros da Paz, Pombal	12Nbb	210000	1000		2	15	2022-02-13 13:56:28.912052	2022-02-13 13:56:28.912066	200	\N
3105	Moradia T3 - Mogadouro	11NO2	143000	\N		2	15	2022-02-13 13:56:29.045602	2022-02-13 13:56:29.045612	200	\N
3106	Casa de Habitação e Loja Comercial - Zona Histórica de Po...	17Sar	175000	102		2	15	2022-02-13 13:56:29.09209	2022-02-13 13:56:29.092101	141.62	\N
3107	Moradia Nova T3 - Pombal	17xVC	230000	295		2	15	2022-02-13 13:56:29.130044	2022-02-13 13:56:29.130053	163	\N
3108	Moradia T2 para venda	17xfQ	38000	480		2	15	2022-02-13 13:56:29.170951	2022-02-13 13:56:29.170965	80	\N
3109	Moradia - 100 m² - T2	17hGX	110000	100		2	15	2022-02-13 13:56:29.225675	2022-02-13 13:56:29.225686	100	\N
3110	Moradia Geminada - Pombal	17atr	365000	626.5		2	15	2022-02-13 13:56:29.273938	2022-02-13 13:56:29.273949	224	\N
3111	Moradia - 245 m² - T4	14yYY	218000	850		2	15	2022-02-13 13:56:29.34218	2022-02-13 13:56:29.342194	245	\N
3112	Quinta com grande Casa, Arrecadações e Arrumos em Ruínas, com Terreno	13anM	110000	2700		2	15	2022-02-13 13:56:29.408563	2022-02-13 13:56:29.408573	370	\N
3113	Moradia T6 para venda	17xiT	149500	\N		2	15	2022-02-13 13:56:29.4457	2022-02-13 13:56:29.445716	396	\N
3114	Casinha Antiga para Recuperar em Vila Cã - Pombal	16ZGQ	35000	405		2	15	2022-02-13 13:56:29.501625	2022-02-13 13:56:29.501642	166	\N
3115	Perto da cidade	ZUxi	80000	100		2	15	2022-02-13 13:56:29.540221	2022-02-13 13:56:29.540233	194	\N
3116	Moradia T5 Venda Pombal	K87K	325000	\N		2	15	2022-02-13 13:56:29.580858	2022-02-13 13:56:29.580869	183	\N
3117	Moradia - próxima de Pombal	17q3D	143000	\N		2	15	2022-02-13 13:56:29.626288	2022-02-13 13:56:29.626298	120	\N
3118	Moradia Pombal	16xBd	180000	\N		2	15	2022-02-13 13:56:29.669243	2022-02-13 13:56:29.669255	200	\N
3119	Moradia T3 para venda	17xjo	375000	\N		2	15	2022-02-13 13:56:29.719839	2022-02-13 13:56:29.719855	156	\N
3120	Moradia T4 para venda	17xj2	199900	1280		2	15	2022-02-13 13:56:29.773134	2022-02-13 13:56:29.773165	276.53	\N
3121	Moradia T3 para Venda	17xiB	55000	\N		2	15	2022-02-13 13:56:29.838076	2022-02-13 13:56:29.838098	50	\N
3122	Moradia T2 para Venda	17xiu	110000	1480		2	15	2022-02-13 13:56:29.891267	2022-02-13 13:56:29.891284	72	\N
3123	Moradia T4 - Pombal	14KUi	349999	\N		2	15	2022-02-13 13:56:29.927731	2022-02-13 13:56:29.927741	420	\N
3124	Venda Judicial - Moradia T6 Pombal	182Uq	255000	\N		2	15	2022-02-13 13:56:29.99153	2022-02-13 13:56:29.99154	320	\N
3125	Moradia T2 para venda	17xiS	60000	1500		2	15	2022-02-13 13:56:30.044086	2022-02-13 13:56:30.044096	58	\N
3126	Moradia T2 - Pombal	14Xd8	155050	\N		2	15	2022-02-13 13:56:30.16057	2022-02-13 13:56:30.16058	100	\N
3127	Moradia T7 Louriçal - Pombal	12LVk	397000	4000		2	15	2022-02-13 13:56:30.222999	2022-02-13 13:56:30.22301	230	\N
3128	Moradia T0 para venda	17Phc	75000	1121		2	15	2022-02-13 13:56:30.263298	2022-02-13 13:56:30.263306	50	\N
3129	Moradia Pombal	16xU7	149000	\N		2	15	2022-02-13 13:56:30.307864	2022-02-13 13:56:30.307873	150	\N
3130	Moradia T0 para Venda	17Phj	40000	1020		2	15	2022-02-13 13:56:30.392475	2022-02-13 13:56:30.392486	82	\N
3131	Moradia- T3 - Venda em Santiago da Guarda	17xgb	38000	2400		2	15	2022-02-13 13:56:30.444132	2022-02-13 13:56:30.444143	90	\N
3132	Construção de Moradias Modulares  T0	11NSw	130000	\N		2	15	2022-02-13 13:56:30.555411	2022-02-13 13:56:30.555427	130	\N
3133	Moradia para reconstruir - Pombal	141eC	35499	200		2	15	2022-02-13 13:56:30.63011	2022-02-13 13:56:30.630123	100	\N
3134	Moradia T3|Construção nova|Oportunidade	12mFa	230000	1360		2	17	2022-02-13 14:20:14.275534	2022-02-13 14:20:14.275571	170	\N
3135	Imóvel Exclusivo - Moradia térrea nova M3 no Carriço, Pombal	16Dhv	210000	730		2	17	2022-02-13 14:20:14.324988	2022-02-13 14:20:14.324999	170	\N
3136	Moradia T3|Construção nova|Oportunidade	12mFf	230000	1360		2	17	2022-02-13 14:20:14.366771	2022-02-13 14:20:14.366783	170	\N
3137	Moradia em ruína para recuperar nos Vieirinhos com terren...	15pNg	83500	\N		2	17	2022-02-13 14:20:14.408786	2022-02-13 14:20:14.408797	198	\N
3138	MORADIA T3 - Carriço	17AO4	210000	174.01		2	17	2022-02-13 14:20:14.455252	2022-02-13 14:20:14.455265	174.01	\N
3139	Moradia T3 para venda	17xjV	264000	669.5		2	17	2022-02-13 14:20:14.498397	2022-02-13 14:20:14.498406	233.74	\N
3140	Moradia - 111 m² - T3	175BK	210000	730		2	17	2022-02-13 14:20:14.540435	2022-02-13 14:20:14.540444	111	\N
3141	Moradia T2 +1 no Carriço - Pombal	Ydv8	190000	1000		2	17	2022-02-13 14:20:14.574273	2022-02-13 14:20:14.574282	101	\N
3142	Moradia T3 para venda	17xk4	252000	630.5		2	17	2022-02-13 14:20:14.625298	2022-02-13 14:20:14.625315	240.95	\N
3143	Moradia T9 para venda	17xiV	220000	\N		2	17	2022-02-13 14:20:14.70043	2022-02-13 14:20:14.700443	920	\N
3144	Moradia T4 para venda	17xjJ	322500	\N		2	17	2022-02-13 14:20:14.757888	2022-02-13 14:20:14.757899	440	\N
3145	Moradia - 88 m² - T0	175Bv	79000	448		2	17	2022-02-13 14:20:14.792558	2022-02-13 14:20:14.792571	88	\N
3146	Moradia T3 para venda	17NFr	190000	4650		2	17	2022-02-13 14:20:14.833406	2022-02-13 14:20:14.833417	119.13	\N
3147	Terreno e casa antiga -	14YXI	55000	1750		2	17	2022-02-13 14:20:14.869946	2022-02-13 14:20:14.869954	42	\N
3148	MORADIA T4 II 10 MIN DA CIDADE DE POMBAL	17ZYz	235000	\N		2	18	2022-02-13 15:20:15.7224	2022-02-13 15:20:15.72241	255	\N
3149	Moradia Unifamiliar	171te	230000	\N		2	18	2022-02-13 15:20:15.75713	2022-02-13 15:20:15.75714	412	\N
3150	MORADIA T3 || TERRENO || ALMAGREIRA || POMBAL	16OIw	99500	\N		2	18	2022-02-13 15:20:15.793574	2022-02-13 15:20:15.793583	80	\N
3151	MORADIA PARA RECUPERAR || ALMAGREIRA || POMBAL	14IKw	47500	\N		2	18	2022-02-13 15:20:15.83889	2022-02-13 15:20:15.838953	158	\N
3152	Moradia T6 para venda	185JZ	155000	423		2	18	2022-02-13 15:20:15.872402	2022-02-13 15:20:15.872411	1550	\N
3153	Moradia Isolada T3 C/ Logradouro em Almagreira	17kno	89000	205		2	18	2022-02-13 15:20:15.906321	2022-02-13 15:20:15.906329	210	\N
3154	Moradia T3 para venda	17xkf	235000	727		2	18	2022-02-13 15:20:15.942135	2022-02-13 15:20:15.942145	364	\N
3155	Moradia T3 para venda	17xju	267500	\N		2	18	2022-02-13 15:20:15.98196	2022-02-13 15:20:15.981972	209.5	\N
3156	Moradia T3 para Venda	17xim	49900	3364		2	18	2022-02-13 15:20:16.018741	2022-02-13 15:20:16.018751	132	\N
3157	Moradia T2 para Venda	17xiq	60000	1680		2	18	2022-02-13 15:20:16.181924	2022-02-13 15:20:16.181943	77	\N
3158	BAIXA DE PREÇO!	17xgB	25000	2660		2	18	2022-02-13 15:20:16.225563	2022-02-13 15:20:16.225573	170	\N
3159	Moradia em Simões - Soure	13LZl	53000	160		2	18	2022-02-13 15:20:16.273962	2022-02-13 15:20:16.273974	70	\N
3160	Moradia T2 para Venda	17NDD	45000	1548		2	18	2022-02-13 15:20:16.309049	2022-02-13 15:20:16.309066	30	\N
3161	Moradia T1 para venda	17xgS	21000	120		2	18	2022-02-13 15:20:16.356162	2022-02-13 15:20:16.356173	50	\N
3163	Moradia V4 - Início Construção	187Kf	350000	\N		2	4	2022-02-14 12:10:31.07508	2022-02-14 12:10:31.075095	190	https://www.imovirtual.com/pt/anuncio/moradia-v4-inicio-construcao-ID187Kf.html
3164	Projecto Aprovado Moradia - Gândara dos Olivais	Eg6B	265000	316		2	4	2022-02-14 12:10:32.11705	2022-02-14 12:10:32.117057	180	https://www.imovirtual.com/pt/anuncio/projecto-aprovado-moradia-gandara-dos-olivais-IDEg6B.html
3165	Moradia V4 - Início Construção	187Kg	350000	\N		2	4	2022-02-14 12:10:32.161078	2022-02-14 12:10:32.161089	190	https://www.imovirtual.com/pt/anuncio/moradia-v4-inicio-construcao-ID187Kg.html
3166	Moradia em Leiria	12zJm	795000	\N		2	3	2022-02-14 13:10:19.644701	2022-02-14 13:10:19.644745	750	https://www.imovirtual.com/pt/anuncio/moradia-em-leiria-ID12zJm.html
3167	Moradia em Ranha de São João, Pombal	17x9t	225000	\N		2	19	2022-02-14 13:20:32.225564	2022-02-14 13:20:32.225577	140	https://www.imovirtual.com/pt/anuncio/moradia-em-ranha-de-sao-joao-pombal-ID17x9t.html
3168	Moradia para venda em Matos da Ranha - Pombal	17bYI	80000	\N		2	19	2022-02-14 13:20:32.362479	2022-02-14 13:20:32.362505	146	https://www.imovirtual.com/pt/anuncio/moradia-para-venda-em-matos-da-ranha-pombal-ID17bYI.html
3169	Moradia T8 para venda	183D6	195000	1100		2	19	2022-02-14 13:20:32.401421	2022-02-14 13:20:32.401428	240	https://www.imovirtual.com/pt/anuncio/moradia-t8-para-venda-ID183D6.html
3170	Moradia T0 para venda	17Pi2	42000	\N		2	19	2022-02-14 13:20:32.443977	2022-02-14 13:20:32.443995	1900	https://www.imovirtual.com/pt/anuncio/moradia-t0-para-venda-ID17Pi2.html
3171	Moradia T3 para venda	17xjm	110000	\N		2	19	2022-02-14 13:20:32.489434	2022-02-14 13:20:32.489453	146	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-venda-ID17xjm.html
3172	Moradia Antiga para Restaurar	187ZO	120000	1720		2	3	2022-02-14 15:11:57.896992	2022-02-14 15:11:57.897013	160	https://www.imovirtual.com/pt/anuncio/moradia-antiga-para-restaurar-ID187ZO.html
3173	Moradia Unifamiliar T4 NOVA - Barosa, Leiria	17MvW	297000	584		2	4	2022-02-14 16:11:18.246581	2022-02-14 16:11:18.246594	203	https://www.imovirtual.com/pt/anuncio/moradia-unifamiliar-t4-nova-barosa-leiria-ID17MvW.html
3174	Moradia Unifamiliar T4 NOVA - Barosa, Leiria	17MvV	292000	479		2	4	2022-02-14 16:11:18.36981	2022-02-14 16:11:18.369819	203	https://www.imovirtual.com/pt/anuncio/moradia-unifamiliar-t4-nova-barosa-leiria-ID17MvV.html
3189	Moradia T4 para venda	188mh	68000	1067		2	4	2022-02-15 12:10:43.323882	2022-02-15 12:10:43.323929	120	https://www.imovirtual.com/pt/anuncio/moradia-t4-para-venda-ID188mh.html
3190	MORADIA ISOLADA NOVA COM PISCINA	14Pvu	425000	441		2	3	2022-02-15 16:10:18.123181	2022-02-15 16:10:18.123261	185	https://www.imovirtual.com/pt/anuncio/moradia-isolada-nova-com-piscina-ID14Pvu.html
3191	Andar Moradia T5 Venda em Monte Real e Carvide,Leiria	1890i	185000	1262		2	6	2022-02-16 11:12:25.071145	2022-02-16 11:12:25.07118	167	https://www.imovirtual.com/pt/anuncio/andar-moradia-t5-venda-em-monte-real-e-carvide-leiria-ID1890i.html
3192	Moradia de requinte - Pombal	1895E	950000	1082		2	15	2022-02-16 15:53:24.301161	2022-02-16 15:53:24.301171	404	https://www.imovirtual.com/pt/anuncio/moradia-de-requinte-pombal-ID1895E.html
3193	Moradia Isolada T3 , anexos e garagem sita em Almagreira.l	1894L	89000	1050		2	18	2022-02-16 15:53:29.955707	2022-02-16 15:53:29.955722	210	https://www.imovirtual.com/pt/anuncio/moradia-isolada-t3-anexos-e-garagem-sita-em-almagreira-l-ID1894L.html
3194	Moradia T4 / Condominio Fechado com Piscina /  Gandara dos Olivais, Le	189fN	177500	\N		2	4	2022-02-16 16:10:24.16855	2022-02-16 16:10:24.168593	234	https://www.imovirtual.com/pt/anuncio/moradia-t4-condominio-fechado-com-piscina-gandara-dos-olivais-le-ID189fN.html
3195	Exceleste Moradia T3+1	189F7	370000	\N		2	4	2022-02-17 11:10:26.490912	2022-02-17 11:10:26.490946	303	https://www.imovirtual.com/pt/anuncio/exceleste-moradia-t3-1-ID189F7.html
3196	Moradia T4 Barosa Leiria	15FJa	230000	\N		2	4	2022-02-18 11:10:25.226446	2022-02-18 11:10:25.226456	197	https://www.imovirtual.com/pt/anuncio/moradia-t4-barosa-leiria-ID15FJa.html
3197	Moradia T3 para restauro	18aiZ	42000	\N		2	15	2022-02-18 11:21:46.551509	2022-02-18 11:21:46.551524	470	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-restauro-ID18aiZ.html
3198	Moradia Unifamiliar V3+1	18aCg	320000	\N		2	4	2022-02-18 16:34:09.652568	2022-02-18 16:34:09.652579	150	https://www.imovirtual.com/pt/anuncio/moradia-unifamiliar-v3-1-ID18aCg.html
3199	Moradia Individual - Capuchos - Leiria	17WsP	\N	740		2	3	2022-02-21 10:37:27.526735	2022-02-21 10:37:27.526747	337	https://www.imovirtual.com/pt/anuncio/moradia-individual-capuchos-leiria-ID17WsP.html
3200	Moradia T3 Venda em Souto da Carpalhosa e Ortigosa,Leiria	17qpH	78000	994		2	5	2022-02-21 10:37:37.351603	2022-02-21 10:37:37.35161	200	https://www.imovirtual.com/pt/anuncio/moradia-t3-venda-em-souto-da-carpalhosa-e-ortigosa-leiria-ID17qpH.html
3201	Moradia T3 - Amor, Leiria	17AQx	235000	\N		2	10	2022-02-21 10:37:50.67169	2022-02-21 10:37:50.671704	167	https://www.imovirtual.com/pt/anuncio/moradia-t3-amor-leiria-ID17AQx.html
3202	Moradia T4 para venda	18aKL	547000	515		2	12	2022-02-21 10:37:57.817908	2022-02-21 10:37:57.817919	230	https://www.imovirtual.com/pt/anuncio/moradia-t4-para-venda-ID18aKL.html
3203	Moradia T3 - Amor, Leiria	17AQJ	245000	\N		2	12	2022-02-21 10:37:58.956835	2022-02-21 10:37:58.956844	171	https://www.imovirtual.com/pt/anuncio/moradia-t3-amor-leiria-ID17AQJ.html
3204	Moradia para recuperar nos Parceiros - Brogal	185pE	60000	183		2	12	2022-02-21 10:37:59.001068	2022-02-21 10:37:59.001082	117	https://www.imovirtual.com/pt/anuncio/moradia-para-recuperar-nos-parceiros-brogal-ID185pE.html
3205	Moradia Isolada T4, Leiria	16L9A	400000	541		2	3	2022-02-21 17:16:27.535385	2022-02-21 17:16:27.5354	211	https://www.imovirtual.com/pt/anuncio/moradia-isolada-t4-leiria-ID16L9A.html
3206	Moradia unifamiliar T6 em Leiria	15mWd	299500	411.7		2	3	2022-02-21 17:16:30.575157	2022-02-21 17:16:30.575169	232	https://www.imovirtual.com/pt/anuncio/moradia-unifamiliar-t6-em-leiria-ID15mWd.html
3207	Moradia isolada T7, ás portas da cidade de Leiria.	16B9M	650000	2223		2	3	2022-02-21 17:16:31.43595	2022-02-21 17:16:31.435962	350	https://www.imovirtual.com/pt/anuncio/moradia-isolada-t7-as-portas-da-cidade-de-leiria-ID16B9M.html
3208	Moradia T3 / Para Remodelar / Vista Castelo / Centro da Cidade / Leiri	18bsM	175000	273		2	4	2022-02-21 17:16:37.81953	2022-02-21 17:16:37.819542	158	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-remodelar-vista-castelo-centro-da-cidade-leiri-ID18bsM.html
3209	Moradia T3	17pBR	192500	425		2	9	2022-02-21 17:16:59.862587	2022-02-21 17:16:59.862604	123	https://www.imovirtual.com/pt/anuncio/moradia-t3-ID17pBR.html
3210	Casinha antiga com Terreno - Triste Feio - milagres	174Aq	98500	1000		2	9	2022-02-21 17:17:00.128559	2022-02-21 17:17:00.128572	56	https://www.imovirtual.com/pt/anuncio/casinha-antiga-com-terreno-triste-feio-milagres-ID174Aq.html
3211	Moradia isolada Térrea, T3 Parceiros - Leiria	15BAV	286000	1216		2	12	2022-02-21 17:17:14.226476	2022-02-21 17:17:14.226486	309.56	https://www.imovirtual.com/pt/anuncio/moradia-isolada-terrea-t3-parceiros-leiria-ID15BAV.html
3212	Moradia T3 Guia - Pombal	16ZQY	325000	1836		2	14	2022-02-21 17:20:07.431892	2022-02-21 17:20:07.431901	516.12	https://www.imovirtual.com/pt/anuncio/moradia-t3-guia-pombal-ID16ZQY.html
3213	Moradia T3 térrea, Casal da Clara - Pombal	16At1	107511	1935		2	14	2022-02-21 17:20:08.12467	2022-02-21 17:20:08.12468	140	https://www.imovirtual.com/pt/anuncio/moradia-t3-terrea-casal-da-clara-pombal-ID16At1.html
3214	Moradia T3+1 Casal dos Matos, Leiria	16yel	340000	313		2	3	2022-02-22 11:48:02.150645	2022-02-22 11:48:02.150658	169	https://www.imovirtual.com/pt/anuncio/moradia-t3-1-casal-dos-matos-leiria-ID16yel.html
3215	Moradia Isolada T4 térrea em Barreira - Leiria	17XA8	125000	440		2	3	2022-02-22 11:48:02.319931	2022-02-22 11:48:02.319943	100	https://www.imovirtual.com/pt/anuncio/moradia-isolada-t4-terrea-em-barreira-leiria-ID17XA8.html
3216	Moradia contemporânea T5 na zona Histórica de cidade de L...	187zU	\N	380		2	3	2022-02-22 11:48:02.611943	2022-02-22 11:48:02.61195	308	https://www.imovirtual.com/pt/anuncio/moradia-contemporanea-t5-na-zona-historica-de-cidade-de-l-ID187zU.html
3217	Moradia térrea tipo T3, na zona central da cidade de Leiria	18072	320000	\N		2	3	2022-02-22 11:48:03.070422	2022-02-22 11:48:03.070429	124	https://www.imovirtual.com/pt/anuncio/moradia-terrea-tipo-t3-na-zona-central-da-cidade-de-leiria-ID18072.html
3218	NOVIDADE - Moradia Isolada T4 num lote de 1000 m2, Pousos...	180kr	490000	1000		2	3	2022-02-22 11:48:04.641269	2022-02-22 11:48:04.64128	200	https://www.imovirtual.com/pt/anuncio/novidade-moradia-isolada-t4-num-lote-de-1000-m2-pousos-ID180kr.html
3219	Moradia nova T3 com 2 pisos, logradouro e garagem. Leiria	18cuD	265000	300		2	4	2022-02-23 10:49:16.293238	2022-02-23 10:49:16.293251	156	https://www.imovirtual.com/pt/anuncio/moradia-nova-t3-com-2-pisos-logradouro-e-garagem-leiria-ID18cuD.html
3220	Moradia nova pronta a habitar.	17LNa	299500	253		2	4	2022-02-23 10:49:17.902448	2022-02-23 10:49:17.902459	190	https://www.imovirtual.com/pt/anuncio/moradia-nova-pronta-a-habitar-ID17LNa.html
3221	Moradia - 170 m² - T3	18crg	200000	1200		2	6	2022-02-23 10:49:24.110927	2022-02-23 10:49:24.110939	170	https://www.imovirtual.com/pt/anuncio/moradia-170-m-t3-ID18crg.html
3222	Moradia T3 Venda em Almagreira,Pombal	18cng	89000	205		2	18	2022-02-23 10:50:00.617818	2022-02-23 10:50:00.617826	210	https://www.imovirtual.com/pt/anuncio/moradia-t3-venda-em-almagreira-pombal-ID18cng.html
3223	Moradia T4 Venda em Pombal,Pombal	18cV1	110100	2600		2	15	2022-02-23 21:33:02.884242	2022-02-23 21:33:02.884252	110	https://www.imovirtual.com/pt/anuncio/moradia-t4-venda-em-pombal-pombal-ID18cV1.html
3224	Moradia T6 com Piscina - Leiria	18cVd	439000	\N		2	3	2022-02-23 21:33:26.487884	2022-02-23 21:33:26.487894	326	https://www.imovirtual.com/pt/anuncio/moradia-t6-com-piscina-leiria-ID18cVd.html
3225	Moradia Isolada  Venda em Leiria, Pousos, Barreira e Cortes,Leiria	18cV9	38000	277.42		2	3	2022-02-23 21:33:27.5052	2022-02-23 21:33:27.50521	109.42	https://www.imovirtual.com/pt/anuncio/moradia-isolada-venda-em-leiria-pousos-barreira-e-cortes-leiria-ID18cV9.html
3226	Moradia independente 4 quartos, garagem, jardim em Leiria	18cHN	355000	350		2	4	2022-02-23 21:33:34.608474	2022-02-23 21:33:34.608486	194	https://www.imovirtual.com/pt/anuncio/moradia-independente-4-quartos-garagem-jardim-em-leiria-ID18cHN.html
3227	Moradia T3 Nova	18cKl	265000	\N		2	4	2022-02-23 21:33:34.660931	2022-02-23 21:33:34.660947	140	https://www.imovirtual.com/pt/anuncio/moradia-t3-nova-ID18cKl.html
3228	Moradia - em fase de Construção	18cSr	325000	253		2	4	2022-02-23 21:33:35.051892	2022-02-23 21:33:35.051905	190	https://www.imovirtual.com/pt/anuncio/moradia-em-fase-de-construcao-ID18cSr.html
3229	Moradia Geminada T3 (flA1749B)	18cEA	245000	\N		2	10	2022-02-23 21:33:51.02831	2022-02-23 21:33:51.028324	130	https://www.imovirtual.com/pt/anuncio/moradia-geminada-t3-fla1749b-ID18cEA.html
3230	Moradia Geminada T3 (flA1749A)	18cDs	235000	\N		2	10	2022-02-23 21:33:51.055392	2022-02-23 21:33:51.055404	130	https://www.imovirtual.com/pt/anuncio/moradia-geminada-t3-fla1749a-ID18cDs.html
3231	Moradia V4+1 com piscina privativa	18cVb	800000	2110		2	13	2022-02-23 21:34:00.386071	2022-02-23 21:34:00.386078	947	https://www.imovirtual.com/pt/anuncio/moradia-v4-1-com-piscina-privativa-ID18cVb.html
3232	Moradia T2 Habitável para Remodelação	18d51	60000	\N		2	17	2022-02-25 00:39:25.558584	2022-02-25 00:39:25.558593	70	https://www.imovirtual.com/pt/anuncio/moradia-t2-habitavel-para-remodelacao-ID18d51.html
3233	Moradia completamente restaurada, com excelente bom gosto	18dzn	140000	700		2	2	2022-02-25 00:39:48.392299	2022-02-25 00:39:48.392307	120	https://www.imovirtual.com/pt/anuncio/moradia-completamente-restaurada-com-excelente-bom-gosto-ID18dzn.html
3234	Moradia T3 para venda	18dh5	175000	441		2	8	2022-02-25 00:40:16.615402	2022-02-25 00:40:16.615411	186	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-venda-ID18dh5.html
3235	Moradia T4 Nova- Marrazes	18dKe	285000	330		2	4	2022-02-25 14:10:19.239105	2022-02-25 14:10:19.239115	206	https://www.imovirtual.com/pt/anuncio/moradia-t4-nova-marrazes-ID18dKe.html
3236	Moradia Nova T4, Leiria	18efk	275000	311.7		2	4	2022-02-26 19:27:39.107994	2022-02-26 19:27:39.108005	183	https://www.imovirtual.com/pt/anuncio/moradia-nova-t4-leiria-ID18efk.html
3237	Moradia Casal Carolina Quinta do Cavaleiro T4	17uRT	279999	\N		2	4	2022-02-26 19:27:40.898748	2022-02-26 19:27:40.898758	184.5	https://www.imovirtual.com/pt/anuncio/moradia-casal-carolina-quinta-do-cavaleiro-t4-ID17uRT.html
3238	Moradia T3 para venda	18ffr	320000	461		2	3	2022-03-01 11:32:06.365121	2022-03-01 11:32:06.365132	166.77	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-venda-ID18ffr.html
3239	Moradia T5 Portela da Reixida - Cortes	18fbu	265000	2183		2	3	2022-03-01 11:32:10.983007	2022-03-01 11:32:10.983019	218.63	https://www.imovirtual.com/pt/anuncio/moradia-t5-portela-da-reixida-cortes-ID18fbu.html
3240	Moradia T4 Venda em Parceiros e Azoia,Leiria	18fJ9	286000	1216		2	12	2022-03-02 15:23:45.250284	2022-03-02 15:23:45.250321	310	https://www.imovirtual.com/pt/anuncio/moradia-t4-venda-em-parceiros-e-azoia-leiria-ID18fJ9.html
3241	Moradia e Arquitetura singular com projeto aprovado para 10 frações	18fPC	295000	\N		2	3	2022-03-02 17:10:26.525961	2022-03-02 17:10:26.52601	2283	https://www.imovirtual.com/pt/anuncio/moradia-e-arquitetura-singular-com-projeto-aprovado-para-10-fracoes-ID18fPC.html
3242	Moradia V4 com excelentes acabamentos	18fSX	355000	250		2	4	2022-03-02 17:10:37.21321	2022-03-02 17:10:37.213219	190	https://www.imovirtual.com/pt/anuncio/moradia-v4-com-excelentes-acabamentos-ID18fSX.html
3243	Moradia Unifamiliar - Gândara dos Olivais	18g2w	155000	\N		2	4	2022-03-02 20:10:39.484382	2022-03-02 20:10:39.484394	65	https://www.imovirtual.com/pt/anuncio/moradia-unifamiliar-gandara-dos-olivais-ID18g2w.html
3244	Moradia T4 | Pombal	18gxv	250000	\N		2	15	2022-03-04 02:51:26.880378	2022-03-04 02:51:26.880397	180	https://www.imovirtual.com/pt/anuncio/moradia-t4-pombal-ID18gxv.html
3245	Moradia individual térrea T3+1, Classe de eficiência energética A+	17Jp2	370000	557.45		2	3	2022-03-04 02:51:46.892938	2022-03-04 02:51:46.892949	169.33	https://www.imovirtual.com/pt/anuncio/moradia-individual-terrea-t3-1-classe-de-eficiencia-energetica-a-ID17Jp2.html
3246	Moradia T4 Independente Monte Redondo	18iK9	256000	\N		2	2	2022-03-09 00:44:54.427714	2022-03-09 00:44:54.427722	213	https://www.imovirtual.com/pt/anuncio/moradia-t4-independente-monte-redondo-ID18iK9.html
3247	Moradia T3+1 / Projecto Chave na Mão / Acabamentos Contemporâneos / Co	18iyC	360000	790		2	3	2022-03-09 00:44:59.105265	2022-03-09 00:44:59.105274	148	https://www.imovirtual.com/pt/anuncio/moradia-t3-1-projecto-chave-na-mao-acabamentos-contemporaneos-co-ID18iyC.html
3248	Moradia V5 -Exclusiva a 3 minutos de Leiria, com Piscina .	15AZC	890000	16200		2	3	2022-03-09 00:45:00.351433	2022-03-09 00:45:00.35144	489.6	https://www.imovirtual.com/pt/anuncio/moradia-v5-exclusiva-a-3-minutos-de-leiria-com-piscina-ID15AZC.html
3249	Excelente moradia individual	LH3z	275000	300		2	3	2022-03-09 00:45:02.314531	2022-03-09 00:45:02.31454	170	https://www.imovirtual.com/pt/anuncio/excelente-moradia-individual-IDLH3z.html
3250	Moradia V2 totalmente renovada	18i65	155000	130		2	4	2022-03-09 00:45:06.43392	2022-03-09 00:45:06.433928	65	https://www.imovirtual.com/pt/anuncio/moradia-v2-totalmente-renovada-ID18i65.html
3251	Moradia T2 Restaurada - Leiria	18iT7	155000	\N		2	4	2022-03-09 00:45:06.833694	2022-03-09 00:45:06.833704	65	https://www.imovirtual.com/pt/anuncio/moradia-t2-restaurada-leiria-ID18iT7.html
3252	Moradia Isolada T3 Venda em Marrazes e Barosa,Leiria	18hUb	265000	316.8		2	4	2022-03-09 00:45:07.159373	2022-03-09 00:45:07.159391	227.1	https://www.imovirtual.com/pt/anuncio/moradia-isolada-t3-venda-em-marrazes-e-barosa-leiria-ID18hUb.html
3253	Moradia T4 próximo do centro de Leiria	18hUQ	292000	480		2	4	2022-03-09 00:45:08.233527	2022-03-09 00:45:08.233537	275	https://www.imovirtual.com/pt/anuncio/moradia-t4-proximo-do-centro-de-leiria-ID18hUQ.html
3254	Moradia T3 Venda em Souto da Carpalhosa e Ortigosa,Leiria	18iSL	99000	1965		2	5	2022-03-09 00:45:10.952131	2022-03-09 00:45:10.952142	153	https://www.imovirtual.com/pt/anuncio/moradia-t3-venda-em-souto-da-carpalhosa-e-ortigosa-leiria-ID18iSL.html
3255	Quinta com moradia para remodelar- Monte Real	18iRQ	150000	4264		2	6	2022-03-09 00:45:13.555629	2022-03-09 00:45:13.555636	223	https://www.imovirtual.com/pt/anuncio/quinta-com-moradia-para-remodelar-monte-real-ID18iRQ.html
3256	Casa antiga para recuperação em Monte Real	18hbP	90000	918		2	6	2022-03-09 00:45:13.815473	2022-03-09 00:45:13.815484	78	https://www.imovirtual.com/pt/anuncio/casa-antiga-para-recuperacao-em-monte-real-ID18hbP.html
3257	Casa antiga para recuperar em Carvide - Leiria	18gSP	150000	4000		2	6	2022-03-09 00:45:13.850071	2022-03-09 00:45:13.850096	223	https://www.imovirtual.com/pt/anuncio/casa-antiga-para-recuperar-em-carvide-leiria-ID18gSP.html
3258	Moradia para remodelar- Monte Real	18iRO	90000	514		2	6	2022-03-09 00:45:14.25752	2022-03-09 00:45:14.257531	223	https://www.imovirtual.com/pt/anuncio/moradia-para-remodelar-monte-real-ID18iRO.html
3259	Moradia para remodelar, com Terreno - Monte Real	18iPo	90000	918		2	6	2022-03-09 00:45:14.457318	2022-03-09 00:45:14.45733	78	https://www.imovirtual.com/pt/anuncio/moradia-para-remodelar-com-terreno-monte-real-ID18iPo.html
3260	Moradia T3 Isolada com terreno na Bidoeira de Baixo, Leiria	18iB3	260000	1284		2	7	2022-03-09 00:45:15.629779	2022-03-09 00:45:15.62979	290	https://www.imovirtual.com/pt/anuncio/moradia-t3-isolada-com-terreno-na-bidoeira-de-baixo-leiria-ID18iB3.html
3261	Moradia T2	18i5G	165000	\N		2	13	2022-03-09 00:45:31.452404	2022-03-09 00:45:31.452417	126	https://www.imovirtual.com/pt/anuncio/moradia-t2-ID18i5G.html
3262	Moradia térrea independente	18gQm	270000	\N		2	14	2022-03-09 00:46:20.520813	2022-03-09 00:46:20.520821	250	https://www.imovirtual.com/pt/anuncio/moradia-terrea-independente-ID18gQm.html
3263	Moradia Térrea com piscina	18ipb	425000	1300		2	1	2022-03-10 17:58:57.259636	2022-03-10 17:58:57.259655	278	https://www.imovirtual.com/pt/anuncio/moradia-terrea-com-piscina-ID18ipb.html
3264	Moradia com muito potencial para investimento	17RCk	199000	173.8		2	3	2022-03-10 17:59:17.602204	2022-03-10 17:59:17.602211	173.8	https://www.imovirtual.com/pt/anuncio/moradia-com-muito-potencial-para-investimento-ID17RCk.html
3265	Moradia T2 para Venda em Marrazes, Leiria	18jWa	155000	130		2	4	2022-03-10 17:59:22.452647	2022-03-10 17:59:22.452666	65	https://www.imovirtual.com/pt/anuncio/moradia-t2-para-venda-em-marrazes-leiria-ID18jWa.html
3266	Moradia - 65 m² - T2	18jx1	155000	130		2	4	2022-03-10 17:59:23.117653	2022-03-10 17:59:23.11766	65	https://www.imovirtual.com/pt/anuncio/moradia-65-m-t2-ID18jx1.html
3267	Moradia T2 situada a 5 minutos da cidade de Leiria	18jn4	155000	130		2	4	2022-03-10 17:59:24.447626	2022-03-10 17:59:24.447633	56	https://www.imovirtual.com/pt/anuncio/moradia-t2-situada-a-5-minutos-da-cidade-de-leiria-ID18jn4.html
3268	Moradia T3 para reconstruir em Leiria	14XoG	35000	290		2	13	2022-03-10 17:59:51.451159	2022-03-10 17:59:51.451169	110	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-reconstruir-em-leiria-ID14XoG.html
3269	Moradia T4 | Cortes | Leiria.	18k8o	435000	\N		2	3	2022-03-15 17:59:21.458726	2022-03-15 17:59:21.458736	236	https://www.imovirtual.com/pt/anuncio/moradia-t4-cortes-leiria-ID18k8o.html
3270	Moradia - 370 m² - T5	18lKk	250000	427		2	3	2022-03-15 17:59:21.856783	2022-03-15 17:59:21.856791	370	https://www.imovirtual.com/pt/anuncio/moradia-370-m-t5-ID18lKk.html
3271	Moradia com piscina || Casal de Matos || Leiria	18kqc	417900	\N		2	3	2022-03-15 17:59:22.110483	2022-03-15 17:59:22.110493	150	https://www.imovirtual.com/pt/anuncio/moradia-com-piscina-casal-de-matos-leiria-ID18kqc.html
3272	Moradia geminada Barreira (não aceitamos mediadores)	18l5Q	270000	140.5		2	3	2022-03-15 17:59:24.419131	2022-03-15 17:59:24.419138	235	https://www.imovirtual.com/pt/anuncio/moradia-geminada-barreira-nao-aceitamos-mediadores-ID18l5Q.html
3273	Moradia T2 Venda em Marrazes e Barosa,Leiria	18lOS	155000	140		2	4	2022-03-15 17:59:30.376821	2022-03-15 17:59:30.376833	90	https://www.imovirtual.com/pt/anuncio/moradia-t2-venda-em-marrazes-e-barosa-leiria-ID18lOS.html
3274	Moradia T2	18m14	\N	\N		2	4	2022-03-15 17:59:30.911354	2022-03-15 17:59:30.911363	91	https://www.imovirtual.com/pt/anuncio/moradia-t2-ID18m14.html
3275	Moradia T2 Remodelada/Garagem/Gândara dos Olivais	18ka0	155000	130		2	4	2022-03-15 17:59:30.946125	2022-03-15 17:59:30.946137	56	https://www.imovirtual.com/pt/anuncio/moradia-t2-remodelada-garagem-gandara-dos-olivais-ID18ka0.html
3276	MORADIA T2 TÉRREA - TOTALMENTE REMODELADA - GÂNDARA DOS O...	18kCh	155000	130		2	4	2022-03-15 17:59:32.933493	2022-03-15 17:59:32.933501	57	https://www.imovirtual.com/pt/anuncio/moradia-t2-terrea-totalmente-remodelada-gandara-dos-o-ID18kCh.html
3277	Palacete a 5min da praia do Pedrogão!	18kqp	390000	703		2	11	2022-03-15 17:59:55.742283	2022-03-15 17:59:55.742291	283	https://www.imovirtual.com/pt/anuncio/palacete-a-5min-da-praia-do-pedrogao-ID18kqp.html
3278	Moradia com Terreno e mais 2 Terrenos para construção	18lCd	690000	1632		2	12	2022-03-15 18:00:00.58624	2022-03-15 18:00:00.586248	1632	https://www.imovirtual.com/pt/anuncio/moradia-com-terreno-e-mais-2-terrenos-para-construcao-ID18lCd.html
3279	Moradia - 72 m² - T5	18kQe	195000	1794		2	14	2022-03-15 18:00:07.797396	2022-03-15 18:00:07.797406	72	https://www.imovirtual.com/pt/anuncio/moradia-72-m-t5-ID18kQe.html
3280	Vende-se casa de campo/2000 m2 terreno - Carvalhais - Pombal	18lOG	49000	2000		2	15	2022-03-15 18:00:13.289762	2022-03-15 18:00:13.289771	50	https://www.imovirtual.com/pt/anuncio/vende-se-casa-de-campo-2000-m2-terreno-carvalhais-pombal-ID18lOG.html
3281	Moradia T4 || Vidigal || Leiria	18nBZ	208500	220		2	3	2022-03-19 10:39:40.626719	2022-03-19 10:39:40.626729	170	https://www.imovirtual.com/pt/anuncio/moradia-t4-vidigal-leiria-ID18nBZ.html
3282	Moradia antiga para Restaurar - Fontes	18nHC	90000	\N		2	3	2022-03-19 10:39:41.978578	2022-03-19 10:39:41.978588	60	https://www.imovirtual.com/pt/anuncio/moradia-antiga-para-restaurar-fontes-ID18nHC.html
3283	Moradia T4 em Leiria	18mir	197500	500		2	3	2022-03-19 10:39:42.467157	2022-03-19 10:39:42.467166	180	https://www.imovirtual.com/pt/anuncio/moradia-t4-em-leiria-ID18mir.html
3284	Moradia - 206 m2 - T4	18oc0	250000	430		2	4	2022-03-19 10:39:48.677042	2022-03-19 10:39:48.677053	206	https://www.imovirtual.com/pt/anuncio/moradia-206-m2-t4-ID18oc0.html
3285	Oportunidade Moradia T3 lote de terreno 323m2	18mOZ	175000	\N		2	4	2022-03-19 10:39:48.7982	2022-03-19 10:39:48.798212	180	https://www.imovirtual.com/pt/anuncio/oportunidade-moradia-t3-lote-de-terreno-323m2-ID18mOZ.html
3286	Moradia T3 NOVA - Lameira, Leiria	18m2y	245000	500		2	5	2022-03-19 10:39:54.03229	2022-03-19 10:39:54.032304	140	https://www.imovirtual.com/pt/anuncio/moradia-t3-nova-lameira-leiria-ID18m2y.html
3287	Moradia T4 / Nova / Leiria / Construção Nova / Boas áreas	18mLZ	260000	400		2	6	2022-03-19 10:39:56.503445	2022-03-19 10:39:56.503458	154	https://www.imovirtual.com/pt/anuncio/moradia-t4-nova-leiria-construcao-nova-boas-areas-ID18mLZ.html
3288	Moradia T4 / Nova / Leiria / Construção Nova / Boas áreas	18mLY	260000	400		2	6	2022-03-19 10:39:56.595434	2022-03-19 10:39:56.595446	153	https://www.imovirtual.com/pt/anuncio/moradia-t4-nova-leiria-construcao-nova-boas-areas-ID18mLY.html
3289	Moradia V3 - Monte Real	18mb9	255000	750		2	6	2022-03-19 10:39:57.303978	2022-03-19 10:39:57.304008	120	https://www.imovirtual.com/pt/anuncio/moradia-v3-monte-real-ID18mb9.html
3290	MORADIA M4 ENTRE POMBAL E LEIRIA	18mJt	110000	697		2	8	2022-03-19 10:40:02.594675	2022-03-19 10:40:02.594685	268.62	https://www.imovirtual.com/pt/anuncio/moradia-m4-entre-pombal-e-leiria-ID18mJt.html
3291	Moradia, 139 m², Colmeias e Memória	18mzb	477700	6000		2	8	2022-03-19 10:40:03.062814	2022-03-19 10:40:03.06283	139	https://www.imovirtual.com/pt/anuncio/moradia-139-m-colmeias-e-memoria-ID18mzb.html
3292	Moradia Unifamiliar T.4 Com terreno, terraço e churras. em Colmeias	18mZf	240000	830		2	8	2022-03-19 10:40:03.318922	2022-03-19 10:40:03.318932	236	https://www.imovirtual.com/pt/anuncio/moradia-unifamiliar-t-4-com-terreno-terraco-e-churras-em-colmeias-ID18mZf.html
3293	Moradia T2	18mWV	46000	3805.5		2	8	2022-03-19 10:40:03.365045	2022-03-19 10:40:03.365055	178	https://www.imovirtual.com/pt/anuncio/moradia-t2-ID18mWV.html
3294	Moradia T3 Venda em Coimbrão,Leiria	18nuB	142500	160		2	11	2022-03-19 10:40:09.497883	2022-03-19 10:40:09.497891	98	https://www.imovirtual.com/pt/anuncio/moradia-t3-venda-em-coimbrao-leiria-ID18nuB.html
3295	Moradia T3 em construção - Barosa	18nTq	170000	520		2	12	2022-03-19 10:40:13.206465	2022-03-19 10:40:13.206474	140	https://www.imovirtual.com/pt/anuncio/moradia-t3-em-construcao-barosa-ID18nTq.html
3296	Excelente Moradia T3+1  - Parceiros, Leiria	18o1a	295000	\N		2	12	2022-03-19 10:40:13.954208	2022-03-19 10:40:13.95422	150	https://www.imovirtual.com/pt/anuncio/excelente-moradia-t3-1-parceiros-leiria-ID18o1a.html
3297	Moradia Antiga em Carvalhais	16mID	27500	\N		2	15	2022-03-19 10:41:49.626654	2022-03-19 10:41:49.626664	55	https://www.imovirtual.com/pt/anuncio/moradia-antiga-em-carvalhais-ID16mID.html
3298	Casa e Terreno no Carriço  15 minutos da praia	18n5X	39500	\N		2	17	2022-03-19 10:41:52.543477	2022-03-19 10:41:52.543484	160	https://www.imovirtual.com/pt/anuncio/casa-e-terreno-no-carrico-15-minutos-da-praia-ID18n5X.html
3299	Moradia T3 no centro da Vila do Louriçal, Pombal	18n18	260000	267		2	19	2022-03-19 10:41:54.842928	2022-03-19 10:41:54.842941	117	https://www.imovirtual.com/pt/anuncio/moradia-t3-no-centro-da-vila-do-lourical-pombal-ID18n18.html
3300	Excelente investimento para habitação própria ou arrendamento	18qbH	29900	290		2	14	2022-04-02 10:30:45.984681	2022-04-02 10:30:45.984692	70.8	https://www.imovirtual.com/pt/anuncio/excelente-investimento-para-habitacao-propria-ou-arrendamento-ID18qbH.html
3301	Moradia em construção em fase de acabamentos em Outeiro d...	18sTd	160000	664		2	15	2022-04-02 10:30:50.675045	2022-04-02 10:30:50.675053	385	https://www.imovirtual.com/pt/anuncio/moradia-em-construcao-em-fase-de-acabamentos-em-outeiro-d-ID18sTd.html
3302	Moradia T1 para venda	18q4W	42000	2948		2	15	2022-04-02 10:30:51.977574	2022-04-02 10:30:51.977585	2948	https://www.imovirtual.com/pt/anuncio/moradia-t1-para-venda-ID18q4W.html
3303	Fabulosa moradia T4 com piscina	18p6s	760000	\N		2	17	2022-04-02 10:30:53.5541	2022-04-02 10:30:53.554116	557	https://www.imovirtual.com/pt/anuncio/fabulosa-moradia-t4-com-piscina-ID18p6s.html
3304	Moradia T2- Financiamento até 100%	18uUo	89000	205		2	18	2022-04-02 10:30:55.087739	2022-04-02 10:30:55.087748	210	https://www.imovirtual.com/pt/anuncio/moradia-t2-financiamento-ate-100-ID18uUo.html
3305	IMÓVEL em propriedade  horizontal	18onX	155000	\N		2	18	2022-04-02 10:30:55.444887	2022-04-02 10:30:55.4449	230	https://www.imovirtual.com/pt/anuncio/imovel-em-propriedade-horizontal-ID18onX.html
3306	Moradia C/ Piscina e 6000 m2 de Terreno	18qbp	895000	6000		2	19	2022-04-02 10:30:56.544846	2022-04-02 10:30:56.544861	601	https://www.imovirtual.com/pt/anuncio/moradia-c-piscina-e-6000-m2-de-terreno-ID18qbp.html
3307	Moradia T4 para venda	18qbd	380000	1960		2	1	2022-04-02 10:31:57.373128	2022-04-02 10:31:57.373139	371	https://www.imovirtual.com/pt/anuncio/moradia-t4-para-venda-ID18qbd.html
3308	Moradia V3 - Monte Redondo e Carreira	18tEr	350000	1195		2	2	2022-04-02 10:31:59.385343	2022-04-02 10:31:59.385404	271	https://www.imovirtual.com/pt/anuncio/moradia-v3-monte-redondo-e-carreira-ID18tEr.html
3309	Moradia T4 || Azabucho || Leiria	18tWq	650000	1151		2	3	2022-04-02 10:32:04.7297	2022-04-02 10:32:04.72971	374	https://www.imovirtual.com/pt/anuncio/moradia-t4-azabucho-leiria-ID18tWq.html
3310	Moradia T2 Marrazes	18uyt	155000	139		2	3	2022-04-02 10:32:04.782962	2022-04-02 10:32:04.782976	65	https://www.imovirtual.com/pt/anuncio/moradia-t2-marrazes-ID18uyt.html
3311	Moradia T3+1 casal de Matos	18u7P	377000	390		2	3	2022-04-02 10:32:05.487533	2022-04-02 10:32:05.487545	406	https://www.imovirtual.com/pt/anuncio/moradia-t3-1-casal-de-matos-ID18u7P.html
3312	Moradia V3+1 em excelente estado com terreno	18r1l	295000	83		2	3	2022-04-02 10:32:05.529989	2022-04-02 10:32:05.53	177	https://www.imovirtual.com/pt/anuncio/moradia-v3-1-em-excelente-estado-com-terreno-ID18r1l.html
3313	Moradia T2  para venda	18qf8	129000	\N		2	3	2022-04-02 10:32:05.578897	2022-04-02 10:32:05.578904	22	https://www.imovirtual.com/pt/anuncio/moradia-t2-para-venda-ID18qf8.html
3314	Moradia, 65 m², Leiria, Pousos, Barreira e Cortes	18tze	155000	140		2	3	2022-04-02 10:32:06.136827	2022-04-02 10:32:06.136834	65	https://www.imovirtual.com/pt/anuncio/moradia-65-m-leiria-pousos-barreira-e-cortes-ID18tze.html
3315	Moradia individual T2 para Remodelar (flD1803)	18uae	163000	360		2	3	2022-04-02 10:32:06.788475	2022-04-02 10:32:06.788483	100	https://www.imovirtual.com/pt/anuncio/moradia-individual-t2-para-remodelar-fld1803-ID18uae.html
3316	Moradia Individual Térrea T3 (flD1705)	15vgt	260000	470		2	3	2022-04-02 10:32:07.382909	2022-04-02 10:32:07.382918	160	https://www.imovirtual.com/pt/anuncio/moradia-individual-terrea-t3-fld1705-ID15vgt.html
3317	Moradia V2+1 Rústica - Fontes  - Vista Rio	177vB	225000	323		2	3	2022-04-02 10:32:07.658153	2022-04-02 10:32:07.65816	166	https://www.imovirtual.com/pt/anuncio/moradia-v2-1-rustica-fontes-vista-rio-ID177vB.html
3318	MORADIA NO CENTRO DE LEIRIA	18qMO	450000	\N		2	3	2022-04-02 10:32:07.930825	2022-04-02 10:32:07.930833	160	https://www.imovirtual.com/pt/anuncio/moradia-no-centro-de-leiria-ID18qMO.html
3319	Moradia em banda Barreira- Leiria	18srQ	270000	\N		2	3	2022-04-02 10:32:07.960869	2022-04-02 10:32:07.960878	235	https://www.imovirtual.com/pt/anuncio/moradia-em-banda-barreira-leiria-ID18srQ.html
3320	Moradia P/ Recuperar - Praia da Vieira	18qb4	130000	143		2	3	2022-04-02 10:32:08.191133	2022-04-02 10:32:08.191146	100	https://www.imovirtual.com/pt/anuncio/moradia-p-recuperar-praia-da-vieira-ID18qb4.html
3321	Moradia T3 I| 5 min centro cidade Leiria	18um0	175000	\N		2	4	2022-04-02 10:32:13.072866	2022-04-02 10:32:13.072876	100	https://www.imovirtual.com/pt/anuncio/moradia-t3-i-5-min-centro-cidade-leiria-ID18um0.html
3322	Moradia Geminada	18ujH	215000	\N		2	4	2022-04-02 10:32:13.120788	2022-04-02 10:32:13.120802	166	https://www.imovirtual.com/pt/anuncio/moradia-geminada-ID18ujH.html
3323	Moradia T2, Marrazes	18sQa	60000	124		2	4	2022-04-02 10:32:13.354482	2022-04-02 10:32:13.354492	50	https://www.imovirtual.com/pt/anuncio/moradia-t2-marrazes-ID18sQa.html
3324	Moradia T4 inserido num condomínio fechado com Piscina na...	18rdn	210000	304		2	4	2022-04-02 10:32:13.411435	2022-04-02 10:32:13.411442	194	https://www.imovirtual.com/pt/anuncio/moradia-t4-inserido-num-condominio-fechado-com-piscina-na-ID18rdn.html
3325	Moradia São Pedro de Moel	18qbo	470000	819		2	4	2022-04-02 10:32:13.814947	2022-04-02 10:32:13.814964	190	https://www.imovirtual.com/pt/anuncio/moradia-sao-pedro-de-moel-ID18qbo.html
3326	Moradia independente, T5, Barosa, Estrada Nacional 242	18qdk	285000	840		2	4	2022-04-02 10:32:13.93461	2022-04-02 10:32:13.934621	191	https://www.imovirtual.com/pt/anuncio/moradia-independente-t5-barosa-estrada-nacional-242-ID18qdk.html
3327	Moradia V5 - Monte Real e Carvide	18tXB	265500	369.5		2	4	2022-04-02 10:32:15.134699	2022-04-02 10:32:15.134708	320	https://www.imovirtual.com/pt/anuncio/moradia-v5-monte-real-e-carvide-ID18tXB.html
3328	Moradia devoluta num terreno 853 m2 em Janardo , Leiria	18qpY	67500	853		2	4	2022-04-02 10:32:15.282775	2022-04-02 10:32:15.282786	60	https://www.imovirtual.com/pt/anuncio/moradia-devoluta-num-terreno-853-m2-em-janardo-leiria-ID18qpY.html
3329	Moradia remodelada	18pqL	155000	\N		2	4	2022-04-02 10:32:15.767614	2022-04-02 10:32:15.767622	56	https://www.imovirtual.com/pt/anuncio/moradia-remodelada-ID18pqL.html
3330	Moradia T4 para venda	18rIl	210000	305.13		2	4	2022-04-02 10:32:16.02188	2022-04-02 10:32:16.021892	194.85	https://www.imovirtual.com/pt/anuncio/moradia-t4-para-venda-ID18rIl.html
3331	Moradia térrea  / terreno de 542 m2 / Marinheiros / Leiria	16QEe	148000	542		2	4	2022-04-02 10:32:16.359333	2022-04-02 10:32:16.359341	231	https://www.imovirtual.com/pt/anuncio/moradia-terrea-terreno-de-542-m2-marinheiros-leiria-ID16QEe.html
3332	Propriedade Luxo T6	18tAR	1250000	\N		2	5	2022-04-02 10:32:18.315134	2022-04-02 10:32:18.315145	520	https://www.imovirtual.com/pt/anuncio/propriedade-luxo-t6-ID18tAR.html
3333	Moradia Isolada T3 / Nova / Jardim / Excelentes Áreas / Leiria	18tNs	300000	543		2	6	2022-04-02 10:32:21.428196	2022-04-02 10:32:21.428206	200	https://www.imovirtual.com/pt/anuncio/moradia-isolada-t3-nova-jardim-excelentes-areas-leiria-ID18tNs.html
3334	Moradia isolada em Carvide	18tKR	72500	\N		2	6	2022-04-02 10:32:21.489675	2022-04-02 10:32:21.489692	100	https://www.imovirtual.com/pt/anuncio/moradia-isolada-em-carvide-ID18tKR.html
3335	Moradia T3 Monte Real	18u2n	300000	543		2	6	2022-04-02 10:32:21.573382	2022-04-02 10:32:21.573393	200	https://www.imovirtual.com/pt/anuncio/moradia-t3-monte-real-ID18u2n.html
3336	Moradia V3 - Monte Real	18uZp	300000	543		2	6	2022-04-02 10:32:21.701851	2022-04-02 10:32:21.701861	200	https://www.imovirtual.com/pt/anuncio/moradia-v3-monte-real-ID18uZp.html
3337	Moradia Nova T3 - Monte Real	18tJQ	300000	\N		2	6	2022-04-02 10:32:21.849441	2022-04-02 10:32:21.849454	190	https://www.imovirtual.com/pt/anuncio/moradia-nova-t3-monte-real-ID18tJQ.html
3338	Moradia V3 térrea com garagem e terreno	18pQz	300000	544		2	6	2022-04-02 10:32:21.990839	2022-04-02 10:32:21.990847	220	https://www.imovirtual.com/pt/anuncio/moradia-v3-terrea-com-garagem-e-terreno-ID18pQz.html
3339	Moradia T3+1 (B), em construção, para Venda em Monte Real	18pcP	260000	\N		2	6	2022-04-02 10:32:22.201908	2022-04-02 10:32:22.201923	204	https://www.imovirtual.com/pt/anuncio/moradia-t3-1-b-em-construcao-para-venda-em-monte-real-ID18pcP.html
3340	Moradia T3+1 (A), em construção, para Venda em Monte Real	18pcQ	260000	\N		2	6	2022-04-02 10:32:22.263001	2022-04-02 10:32:22.263012	174	https://www.imovirtual.com/pt/anuncio/moradia-t3-1-a-em-construcao-para-venda-em-monte-real-ID18pcQ.html
3341	Moradia T3 para Venda	18qbI	129000	758		2	6	2022-04-02 10:32:22.304099	2022-04-02 10:32:22.30411	178	https://www.imovirtual.com/pt/anuncio/moradia-t3-para-venda-ID18qbI.html
3342	Moradia T3 térrea NOVA - Monte Real	18ud6	300000	544		2	6	2022-04-02 10:32:22.43722	2022-04-02 10:32:22.437227	220	https://www.imovirtual.com/pt/anuncio/moradia-t3-terrea-nova-monte-real-ID18ud6.html
3343	Moradia T3 Venda em Monte Real e Carvide,Leiria	18w0b	300000	543.4		2	6	2022-04-02 10:32:23.116529	2022-04-02 10:32:23.116545	220	https://www.imovirtual.com/pt/anuncio/moradia-t3-venda-em-monte-real-e-carvide-leiria-ID18w0b.html
3344	Moradia Isolada T4 Venda em Bidoeira de Cima,Leiria	18w0c	230000	622.5		2	7	2022-04-02 10:32:25.117945	2022-04-02 10:32:25.117954	327	https://www.imovirtual.com/pt/anuncio/moradia-isolada-t4-venda-em-bidoeira-de-cima-leiria-ID18w0c.html
3345	Moradia T4 para venda	18qbU	395000	1400		2	8	2022-04-02 10:32:27.436698	2022-04-02 10:32:27.436713	287	https://www.imovirtual.com/pt/anuncio/moradia-t4-para-venda-ID18qbU.html
3346	Moradia V4 c/ garagem	17Zdd	160000	2480		2	8	2022-04-02 10:32:27.478251	2022-04-02 10:32:27.478261	298	https://www.imovirtual.com/pt/anuncio/moradia-v4-c-garagem-ID17Zdd.html
3347	Moradia isolada com piscina	18upQ	182500	\N		2	8	2022-04-02 10:32:27.877953	2022-04-02 10:32:27.877962	160	https://www.imovirtual.com/pt/anuncio/moradia-isolada-com-piscina-ID18upQ.html
3348	Moradia V4 para Venda	18uza	79500	\N		2	10	2022-04-02 10:32:32.17001	2022-04-02 10:32:32.17002	105	https://www.imovirtual.com/pt/anuncio/moradia-v4-para-venda-ID18uza.html
3349	Casa Antiga - Coimbrão	18s7l	82500	1500		2	11	2022-04-02 10:32:34.885709	2022-04-02 10:32:34.885721	80	https://www.imovirtual.com/pt/anuncio/casa-antiga-coimbrao-ID18s7l.html
3350	Moradia por recuperar com Terreno com poço e furo na Azóia	18usi	69000	1056		2	12	2022-04-02 10:32:36.945187	2022-04-02 10:32:36.945194	36	https://www.imovirtual.com/pt/anuncio/moradia-por-recuperar-com-terreno-com-poco-e-furo-na-azoia-ID18usi.html
3351	Moradia T2 para venda	18qbW	108000	550		2	12	2022-04-02 10:32:37.249702	2022-04-02 10:32:37.249713	240	https://www.imovirtual.com/pt/anuncio/moradia-t2-para-venda-ID18qbW.html
3352	Moradia em construção / Parceiros/ Leiria	18rGO	375000	490		2	12	2022-04-02 10:32:37.814724	2022-04-02 10:32:37.814731	160	https://www.imovirtual.com/pt/anuncio/moradia-em-construcao-parceiros-leiria-ID18rGO.html
3353	Moradia Isolada T3 / Nova / Excelente Exposição Solar / Leiria	18uRm	260000	472		2	13	2022-04-02 10:32:39.745173	2022-04-02 10:32:39.745183	160	https://www.imovirtual.com/pt/anuncio/moradia-isolada-t3-nova-excelente-exposicao-solar-leiria-ID18uRm.html
3354	Vende-se moradia térrea T3 - Leiria	160KJ	260000	470		2	13	2022-04-02 10:32:40.076618	2022-04-02 10:32:40.076629	191	https://www.imovirtual.com/pt/anuncio/vende-se-moradia-terrea-t3-leiria-ID160KJ.html
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: preisnunes
--

COPY public.regions (id, name, external_id) FROM stdin;
7	Leiria	5
\.


--
-- Data for Name: subregions; Type: TABLE DATA; Schema: public; Owner: preisnunes
--

COPY public.subregions (id, name, external_id, region_id) FROM stdin;
1	Leiria	140	7
2	Pombal	146	7
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: preisnunes
--

COPY public.types (id, name) FROM stdin;
1	apartamento
2	moradia
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: preisnunes
--

SELECT pg_catalog.setval('public.cities_id_seq', 19, true);


--
-- Name: houses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: preisnunes
--

SELECT pg_catalog.setval('public.houses_id_seq', 3354, true);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: preisnunes
--

SELECT pg_catalog.setval('public.regions_id_seq', 7, true);


--
-- Name: subregions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: preisnunes
--

SELECT pg_catalog.setval('public.subregions_id_seq', 2, true);


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: preisnunes
--

SELECT pg_catalog.setval('public.types_id_seq', 2, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: houses houses_pkey; Type: CONSTRAINT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.houses
    ADD CONSTRAINT houses_pkey PRIMARY KEY (id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: subregions subregions_pkey; Type: CONSTRAINT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.subregions
    ADD CONSTRAINT subregions_pkey PRIMARY KEY (id);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: cities cities_subregion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_subregion_id_fkey FOREIGN KEY (subregion_id) REFERENCES public.subregions(id);


--
-- Name: houses houses_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.houses
    ADD CONSTRAINT houses_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: houses houses_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.houses
    ADD CONSTRAINT houses_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- Name: subregions subregions_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: preisnunes
--

ALTER TABLE ONLY public.subregions
    ADD CONSTRAINT subregions_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- PostgreSQL database dump complete
--

