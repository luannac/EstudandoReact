--
-- PostgreSQL database dump
--

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
-- Name: my_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE financeiro WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';

ALTER DATABASE financeiro OWNER TO postgres;

\connect financeiro

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

SET default_with_oids = false;

CREATE OR REPLACE FUNCTION getdate ()
RETURNS TIMESTAMPTZ AS
$_$
BEGIN

RETURN CAST(CURRENT_TIMESTAMP AS TIMESTAMPTZ);

END;
$_$ LANGUAGE plpgsql;

create Schema authentication;

create table IF NOT EXISTS authentication.user (
	ID SERIAL PRIMARY KEY,
    Email Varchar(250) UNIQUE not null,
    Name Varchar(255) not  null,
    Password Varchar(400) not null,
    ChangeDate TIMESTAMPTZ null,
    InsertDate TIMESTAMPTZ not null DEFAULT getdate(),
    Active boolean not null DEFAULT true
);

create table IF NOT EXISTS authentication.token(
    ID SERIAL PRIMARY KEY,
    User_ID int not null,
    Token Varchar(255) UNIQUE not null,
    LoginDate TIMESTAMPTZ not null DEFAULT getdate(),
    LogoutDate TIMESTAMPTZ null,
    Expiration TIMESTAMPTZ not null,
    Active boolean default true,
    CONSTRAINT fk_user FOREIGN KEY(User_ID) REFERENCES authentication.user(ID)
);

insert into authentication.user(Email,Name,Password)
values ('luann-ac@outlook.com','Luann Amaral','123456');
