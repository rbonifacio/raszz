--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12
-- Dumped by pg_dump version 10.12

-- Started on 2020-04-08 14:11:21

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

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 286 (class 1255 OID 538768)
-- Name: _final_median(numeric[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public._final_median(numeric[]) RETURNS numeric
    LANGUAGE sql IMMUTABLE
    AS $_$
   SELECT AVG(val)
   FROM (
     SELECT val
     FROM unnest($1) val
     ORDER BY 1
     LIMIT  2 - MOD(array_upper($1, 1), 2)
     OFFSET CEIL(array_upper($1, 1) / 2.0) - 1
   ) sub;
$_$;


ALTER FUNCTION public._final_median(numeric[]) OWNER TO postgres;

--
-- TOC entry 972 (class 1255 OID 538769)
-- Name: median(numeric); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE public.median(numeric) (
    SFUNC = array_append,
    STYPE = numeric[],
    INITCOND = '{}',
    FINALFUNC = public._final_median
);


ALTER AGGREGATE public.median(numeric) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 538770)
-- Name: apachemaillistmessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apachemaillistmessage (
    id bigint NOT NULL,
    author character varying(255),
    broken boolean NOT NULL,
    date timestamp without time zone,
    link character varying(255),
    project character varying(255)
);


ALTER TABLE public.apachemaillistmessage OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 538776)
-- Name: archive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archive (
    id bigint NOT NULL,
    name character varying(10485760)
);


ALTER TABLE public.archive OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 538782)
-- Name: archive_path; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archive_path (
    archive_id bigint NOT NULL,
    path_id bigint NOT NULL
);


ALTER TABLE public.archive_path OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 538785)
-- Name: authorbugfixes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorbugfixes (
    id bigint NOT NULL,
    author character varying(255)
);


ALTER TABLE public.authorbugfixes OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 538788)
-- Name: authorbugfixes_issueactivity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorbugfixes_issueactivity (
    authorbugfixes_id bigint NOT NULL,
    fixactivities_id bigint NOT NULL
);


ALTER TABLE public.authorbugfixes_issueactivity OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 538791)
-- Name: bicagszz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bicagszz (
    linenumber bigint,
    path character varying,
    content character varying,
    revision bigint,
    fixrevision bigint,
    project character varying,
    szz_date timestamp without time zone,
    copypath character varying,
    copyrevision bigint,
    mergerev boolean,
    branchrev boolean,
    changeproperty boolean,
    missed boolean,
    furtherback boolean,
    contentdiff character varying,
    issample boolean,
    diffjmessage character varying,
    diffjlocation character varying,
    refdiffindex integer,
    adjustmentindex integer,
    indexposrefac integer,
    indexfurtherback integer,
    indexchangepath integer,
    isrefac boolean
);


ALTER TABLE public.bicagszz OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 538797)
-- Name: bicbszz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bicbszz (
    linenumber bigint,
    path character varying,
    content character varying,
    revision bigint,
    fixrevision bigint,
    project character varying,
    szz_date timestamp without time zone,
    copypath character varying,
    copyrevision bigint,
    mergerev boolean,
    branchrev boolean,
    changeproperty boolean,
    missed boolean,
    furtherback boolean,
    contentdiff character varying,
    issample boolean,
    diffjmessage character varying,
    diffjlocation character varying,
    refdiffindex integer,
    adjustmentindex integer,
    indexposrefac integer,
    indexfurtherback integer,
    indexchangepath integer,
    isrefac boolean
);


ALTER TABLE public.bicbszz OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 538803)
-- Name: bicmaszz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bicmaszz (
    linenumber bigint,
    path character varying,
    content character varying,
    revision bigint,
    fixrevision bigint,
    project character varying,
    szz_date timestamp without time zone,
    copypath character varying,
    copyrevision bigint,
    mergerev boolean,
    branchrev boolean,
    changeproperty boolean,
    missed boolean,
    furtherback boolean,
    contentdiff character varying,
    issample boolean,
    diffjmessage character varying,
    diffjlocation character varying,
    refdiffindex integer,
    adjustmentindex integer,
    indexposrefac integer,
    indexfurtherback integer,
    indexchangepath integer,
    isrefac boolean,
    startrevision character varying,
    startpath character varying,
    startlinenumber bigint,
    startcontent character varying
);


ALTER TABLE public.bicmaszz OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 538809)
-- Name: bicmaszzgit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bicmaszzgit (
    linenumber bigint,
    path character varying,
    content character varying,
    revision character varying,
    fixrevision character varying,
    project character varying,
    szz_date timestamp without time zone,
    copypath character varying,
    copyrevision bigint,
    mergerev boolean,
    branchrev boolean,
    changeproperty boolean,
    missed boolean,
    furtherback boolean,
    contentdiff character varying,
    issample boolean,
    diffjmessage character varying,
    diffjlocation character varying,
    refdiffindex integer,
    adjustmentindex integer,
    indexposrefac integer,
    indexfurtherback integer,
    indexchangepath integer,
    isrefac boolean,
    startrevision character varying,
    startpath character varying,
    startlinenumber bigint,
    startcontent character varying,
    isvalidfix boolean,
    hasmatchraszz boolean,
    isvalidresult boolean,
    obs character varying,
    truerevision character varying,
    isinitialimport boolean,
    hasmatchraszzold boolean
);


