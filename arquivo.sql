--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8
-- Dumped by pg_dump version 12.8

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
-- Name: convidado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.convidado (
    rg character varying(255) NOT NULL,
    nome_convidado character varying(255),
    evento_codigo bigint
);


ALTER TABLE public.convidado OWNER TO postgres;

--
-- Name: evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evento (
    codigo bigint NOT NULL,
    data character varying(255),
    horario character varying(255),
    local character varying(255),
    nome character varying(255)
);


ALTER TABLE public.evento OWNER TO postgres;

--
-- Name: evento_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evento_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evento_codigo_seq OWNER TO postgres;

--
-- Name: evento_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evento_codigo_seq OWNED BY public.evento.codigo;


--
-- Name: evento_convidado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evento_convidado (
    evento_codigo bigint NOT NULL,
    convidado_rg character varying(255) NOT NULL
);


ALTER TABLE public.evento_convidado OWNER TO postgres;

--
-- Name: evento codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento ALTER COLUMN codigo SET DEFAULT nextval('public.evento_codigo_seq'::regclass);


--
-- Data for Name: convidado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.convidado (rg, nome_convidado, evento_codigo) FROM stdin;
\.


--
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evento (codigo, data, horario, local, nome) FROM stdin;
\.


--
-- Data for Name: evento_convidado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evento_convidado (evento_codigo, convidado_rg) FROM stdin;
\.


--
-- Name: evento_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evento_codigo_seq', 9, true);


--
-- Name: convidado convidado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convidado
    ADD CONSTRAINT convidado_pkey PRIMARY KEY (rg);


--
-- Name: evento evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (codigo);


--
-- Name: evento_convidado uk_l56rf6iekqg8r13of5mb3a09n; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento_convidado
    ADD CONSTRAINT uk_l56rf6iekqg8r13of5mb3a09n UNIQUE (convidado_rg);


--
-- Name: convidado fk4tlkcowf3oxi1u8wmjd9bhes4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convidado
    ADD CONSTRAINT fk4tlkcowf3oxi1u8wmjd9bhes4 FOREIGN KEY (evento_codigo) REFERENCES public.evento(codigo);


--
-- Name: evento_convidado fkku3jwhy9sk9sphnnjq702s786; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento_convidado
    ADD CONSTRAINT fkku3jwhy9sk9sphnnjq702s786 FOREIGN KEY (evento_codigo) REFERENCES public.evento(codigo);


--
-- Name: evento_convidado fko48gyu5h7jujlo0rkcd5t0nwh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento_convidado
    ADD CONSTRAINT fko48gyu5h7jujlo0rkcd5t0nwh FOREIGN KEY (convidado_rg) REFERENCES public.convidado(rg);


--
-- PostgreSQL database dump complete
--

