--
-- PostgreSQL database dump
--

\restrict M0JrYfHkwUFlkvMrVFPCaoZlCRwr9FMs3egTTcBZcteFuUcI9BrgTw0nV9c07a7

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-05-26 23:22:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16390)
-- Name: registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registrations (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(20),
    date_of_birth date,
    res_city character varying(100),
    res_street character varying(255),
    res_erf character varying(100),
    res_country character varying(100),
    postal_address character varying(100),
    postal_city character varying(100),
    postal_country character varying(100)
);


ALTER TABLE public.registrations OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.registrations_id_seq OWNER TO postgres;

--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 219
-- Name: registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registrations_id_seq OWNED BY public.registrations.id;


--
-- TOC entry 4856 (class 2604 OID 16393)
-- Name: registrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations ALTER COLUMN id SET DEFAULT nextval('public.registrations_id_seq'::regclass);


--
-- TOC entry 4859 (class 2606 OID 16404)
-- Name: registrations registrations_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_email_key UNIQUE (email);


--
-- TOC entry 4861 (class 2606 OID 16402)
-- Name: registrations registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id);


-- Completed on 2026-05-26 23:22:30

--
-- PostgreSQL database dump complete
--

\unrestrict M0JrYfHkwUFlkvMrVFPCaoZlCRwr9FMs3egTTcBZcteFuUcI9BrgTw0nV9c07a7