ALTER TABLE public.bicmaszzgit OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 538815)
-- Name: bicmaszztest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bicmaszztest (
    linenumber bigint,
    path character varying,
    content character varying,
    revision character varying,
    fixrevision character varying,
    project character varying,
    szz_date timestamp without time zone,
    copypath character varying,
    copyrevision bigint,
    mergerev boolean,
    branchrev boolean,
    changeproperty boolean,
    missed boolean,
    furtherback boolean,
    contentdiff character varying,
    issample boolean,
    diffjmessage character varying,
    diffjlocation character varying,
    refdiffindex integer,
    adjustmentindex integer,
    indexposrefac integer,
    indexfurtherback integer,
    indexchangepath integer,
    isrefac boolean,
    startrevision character varying,
    startpath character varying,
    startlinenumber bigint,
    startcontent character varying,
    isvalidfix boolean,
    hasmatchraszz boolean,
    isvalidresult boolean,
    obs character varying,
    truerevision character varying,
    isinitialimport boolean,
    hasmatchraszzold boolean
);


ALTER TABLE public.bicmaszztest OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 538821)
-- Name: bicoracle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bicoracle (
    bug_id bigint,
    project character varying,
    linenumber character varying,
    path character varying,
    content character varying,
    revision character varying,
    fixrevision character varying,
    indexfurtherback integer,
    startpath character varying,
    startlinenumber bigint,
    startcontent character varying,
    isinitialimport boolean
);


ALTER TABLE public.bicoracle OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 538827)
-- Name: bicraszz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bicraszz (
    linenumber bigint,
    path character varying,
    content character varying,
    project character varying,
    szz_date timestamp without time zone,
    copypath character varying,
    copyrevision bigint,
    mergerev boolean,
    branchrev boolean,
    changeproperty boolean,
    missed boolean,
    furtherback boolean,
    contentdiff character varying,
    issample boolean,
    diffjmessage character varying,
    diffjlocation character varying,
    refdiffindex integer,
    adjustmentindex integer,
    indexposrefac integer,
    indexfurtherback integer,
    indexchangepath integer,
    isrefac boolean,
    revision character varying,
    fixrevision character varying,
    islargest boolean,
    islatest boolean,
    startrevision character varying,
    startpath character varying,
    startlinenumber bigint,
    startcontent character varying,
    isvalidfix boolean,
    hasmatchmaszz boolean,
    isvalidresult boolean
);


ALTER TABLE public.bicraszz OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 538833)
-- Name: bicraszzgit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bicraszzgit (
    linenumber bigint,
    path character varying,
    content character varying,
    project character varying,
    szz_date timestamp without time zone,
    copypath character varying,
    copyrevision bigint,
    mergerev boolean,
    branchrev boolean,
    changeproperty boolean,
    missed boolean,
    furtherback boolean,
    contentdiff character varying,
    issample boolean,
    diffjmessage character varying,
    diffjlocation character varying,
    refdiffindex integer,
    adjustmentindex integer,
    indexposrefac integer,
    indexfurtherback integer,
    indexchangepath integer,
    isrefac boolean,
    revision character varying,
    fixrevision character varying,
    islargest boolean,
    islatest boolean,
    startrevision character varying,
    startpath character varying,
    startlinenumber bigint,
    startcontent character varying,
    isvalidfix boolean,
    hasmatchmaszz boolean,
    isvalidresult boolean
);


ALTER TABLE public.bicraszzgit OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 538839)
-- Name: bicraszzold; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bicraszzold (
    linenumber bigint,
    path character varying,
    content character varying,
    project character varying,
    szz_date timestamp without time zone,
    copypath character varying,
    copyrevision bigint,
    mergerev boolean,
    branchrev boolean,
    changeproperty boolean,
    missed boolean,
    furtherback boolean,
    contentdiff character varying,
    issample boolean,
    diffjmessage character varying,
    diffjlocation character varying,
    refdiffindex integer,
    adjustmentindex integer,
    indexposrefac integer,
    indexfurtherback integer,
    indexchangepath integer,
    isrefac boolean,
    revision character varying,
    fixrevision character varying,
    islargest boolean,
    islatest boolean,
    startrevision character varying,
    startpath character varying,
    startlinenumber bigint,
    startcontent character varying,
    isvalidfix boolean,
    hasmatchmaszz boolean,
    isvalidresult boolean
);


ALTER TABLE public.bicraszzold OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 538845)
-- Name: bicszzse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bicszzse (
    linenumber bigint,
    path character varying,
    content character varying,
    revision bigint,
    fixrevision bigint,
    project character varying,
    szz_date timestamp without time zone,
    copypath character varying,
    copyrevision bigint,
    mergerev boolean,
    branchrev boolean,
    changeproperty boolean,
    missed boolean,
    furtherback boolean,
    contentdiff character varying,
    issample boolean,
    diffjmessage character varying,
    diffjlocation character varying,
    refdiffindex integer,
    adjustmentindex integer
);


