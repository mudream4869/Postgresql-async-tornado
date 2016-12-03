--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: tTest; Type: TABLE; Schema: public; Owner: cultural107; Tablespace: 
--

CREATE TABLE "tTest" (
    id1 integer NOT NULL,
    str1 character varying
);


ALTER TABLE public."tTest" OWNER TO cultural107;

--
-- Name: tTest_id1_seq; Type: SEQUENCE; Schema: public; Owner: cultural107
--

CREATE SEQUENCE "tTest_id1_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tTest_id1_seq" OWNER TO cultural107;

--
-- Name: tTest_id1_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cultural107
--

ALTER SEQUENCE "tTest_id1_seq" OWNED BY "tTest".id1;


--
-- Name: id1; Type: DEFAULT; Schema: public; Owner: cultural107
--

ALTER TABLE ONLY "tTest" ALTER COLUMN id1 SET DEFAULT nextval('"tTest_id1_seq"'::regclass);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

