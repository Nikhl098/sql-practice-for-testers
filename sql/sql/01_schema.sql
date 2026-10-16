-- Practice database: a small shop with users, products, orders and a bug tracker.
-- Works in SQLite (and with tiny changes in MySQL / PostgreSQL).
DROP TABLE IF EXISTS defects;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  user_id     INTEGER PRIMARY KEY,
  full_name   TEXT NOT NULL,
  email       TEXT,
  city        TEXT,
  status      TEXT NOT NULL,      -- active / blocked / inactive
  created_on  TEXT NOT NULL       -- YYYY-MM-DD
);
CREATE TABLE products (
  product_id  INTEGER PRIMARY KEY,
  name        TEXT NOT NULL,
  category    TEXT NOT NULL,
  price       REAL NOT NULL,
  stock       INTEGER NOT NULL
);
CREATE TABLE orders (
  order_id    INTEGER PRIMARY KEY,
  user_id     INTEGER,
  order_date  TEXT NOT NULL,
  status      TEXT NOT NULL,      -- placed / shipped / delivered / cancelled
  total       REAL NOT NULL
);
CREATE TABLE order_items (
  item_id     INTEGER PRIMARY KEY,
  order_id    INTEGER NOT NULL,
  product_id  INTEGER NOT NULL,
  qty         INTEGER NOT NULL,
  unit_price  REAL NOT NULL
);
CREATE TABLE defects (
  defect_id   INTEGER PRIMARY KEY,
  title       TEXT NOT NULL,
  module      TEXT NOT NULL,
  severity    TEXT NOT NULL,      -- Critical / Major / Minor
  status      TEXT NOT NULL,      -- Open / In Progress / Fixed / Closed / Rejected
  reported_on TEXT NOT NULL,
  closed_on   TEXT
);