ALTER TABLE public.bicszzse OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 538851)
-- Name: bicszzse2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bicszzse2 (
    linenumber bigint,
    path character varying,
    content character varying,
    revision bigint,
    fixrevision bigint,
    project character varying,
    szz_date timestamp without time zone,
    copypath character varying,
    copyrevision bigint,
    mergerev boolean,
    branchrev boolean,
    changeproperty boolean,
    missed boolean,
    furtherback boolean,
    contentdiff character varying,
    issample boolean,
    diffjmessage character varying,
    diffjlocation character varying,
    refdiffindex integer,
    adjustmentindex integer,
    indexposrefac integer,
    indexchangepath integer,
    isrefac boolean
);


ALTER TABLE public.bicszzse2 OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 538857)
-- Name: bicszzse3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bicszzse3 (
    linenumber bigint,
    path character varying,
    content character varying,
    revision character varying,
    fixrevision character varying,
    project character varying,
    szz_date timestamp without time zone,
    copypath character varying,
    copyrevision bigint,
    mergerev boolean,
    branchrev boolean,
    changeproperty boolean,
    missed boolean,
    furtherback boolean,
    contentdiff character varying,
    issample boolean,
    diffjmessage character varying,
    diffjlocation character varying,
    refdiffindex integer,
    adjustmentindex integer,
    indexposrefac integer,
    indexchangepath integer,
    isrefac boolean
);


ALTER TABLE public.bicszzse3 OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 538863)
-- Name: blame; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blame (
    id bigint NOT NULL,
    author character varying(10485760),
    date timestamp without time zone,
    line character varying(10485760),
    linenumber bigint NOT NULL,
    revision bigint NOT NULL,
    archive bigint,
    fixingcommit_id bigint,
    diffchild_id bigint,
    initialcommit_id bigint,
    commitbefore_id bigint
);


ALTER TABLE public.blame OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 538869)
-- Name: buginarelease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buginarelease (
    id bigint NOT NULL,
    bug_id character varying(255),
    comments_size integer NOT NULL,
    component character varying(255),
    description_size integer NOT NULL,
    fixer_experience integer NOT NULL,
    fixer_name character varying(255),
    month integer NOT NULL,
    month_day integer NOT NULL,
    num_cc integer NOT NULL,
    num_comments integer NOT NULL,
    num_fix_files integer NOT NULL,
    platform character varying(255),
    previous_state character varying(255),
    pri_chng boolean NOT NULL,
    priority character varying(255),
    product character varying(255),
    remod boolean NOT NULL,
    reporter_experience integer NOT NULL,
    reporter_name character varying(255),
    severity character varying(255),
    target_milestone character varying(255),
    "time" integer NOT NULL,
    time_days character varying(255),
    week_day character varying(255)
);


ALTER TABLE public.buginarelease OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 538875)
-- Name: bugintroducingcode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bugintroducingcode (
    linenumber bigint,
    path character varying,
    content character varying,
    revision bigint,
    fixrevision bigint,
    project character varying,
    szz_date timestamp without time zone,
    copypath character varying,
    copyrevision bigint,
    mergerev boolean,
    branchrev boolean,
    changeproperty boolean,
    missed boolean,
    furtherback boolean,
    contentdiff character varying,
    issample boolean,
    diffjmessage character varying,
    diffjlocation character varying,
    refdiffindex integer,
    isrefac bigint,
    issample2 boolean
);


ALTER TABLE public.bugintroducingcode OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 538881)
-- Name: bugzillaissue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bugzillaissue (
    id bigint NOT NULL,
    assigned character varying(255),
    bugid integer,
    changed timestamp without time zone,
    component character varying(255),
    product character varying(255),
    resolution character varying(255),
    status character varying(255),
    summary character varying(255)
);


ALTER TABLE public.bugzillaissue OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 538887)
-- Name: bugzillaissue_bugzillaissuecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bugzillaissue_bugzillaissuecomment (
    bugzillaissue_id bigint NOT NULL,
    listofcomment_id bigint NOT NULL
);


ALTER TABLE public.bugzillaissue_bugzillaissuecomment OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 538890)
-- Name: bugzillaissue_exception; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bugzillaissue_exception (
    bugzillaissue_id bigint NOT NULL,
    exceptions_id integer NOT NULL
);


ALTER TABLE public.bugzillaissue_exception OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 538893)
-- Name: bugzillaissue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bugzillaissue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bugzillaissue_id_seq OWNER TO postgres;

--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 219
-- Name: bugzillaissue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bugzillaissue_id_seq OWNED BY public.bugzillaissue.id;


--
-- TOC entry 220 (class 1259 OID 538895)
-- Name: bugzillaissuecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bugzillaissuecomment (
    id bigint NOT NULL,
    idcomment integer NOT NULL,
    text character varying(10485760)
);


ALTER TABLE public.bugzillaissuecomment OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 538901)
-- Name: bugzillaissuecomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bugzillaissuecomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bugzillaissuecomment_id_seq OWNER TO postgres;

--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 221
-- Name: bugzillaissuecomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bugzillaissuecomment_id_seq OWNED BY public.bugzillaissuecomment.id;


