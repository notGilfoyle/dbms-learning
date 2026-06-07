--
-- PostgreSQL database dump
--

\restrict 3c1gNJqBckfpaEhEPXHuU9crgISnrvPbzPgMhQhM9BM7af2mekjUzUxf1hzICl6

-- Dumped from database version 17.10 (Homebrew)
-- Dumped by pg_dump version 17.10 (Homebrew)

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
-- Name: order_items; Type: TABLE; Schema: public; Owner: roshan
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    CONSTRAINT order_items_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.order_items OWNER TO roshan;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: roshan
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO roshan;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: roshan
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: roshan
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    total numeric(10,2) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.orders OWNER TO roshan;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: roshan
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO roshan;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: roshan
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: roshan
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    price numeric(10,2) NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT price_non_negative CHECK ((price >= (0)::numeric)),
    CONSTRAINT stock_non_negative CHECK ((stock >= 0))
);


ALTER TABLE public.products OWNER TO roshan;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: roshan
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO roshan;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: roshan
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: roshan
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO roshan;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: roshan
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO roshan;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: roshan
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: roshan
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: roshan
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: roshan
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: roshan
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: roshan
--

COPY public.order_items (id, order_id, product_id, quantity, unit_price) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: roshan
--

COPY public.orders (id, user_id, total, created_at) FROM stdin;
1	1	1098.00	2026-06-07 17:42:03.843192
2	1	4999.00	2026-06-07 17:42:03.843192
3	2	299.00	2026-06-07 17:42:03.843192
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: roshan
--

COPY public.products (id, name, price, stock, is_active, created_at) FROM stdin;
1	Wireless Mouse	799.00	50	t	2026-06-07 14:39:55.335066
2	USB-C Cable	299.00	200	t	2026-06-07 14:39:55.336621
4	Wireless Headphone	2999.00	0	t	2026-06-07 14:43:43.410669
3	Mechanical Keyboard	4999.00	14	t	2026-06-07 14:39:55.336621
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: roshan
--

COPY public.users (id, name, email, created_at) FROM stdin;
1	Roshan	roshan@example.com	2026-06-07 17:41:54.071633
2	Priya	priya@example.com	2026-06-07 17:41:54.071633
3	Amit	amit@example.com	2026-06-07 17:51:54.180228
\.


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: roshan
--

SELECT pg_catalog.setval('public.order_items_id_seq', 2, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: roshan
--

SELECT pg_catalog.setval('public.orders_id_seq', 5, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: roshan
--

SELECT pg_catalog.setval('public.products_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: roshan
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: roshan
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: roshan
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: roshan
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: roshan
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: roshan
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: roshan
--

CREATE INDEX idx_orders_user_id ON public.orders USING btree (user_id);


--
-- Name: idx_products_name; Type: INDEX; Schema: public; Owner: roshan
--

CREATE INDEX idx_products_name ON public.products USING btree (name);


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: roshan
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: roshan
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: roshan
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 3c1gNJqBckfpaEhEPXHuU9crgISnrvPbzPgMhQhM9BM7af2mekjUzUxf1hzICl6

