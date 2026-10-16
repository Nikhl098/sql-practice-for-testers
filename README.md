# SQL Practice for Testers

27 SQL questions with solutions, written from a manual tester's point of view: checking data after a test, finding bad records, and answering common interview questions.

**Note:** This is a learning repo. The data is made up (a small shop plus a bug tracker). It is not from any real company or client.

## What is inside

| File | What it has |
|---|---|
| `sql/01_schema.sql` | 5 tables: `users`, `products`, `orders`, `order_items`, `defects` |
| `sql/02_data.sql` | Small sample data, with a few bad records on purpose |
| `sql/03_queries.sql` | 27 questions and their solutions |
| `outputs/results.txt` | Each query with the result it gave when I ran it in SQLite |
| `run.sh` | Builds the database in memory and runs everything |

## How to run

You need SQLite (`sqlite3`). Then:

```
./run.sh
```

The queries are standard SQL. Date functions (`julianday`) are SQLite-specific; in MySQL use `DATEDIFF`.

## Topics covered

- **Basics:** SELECT, WHERE, ORDER BY, LIMIT, BETWEEN, LIKE, IS NULL
- **Aggregates:** COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING
- **Joins:** INNER JOIN, LEFT JOIN, joining three tables
- **Subqueries and CASE:** NOT IN, second highest value, status percentage
- **Tester checks:** duplicates, missing values, invalid emails, orphan records, negative stock, order total vs item total, business rule violations (blocked user placing an order)

## Bad data planted on purpose

| Problem | Where | Query |
|---|---|---|
| Same email twice | users 1 and 6 | Q5 |
| Missing email | user 4 | Q3 |
| Email without a dot after `@` | user 7 | Q4 |
| Order for a user that does not exist | order 107 | Q10 |
| Order total does not match its items | orders 101, 104, 106 | Q12 |
| Negative stock | Power Bank | Q7 |
| Blocked user has an order | order 108 | Q18 |

## Author

Nikhil Pratap Singh, manual QA fresher, New Delhi. Learning SQL alongside testing.