--
-- TOC entry 222 (class 1259 OID 538903)
-- Name: callerrefdiff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.callerrefdiff (
    revision character varying,
    project character varying,
    summary character varying,
    entityafter character varying,
    callermethod character varying,
    callerpath character varying,
    callerstartline bigint,
    callerendline bigint,
    refactoringtype character varying,
    simplename character varying,
    callerline bigint,
    revisiontype character varying,
    issample boolean,
    nestinglevel bigint,
    type character varying,
    tool character varying
);


ALTER TABLE public.callerrefdiff OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 538909)
-- Name: codecomplexity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.codecomplexity (
    id bigint NOT NULL,
    changecyclomaticcomplexity integer NOT NULL,
    currentcyclomaticcomplexity integer NOT NULL,
    currentrevision bigint NOT NULL,
    methodsignature character varying(10000),
    previouscyclomaticcomplexity integer NOT NULL,
    previousrevision bigint NOT NULL,
    commitarchive_id bigint
);


ALTER TABLE public.codecomplexity OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 538915)
-- Name: codecontribution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.codecontribution (
    id bigint NOT NULL,
    addedcode integer NOT NULL,
    author character varying(255),
    deletedcode integer NOT NULL,
    modifiedcode integer NOT NULL,
    revision bigint NOT NULL
);


ALTER TABLE public.codecontribution OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 538918)
-- Name: commit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commit (
    dtype character varying(31) NOT NULL,
    id bigint NOT NULL,
    author character varying(10485760),
    comment character varying(10485760),
    date timestamp without time zone,
    isfix boolean,
    revision bigint NOT NULL,
    project character varying(255)
);


ALTER TABLE public.commit OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 538924)
-- Name: commitarchive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commitarchive (
    id bigint NOT NULL,
    action character varying(255),
    revision bigint NOT NULL,
    type character varying(255),
    archive_id bigint,
    commit_id bigint
);


ALTER TABLE public.commitarchive OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 538930)
-- Name: commitindex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commitindex (
    revision bigint,
    qtdfilesadd bigint,
    qtdfilesdel bigint,
    qtdfilesmod bigint,
    qtdfilesrep bigint,
    qtdlinesadd bigint,
    qtdlinesdel bigint,
    qtdlinescon bigint,
    project character varying
);


ALTER TABLE public.commitindex OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 538936)
-- Name: complexcommit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complexcommit (
    id bigint NOT NULL,
    additions integer NOT NULL,
    classesadded integer NOT NULL,
    classesdeleted integer NOT NULL,
    classesmodified integer NOT NULL,
    methodsadded integer NOT NULL,
    methodsmodifieds integer NOT NULL,
    removals integer NOT NULL,
    revision bigint NOT NULL
);


ALTER TABLE public.complexcommit OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 538939)
-- Name: cqrequisition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cqrequisition (
    id bigint NOT NULL,
    author character varying(255),
    description character varying(255),
    header character varying(255),
    priority character varying(255),
    severity character varying(255),
    type character varying(255)
);


ALTER TABLE public.cqrequisition OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 538945)
-- Name: cqrequisition_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cqrequisition_histories (
    cqrequisition_id bigint NOT NULL,
    histories character varying(10000000)
);


ALTER TABLE public.cqrequisition_histories OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 538951)
-- Name: defects4jpatches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.defects4jpatches (
    project character varying,
    bug character varying,
    path character varying,
    linenumber bigint,
    content character varying,
    "isRemovedLine" boolean,
    updatedline bigint,
    obs character varying
);


ALTER TABLE public.defects4jpatches OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 538957)
-- Name: diff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diff (
    id bigint NOT NULL,
    beforerevision bigint NOT NULL,
    fixingrevision bigint NOT NULL,
    startrevision bigint NOT NULL,
    commitarchive bigint
);


ALTER TABLE public.diff OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 538960)
-- Name: diffchild; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffchild (
    id bigint NOT NULL,
    header character varying(10485760),
    linejustafter character varying(10485760),
    linejustbefore character varying(10485760),
    diff_id bigint
);


ALTER TABLE public.diffchild OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 538966)
-- Name: diffchild_additions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffchild_additions (
    diffchild_id bigint NOT NULL,
    additions character varying(10485760)
);


ALTER TABLE public.diffchild_additions OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 538972)
-- Name: diffchild_blames; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffchild_blames (
    diffchild_id bigint NOT NULL,
    blame_id bigint NOT NULL
);


ALTER TABLE public.diffchild_blames OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 538975)
-- Name: diffchild_removals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffchild_removals (
    diffchild_id bigint NOT NULL,
    removals character varying(10485760)
);


ALTER TABLE public.diffchild_removals OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 538981)
-- Name: diffline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffline (
    revision bigint,
    fixrevision bigint,
    numberline bigint,
    content character varying,
    project character varying,
    path character varying,
    refdiffindex bigint,
    isrefac bigint
);


ALTER TABLE public.diffline OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 538987)
-- Name: exception; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exception (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.exception OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 538990)
-- Name: exception_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exception_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exception_id_seq OWNER TO postgres;

--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 239
-- Name: exception_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exception_id_seq OWNED BY public.exception.id;


