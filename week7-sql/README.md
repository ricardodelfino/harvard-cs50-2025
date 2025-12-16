# 📂 **Week 7 – SQL**

This week focused on **relational databases and SQL**, introducing how to store, query, and analyze structured data efficiently. I learned how to retrieve meaningful information from large datasets by combining tables, filtering records, and applying logical reasoning to solve real-world problems.

---

## 💡 **Concepts Learned**

✓ Relational databases and table schemas  
✓ Primary keys and foreign keys  
✓ Writing SQL queries using `SELECT`, `WHERE`, `ORDER BY`, and `LIMIT`  
✓ Filtering data with logical operators (`AND`, `OR`)  
✓ Joining tables with `JOIN`  
✓ Understanding one-to-many relationships  
✓ Using subqueries to break down complex problems  
✓ Reading and interpreting database schemas  
✓ Applying SQL as an investigative and analytical tool  

---

## 🛠️ **Techniques Practiced**

✓ Exploring databases using `.schema` and `.tables`  
✓ Incrementally narrowing results to identify relevant records  
✓ Cross-referencing data across multiple tables  
✓ Using SQL queries as a step-by-step reasoning process  
✓ Debugging queries by validating table structure and columns  
✓ Documenting investigation steps and assumptions in SQL comments  

---

## 📂 **Files / Problem Sets**

### 🔐 Problem Sets

#### 🕵️ **Fiftyville** (`fiftyville/`)
A full investigative challenge where SQL queries were used to solve a fictional crime by analyzing logs, interviews, phone calls, bank records, and flight data.

✓ Identified the time and location of the crime  
✓ Analyzed witness interviews for clues  
✓ Cross-referenced vehicle logs, ATM transactions, and phone calls  
✓ Determined the thief, accomplice, and escape city using flight records  

Key files:
- `fiftyville.db` – SQLite database used for the investigation  
- `log.sql` – Step-by-step investigation queries with reasoning comments  
- `answers.txt` – Final conclusions based on evidence  

---

#### 🎬 **Movies** (`movies/`)
SQL queries to analyze a movie database, focusing on actors, directors, ratings, and release years.

✓ Querying movies by year and rating  
✓ Joining tables to connect movies, actors, and directors  
✓ Filtering and sorting results for meaningful insights  

---

#### 🎵 **Songs** (`songs/`)
Practice with a music database to retrieve information about songs, artists, and energy levels.

✓ Selecting specific columns from large datasets  
✓ Filtering by numeric values (e.g., energy, tempo)  
✓ Ordering and limiting results to find top entries  

---

## 🛠️ **Execution Examples**

Open a database with SQLite:

```bash
sqlite3 database_name.db
```

List tables and inspect schema:

```sql
.tables
.schema table_name
```

Run a SQL file:

```bash
sqlite3 database_name.db < log.sql
```

---

## 📝 **Notes**

✓ SQL queries are declarative: you describe *what* you want, not *how* to compute it.  
✓ Understanding the database schema is essential before writing queries.  
✓ Not all tables store time data explicitly; sometimes context must be inferred.  
✓ Breaking complex questions into smaller queries makes debugging easier.  
✓ Clear comments in SQL files help document reasoning and improve readability.  

---

## ✅ **Summary**

This week highlighted how **data-driven reasoning** works in practice. SQL proved to be a powerful tool for analyzing structured information, showing that complex conclusions can be reached by combining simple, well-thought-out queries. The Fiftyville problem set, in particular, reinforced the importance of logic, patience, and methodical investigation.

---

## 🔗 **Resources**

[CS50 Week 7 Lecture](https://cs50.harvard.edu/x/weeks/7/)  
[CS50 Problem Set 7](https://cs50.harvard.edu/x/psets/7/)

