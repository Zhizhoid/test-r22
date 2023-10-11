--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9
-- Dumped by pg_dump version 14.9

-- Started on 2023-09-20 09:42:05

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

DROP DATABASE IF EXISTS test_school_db;
--
-- TOC entry 3361 (class 1262 OID 16394)
-- Name: test_school_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE test_school_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Latvian_Latvia.1257';


ALTER DATABASE test_school_db OWNER TO postgres;

\connect test_school_db

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
-- TOC entry 210 (class 1259 OID 16402)
-- Name: classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classes (
    id integer NOT NULL,
    class_number smallint NOT NULL,
    class_letter "char" NOT NULL,
    school_id integer NOT NULL
);


ALTER TABLE public.classes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16477)
-- Name: classes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.classes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 16414)
-- Name: exams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exams (
    id integer NOT NULL,
    subject_id integer NOT NULL,
    name text
);


ALTER TABLE public.exams OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16421)
-- Name: schools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schools (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.schools OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16476)
-- Name: schools_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.schools ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.schools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 209 (class 1259 OID 16395)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    name text NOT NULL,
    class_id integer NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16433)
-- Name: students_exams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_exams (
    id integer NOT NULL,
    student_id integer NOT NULL,
    exam_id integer NOT NULL
);


ALTER TABLE public.students_exams OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16479)
-- Name: students_exams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.students_exams ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_exams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16478)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.students ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 16428)
-- Name: students_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_subjects (
    id integer NOT NULL,
    student_id integer NOT NULL,
    subject_id integer NOT NULL
);


ALTER TABLE public.students_subjects OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16480)
-- Name: students_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.students_subjects ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 16407)
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    name text NOT NULL,
    "timesPerWeek" smallint NOT NULL
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16481)
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.subjects ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3197 (class 2606 OID 16406)
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 16420)
-- Name: exams exams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 16427)
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 16437)
-- Name: students_exams students_exams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_exams
    ADD CONSTRAINT students_exams_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 16401)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 16432)
-- Name: students_subjects students_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_subjects
    ADD CONSTRAINT students_subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 16413)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 1259 OID 16443)
-- Name: fki_classes; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_classes ON public.students USING btree (class_id);


--
-- TOC entry 3198 (class 1259 OID 16449)
-- Name: fki_schools; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_schools ON public.classes USING btree (school_id);


--
-- TOC entry 3205 (class 1259 OID 16475)
-- Name: fki_subject; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_subject ON public.students_subjects USING btree (subject_id);


--
-- TOC entry 3210 (class 2606 OID 16438)
-- Name: students classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT classes FOREIGN KEY (class_id) REFERENCES public.classes(id);


--
-- TOC entry 3216 (class 2606 OID 16460)
-- Name: students_exams exam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_exams
    ADD CONSTRAINT exam FOREIGN KEY (exam_id) REFERENCES public.exams(id);


--
-- TOC entry 3211 (class 2606 OID 16444)
-- Name: classes school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT school FOREIGN KEY (school_id) REFERENCES public.schools(id);


--
-- TOC entry 3215 (class 2606 OID 16455)
-- Name: students_exams student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_exams
    ADD CONSTRAINT student FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- TOC entry 3213 (class 2606 OID 16465)
-- Name: students_subjects student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_subjects
    ADD CONSTRAINT student FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- TOC entry 3214 (class 2606 OID 16470)
-- Name: students_subjects subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_subjects
    ADD CONSTRAINT subject FOREIGN KEY (subject_id) REFERENCES public.subjects(id) NOT VALID;


--
-- TOC entry 3212 (class 2606 OID 16450)
-- Name: exams subjects; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT subjects FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


-- Completed on 2023-09-20 09:42:05

--
-- PostgreSQL database dump complete
--