--
-- TOC entry 240 (class 1259 OID 538992)
-- Name: exceptionalissue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exceptionalissue (
    id bigint NOT NULL,
    allcomments character varying(2000000),
    body character varying(2000000),
    clean_traces_body_str character varying(2000000),
    clean_traces_comments_str character varying(2000000),
    exceptions_array character varying(300000),
    has_stacktrace boolean NOT NULL,
    has_stacktrace_body boolean NOT NULL,
    has_stacktrace_comment boolean NOT NULL,
    original_id bigint,
    repo character varying(100),
    title character varying(300),
    traces_body_str character varying(2000000),
    traces_comments_str character varying(2000000)
);


ALTER TABLE public.exceptionalissue OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 538998)
-- Name: exceptionalissue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exceptionalissue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exceptionalissue_id_seq OWNER TO postgres;

--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 241
-- Name: exceptionalissue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exceptionalissue_id_seq OWNED BY public.exceptionalissue.id;


--
-- TOC entry 242 (class 1259 OID 539000)
-- Name: exceptionalissue_minedexception; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exceptionalissue_minedexception (
    exceptionalissue_id bigint NOT NULL,
    mined_exceptions_id integer NOT NULL
);


ALTER TABLE public.exceptionalissue_minedexception OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 539003)
-- Name: exceptionalissue_minedstacktrace; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exceptionalissue_minedstacktrace (
    exceptionalissue_id bigint NOT NULL,
    stack_traces_id bigint NOT NULL
);


ALTER TABLE public.exceptionalissue_minedstacktrace OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 539006)
-- Name: exceptionalissuereport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exceptionalissuereport (
    id bigint NOT NULL,
    exc_issues_ids character varying(3000),
    exceptions_list character varying(400000),
    num_all_issues integer,
    num_exc_issues integer,
    num_stack_issues integer,
    repo character varying(400),
    stack_traces_str character varying(5000000),
    stacks_issues_ids character varying(3000)
);


ALTER TABLE public.exceptionalissuereport OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 539012)
-- Name: exceptionalissuereport_exceptionalissue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exceptionalissuereport_exceptionalissue (
    exceptionalissuereport_id bigint NOT NULL,
    exc_issues_id bigint NOT NULL
);


ALTER TABLE public.exceptionalissuereport_exceptionalissue OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 539015)
-- Name: exceptionalissuereport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exceptionalissuereport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exceptionalissuereport_id_seq OWNER TO postgres;

--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 246
-- Name: exceptionalissuereport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exceptionalissuereport_id_seq OWNED BY public.exceptionalissuereport.id;


--
-- TOC entry 247 (class 1259 OID 539017)
-- Name: exceptionalissuereport_minedexception; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exceptionalissuereport_minedexception (
    exceptionalissuereport_id bigint NOT NULL,
    mined_exceptions_id integer NOT NULL
);


ALTER TABLE public.exceptionalissuereport_minedexception OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 539020)
-- Name: fixingcommit_buggycommit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fixingcommit_buggycommit (
    fixingcommit_id bigint NOT NULL,
    buggycommit_id bigint NOT NULL
);


ALTER TABLE public.fixingcommit_buggycommit OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 539023)
-- Name: ghtorrentissue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ghtorrentissue (
    id bigint NOT NULL,
    body character varying(585760),
    comment_url character varying(255),
    html_url character varying(255),
    id_mongo integer,
    lables character varying(300),
    num_comments integer,
    num_recovered_comments integer,
    number integer,
    repo character varying(100),
    title character varying(300),
    url character varying(255)
);


ALTER TABLE public.ghtorrentissue OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 539029)
-- Name: ghtorrentissue_exception; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ghtorrentissue_exception (
    ghtorrentissue_id bigint NOT NULL,
    exceptions_id integer NOT NULL
);


ALTER TABLE public.ghtorrentissue_exception OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 539032)
-- Name: ghtorrentissue_ghtorrentissuecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ghtorrentissue_ghtorrentissuecomment (
    ghtorrentissue_id bigint NOT NULL,
    comments_id bigint NOT NULL
);


ALTER TABLE public.ghtorrentissue_ghtorrentissuecomment OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 539035)
-- Name: ghtorrentissue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ghtorrentissue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ghtorrentissue_id_seq OWNER TO postgres;

--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 252
-- Name: ghtorrentissue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ghtorrentissue_id_seq OWNED BY public.ghtorrentissue.id;


--
-- TOC entry 253 (class 1259 OID 539037)
-- Name: ghtorrentissuecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ghtorrentissuecomment (
    id bigint NOT NULL,
    body character varying(10485760),
    id_mongo integer,
    issue_id integer,
    repo character varying(100),
    url character varying(500)
);


ALTER TABLE public.ghtorrentissuecomment OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 539043)
-- Name: ghtorrentissuecomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ghtorrentissuecomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ghtorrentissuecomment_id_seq OWNER TO postgres;

--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 254
-- Name: ghtorrentissuecomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ghtorrentissuecomment_id_seq OWNED BY public.ghtorrentissuecomment.id;


