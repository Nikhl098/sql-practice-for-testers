#!/bin/sh
# Builds the practice database in memory and runs all queries.
sqlite3 -header -column :memory: ".read sql/01_schema.sql" ".read sql/02_data.sql" ".read sql/03_queries.sql"
