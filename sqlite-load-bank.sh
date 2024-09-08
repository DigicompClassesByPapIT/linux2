#!/usr/bin/bash
# Database name
readonly DB_NAME=bank.db
# Remove the database if it exists
rm -f $DB_NAME
# Check sqlite3 is installed
if ! [ -x "$(command -v sqlite3)" ]; then
  echo 'Error: sqlite3 is not installed.' >&2
  exit 1
fi
# Create a database named bank.db and customer_balance and due tables
sqlite3 $DB_NAME <<EOF
# Create table customer_balance for customer balance
CREATE TABLE customer_balance (
  customer_id INTEGER PRIMARY KEY,
  balance INTEGER NOT NULL
);
EOF
# Create table due for due amount to other banks
sqlite3 $DB_NAME <<EOF
CREATE TABLE due (
  customer_id INTEGER PRIMARY KEY,
  due INTEGER NOT NULL
);
EOF