--
-- TOC entry 255 (class 1259 OID 539045)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 539047)
-- Name: issueactivity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issueactivity (
    id bigint NOT NULL,
    author character varying(10485760),
    authorname character varying(255),
    date timestamp without time zone,
    issue_id numeric(19,2),
    newvalue character varying(10485760),
    oldvalue character varying(10485760),
    what character varying(10485760)
);


ALTER TABLE public.issueactivity OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 539053)
-- Name: issuecontents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issuecontents (
    id bigint NOT NULL,
    assigned_to character varying(10485760),
    bugcommentslinked boolean NOT NULL,
    bug_id character varying(10485760),
    bug_severity character varying(10485760),
    bug_status character varying(10485760),
    commitmessagelinked boolean NOT NULL,
    component character varying(255),
    creationdate timestamp without time zone,
    description character varying(10485760),
    insideprediction boolean NOT NULL,
    issue_type character varying(10485760),
    lastupdatedate timestamp without time zone,
    op_sys character varying(10485760),
    priority character varying(10485760),
    product character varying(255),
    release character varying(10485760),
    releasedate timestamp without time zone,
    releasedelay integer,
    releasedelayfromfix integer,
    reporter character varying(255),
    reporteralias character varying(255),
    resolution character varying(10485760),
    short_desc character varying(10485760),
    target_milestone character varying(255),
    whiteboard character varying(10485760),
    fixdate timestamp without time zone,
    resolver character varying(255)
);


ALTER TABLE public.issuecontents OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 539059)
-- Name: issuecontents_affectedversions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issuecontents_affectedversions (
    issuecontents_id bigint NOT NULL,
    affectedversions character varying(10485760) NOT NULL
);


ALTER TABLE public.issuecontents_affectedversions OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 539065)
-- Name: issuecontents_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issuecontents_comments (
    issuecontents_id bigint NOT NULL,
    comments character varying(10485760)
);


ALTER TABLE public.issuecontents_comments OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 539071)
-- Name: issuecontents_mercurialcommit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issuecontents_mercurialcommit (
    issuecontents_id bigint NOT NULL,
    mercurialcommits_id bigint NOT NULL
);


ALTER TABLE public.issuecontents_mercurialcommit OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 539074)
-- Name: issuecontents_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issuecontents_revisions (
    issuecontents_id bigint NOT NULL,
    revisions bigint
);


ALTER TABLE public.issuecontents_revisions OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 539077)
-- Name: jiraissue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jiraissue (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    description character varying(485760),
    issuetype character varying(50),
    key character varying(255),
    priority character varying(15),
    projectid character varying(50),
    projectname character varying(255),
    resolution character varying(100),
    status character varying(40),
    summary character varying(255)
);


ALTER TABLE public.jiraissue OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 539083)
-- Name: jiraissue_exception; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jiraissue_exception (
    jiraissue_id bigint NOT NULL,
    exceptions_id integer NOT NULL
);


ALTER TABLE public.jiraissue_exception OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 539086)
-- Name: jiraissue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jiraissue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jiraissue_id_seq OWNER TO postgres;

--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 264
-- Name: jiraissue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jiraissue_id_seq OWNED BY public.jiraissue.id;


--
-- TOC entry 265 (class 1259 OID 539088)
-- Name: jiraissue_jiraissuecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jiraissue_jiraissuecomment (
    jiraissue_id bigint NOT NULL,
    listofcomment_id bigint NOT NULL
);


ALTER TABLE public.jiraissue_jiraissuecomment OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 539091)
-- Name: jiraissuecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jiraissuecomment (
    id bigint NOT NULL,
    commentdate timestamp without time zone,
    text character varying(10485760)
);


ALTER TABLE public.jiraissuecomment OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 539097)
-- Name: jiraissuecomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jiraissuecomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jiraissuecomment_id_seq OWNER TO postgres;

--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 267
-- Name: jiraissuecomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jiraissuecomment_id_seq OWNED BY public.jiraissuecomment.id;


--
-- TOC entry 268 (class 1259 OID 539099)
-- Name: l_szz; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.l_szz AS
 SELECT bicraszz.linenumber,
    bicraszz.path,
    bicraszz.content,
    bicraszz.project,
    bicraszz.szz_date,
    bicraszz.copypath,
    bicraszz.copyrevision,
    bicraszz.mergerev,
    bicraszz.branchrev,
    bicraszz.changeproperty,
    bicraszz.missed,
    bicraszz.furtherback,
    bicraszz.contentdiff,
    bicraszz.issample,
    bicraszz.diffjmessage,
    bicraszz.diffjlocation,
    bicraszz.refdiffindex,
    bicraszz.adjustmentindex,
    bicraszz.indexposrefac,
    bicraszz.indexfurtherback,
    bicraszz.indexchangepath,
    bicraszz.isrefac,
    bicraszz.revision,
    bicraszz.fixrevision,
    bicraszz.islargest,
    bicraszz.islatest
   FROM public.bicraszz
  WHERE (bicraszz.islargest = true);


ALTER TABLE public.l_szz OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 539104)
-- Name: linkedissuegit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.linkedissuegit (
    project character varying,
    bug_id character varying,
    buggy_revision character varying,
    fixed_revision character varying,
    fixed_revision_2 character varying,
    bic_revision character varying,
    obs1 character varying,
    obs2 character varying
);


