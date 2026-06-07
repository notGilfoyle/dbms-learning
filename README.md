# ShopForge — DBMS Learning Project

A hands-on database learning project built around **ShopForge**, a small
e-commerce application. The goal is to practice database fundamentals across
two systems:

- **PostgreSQL** — relational modeling, constraints, indexes, and SQL.
- **MongoDB** — document modeling of the same domain (planned).

## Domain

ShopForge models a minimal online store:

| Table         | Purpose                                              |
| ------------- | --------------------------------------------------- |
| `users`       | Registered customers (unique email).                |
| `products`    | Catalog items with price, stock, and active flag.   |
| `orders`      | Orders placed by a user, with a total.              |
| `order_items` | Line items linking an order to products + quantity. |

Relationships: a user has many orders; an order has many order items; each
order item references one product. Check constraints enforce non-negative
price/stock and positive quantities.

## Contents

- [`shopforge.sql`](shopforge.sql) — PostgreSQL dump (schema + seed data)
  produced with `pg_dump` (Postgres 17).

## Restoring the Postgres dump

```bash
# Create the database
createdb shopforge

# Load the schema and seed data
psql shopforge < shopforge.sql
```

## Status

- [x] Postgres schema + seed data
- [ ] MongoDB document model
- [ ] Example queries / exercises