ALTER TABLE public.linkedissuegit OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 539110)
-- Name: linkedissuessvn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.linkedissuessvn (
    svn_entry_id integer DEFAULT 0 NOT NULL,
    issuecode character varying,
    revisionnumber character varying,
    author character varying,
    commitdate character varying,
    commitmessage character varying,
    issueid integer DEFAULT 0 NOT NULL,
    projectname character varying,
    issueurl character varying,
    issuetype character varying,
    issuepriority character varying,
    status character varying(255) DEFAULT NULL::character varying,
    resolution character varying(255) DEFAULT NULL::character varying,
    assignee character varying(255) DEFAULT NULL::character varying,
    reporter character varying(255) DEFAULT NULL::character varying,
    title character varying,
    summary character varying,
    description character varying,
    environment character varying,
    labels character varying,
    createddate character varying(255) DEFAULT NULL::character varying,
    updateddate character varying(255) DEFAULT NULL::character varying,
    resolveddate character varying(255) DEFAULT NULL::character varying,
    datasetversion character varying(255) DEFAULT NULL::character varying,
    fixversion character varying(255) DEFAULT NULL::character varying,
    due character varying(255) DEFAULT NULL::character varying,
    votes character varying(255) DEFAULT NULL::character varying,
    watches character varying(255) DEFAULT NULL::character varying,
    keyid character varying(300) DEFAULT NULL::character varying,
    keyvalue character varying(300) DEFAULT NULL::character varying,
    timeoriginalestimate character varying(500) DEFAULT NULL::character varying,
    timeestimate character varying(500) DEFAULT NULL::character varying,
    component character varying,
    buildinfoversion character varying(100) DEFAULT NULL::character varying,
    buildnumber character varying(150) DEFAULT NULL::character varying,
    builddate character varying(150) DEFAULT NULL::character varying,
    issample boolean
);


ALTER TABLE public.linkedissuessvn OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 539137)
-- Name: mercurialcommit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mercurialcommit (
    id bigint NOT NULL,
    additions integer NOT NULL,
    branch character varying(10485760),
    changeset character varying(10485760),
    changesetnumber character varying(10485760),
    date timestamp without time zone,
    deletions integer NOT NULL,
    isfix boolean NOT NULL,
    revision character varying(10485760),
    summary character varying(10485760),
    author character varying(10485760)
);


ALTER TABLE public.mercurialcommit OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 539143)
-- Name: mercurialcommit_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mercurialcommit_files (
    mercurialcommit_id bigint NOT NULL,
    files character varying(10485760)
);


ALTER TABLE public.mercurialcommit_files OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 539149)
-- Name: minedexception; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.minedexception (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.minedexception OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 539152)
-- Name: minedexception_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.minedexception_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.minedexception_id_seq OWNER TO postgres;

--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 274
-- Name: minedexception_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.minedexception_id_seq OWNED BY public.minedexception.id;


--
-- TOC entry 275 (class 1259 OID 539154)
-- Name: minedstacktrace; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.minedstacktrace (
    id bigint NOT NULL,
    clean_trace character varying(30000),
    issue_id bigint,
    repo character varying(100),
    root_cause character varying(3000),
    trace character varying(30000)
);


ALTER TABLE public.minedstacktrace OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 539160)
-- Name: minedstacktrace_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.minedstacktrace_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.minedstacktrace_id_seq OWNER TO postgres;

--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 276
-- Name: minedstacktrace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.minedstacktrace_id_seq OWNED BY public.minedstacktrace.id;


--
-- TOC entry 277 (class 1259 OID 539162)
-- Name: path; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.path (
    id bigint NOT NULL,
    revision bigint NOT NULL
);


ALTER TABLE public.path OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 539165)
-- Name: r_szz; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.r_szz AS
 SELECT bicraszz.linenumber,
    bicraszz.path,
    bicraszz.content,
    bicraszz.project,
    bicraszz.szz_date,
    bicraszz.copypath,
    bicraszz.copyrevision,
    bicraszz.mergerev,
    bicraszz.branchrev,
    bicraszz.changeproperty,
    bicraszz.missed,
    bicraszz.furtherback,
    bicraszz.contentdiff,
    bicraszz.issample,
    bicraszz.diffjmessage,
    bicraszz.diffjlocation,
    bicraszz.refdiffindex,
    bicraszz.adjustmentindex,
    bicraszz.indexposrefac,
    bicraszz.indexfurtherback,
    bicraszz.indexchangepath,
    bicraszz.isrefac,
    bicraszz.revision,
    bicraszz.fixrevision,
    bicraszz.islargest,
    bicraszz.islatest
   FROM public.bicraszz
  WHERE (bicraszz.islatest = true);


ALTER TABLE public.r_szz OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 539170)
-- Name: refdiffresult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refdiffresult (
    revision character varying,
    project character varying,
    summary character varying,
    refactoringtype character varying,
    entitybefore character varying,
    entityafter character varying,
    elementtype character varying,
    callers bigint,
    afterstartline bigint,
    afterendline bigint,
    afterpathfile character varying,
    beforestartline bigint,
    beforeendline bigint,
    beforepathfile character varying,
    aftersimplename character varying,
    aftercontent text,
    afterstartscope bigint,
    revisiontype character varying,
    issample boolean,
    afternestinglevel bigint,
    beforestartscope bigint,
    beforesimplename character varying,
    beforecontent text,
    beforenestinglevel bigint,
    tool character varying
);


ALTER TABLE public.refdiffresult OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 539176)
-- Name: release; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.release (
    id bigint NOT NULL,
    previous character varying(255),
    project character varying(255),
    rapid boolean NOT NULL,
    releasedate timestamp without time zone,
    version character varying(255)
);


ALTER TABLE public.release OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 539182)
-- Name: release_issuecontents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.release_issuecontents (
    release_id bigint NOT NULL,
    prenoticedeventuallyfixedbugs_id bigint NOT NULL,
    prenoticedbugs_id bigint NOT NULL,
    postreleasebugs_id bigint NOT NULL,
    eventuallyfixedbugs_id bigint NOT NULL
);


ALTER TABLE public.release_issuecontents OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 539185)
-- Name: revision_count; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.revision_count AS
 SELECT bic.revision,
    bic.fixrevision,
    lsvn.issuecode,
    count(DISTINCT bic.content) AS size
   FROM (public.bicraszz bic
     JOIN public.linkedissuessvn lsvn ON (((bic.fixrevision)::bigint = (lsvn.revisionnumber)::bigint)))
  GROUP BY bic.revision, bic.fixrevision, lsvn.issuecode;


ALTER TABLE public.revision_count OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 539190)
-- Name: szz_project_lastrevisionprocessed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.szz_project_lastrevisionprocessed (
    project character varying,
    lastrevisionprocessed character varying
);


ALTER TABLE public.szz_project_lastrevisionprocessed OWNER TO postgres;

--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN szz_project_lastrevisionprocessed.project; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.szz_project_lastrevisionprocessed.project IS 'project from apache';


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN szz_project_lastrevisionprocessed.lastrevisionprocessed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.szz_project_lastrevisionprocessed.lastrevisionprocessed IS 'last revision that was processed by the project';


--
-- TOC entry 284 (class 1259 OID 539196)
-- Name: szz_refac_revisionprocessed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.szz_refac_revisionprocessed (
    revision character varying,
    project character varying,
    tool character varying
);


ALTER TABLE public.szz_refac_revisionprocessed OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 539202)
-- Name: wordoccurrence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wordoccurrence (
    id bigint NOT NULL,
    bug_id character varying(255),
    clazz character varying(255),
    occurrences integer,
    word character varying(10485760)
);


ALTER TABLE public.wordoccurrence OWNER TO postgres;

--
-- TOC entry 3053 (class 2604 OID 539208)
-- Name: bugzillaissue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bugzillaissue ALTER COLUMN id SET DEFAULT nextval('public.bugzillaissue_id_seq'::regclass);


--
-- TOC entry 3054 (class 2604 OID 539209)
-- Name: bugzillaissuecomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bugzillaissuecomment ALTER COLUMN id SET DEFAULT nextval('public.bugzillaissuecomment_id_seq'::regclass);


--
-- TOC entry 3055 (class 2604 OID 539210)
-- Name: exception id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exception ALTER COLUMN id SET DEFAULT nextval('public.exception_id_seq'::regclass);


--
-- TOC entry 3056 (class 2604 OID 539211)
-- Name: exceptionalissue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exceptionalissue ALTER COLUMN id SET DEFAULT nextval('public.exceptionalissue_id_seq'::regclass);


--
-- TOC entry 3057 (class 2604 OID 539212)
-- Name: exceptionalissuereport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exceptionalissuereport ALTER COLUMN id SET DEFAULT nextval('public.exceptionalissuereport_id_seq'::regclass);


--
-- TOC entry 3058 (class 2604 OID 539213)
-- Name: ghtorrentissue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ghtorrentissue ALTER COLUMN id SET DEFAULT nextval('public.ghtorrentissue_id_seq'::regclass);


--
-- TOC entry 3059 (class 2604 OID 539214)
-- Name: ghtorrentissuecomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ghtorrentissuecomment ALTER COLUMN id SET DEFAULT nextval('public.ghtorrentissuecomment_id_seq'::regclass);


--
-- TOC entry 3060 (class 2604 OID 539215)
-- Name: jiraissue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jiraissue ALTER COLUMN id SET DEFAULT nextval('public.jiraissue_id_seq'::regclass);


--
-- TOC entry 3061 (class 2604 OID 539216)
-- Name: jiraissuecomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jiraissuecomment ALTER COLUMN id SET DEFAULT nextval('public.jiraissuecomment_id_seq'::regclass);


--
-- TOC entry 3083 (class 2604 OID 539217)
-- Name: minedexception id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minedexception ALTER COLUMN id SET DEFAULT nextval('public.minedexception_id_seq'::regclass);


--
-- TOC entry 3084 (class 2604 OID 539218)
-- Name: minedstacktrace id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minedstacktrace ALTER COLUMN id SET DEFAULT nextval('public.minedstacktrace_id_seq'::regclass);


-- Completed on 2020-04-08 14:11:22

--
-- PostgreSQL database dump complete
--

