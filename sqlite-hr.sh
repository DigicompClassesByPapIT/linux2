#!/usr/bin/bash
# Check sqlite3 is installed
if ! [ -x "$(command -v sqlite3)" ]; then
  echo 'Error: sqlite3 is not installed.' >&2
  exit 1
fi
# Create a database named hr.db abd employee table
sqlite3 hr.db <<EOF
CREATE TABLE employee (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  age INTEGER NOT NULL,
  salary INTEGER NOT NULL,
  dept_it INTEGER NOT NULL
);
EOF

# Insert data into the employee table from csv file employee.csv, --skip 1 to
# skip the header
sqlite3 hr.db <<EOF
.mode csv
.separator ;
.import employee.csv --skip 1 employee
EOF

# Query the employee table

# Create table dept as for department
sqlite3 hr.db <<EOF
CREATE TABLE dept (
  id INTEGER PRIMARY KEY,
  label TEXT NOT NULL
);
EOF

# Insert data into the dept table from csv file dept.csv, --skip 1 to skip
# the header
sqlite3 hr.db <<EOF
.mode csv
.separator ;
.import dept.csv --skip 1 dept
EOF

# Join the employee and dept tables based on the dept_id column
# Print the name of the employees and the department label where the department
# id is 0
sqlite3 hr.db <<EOF
.headers off
.mode column
.separator ROW "\n"
SELECT e.name, d.label
FROM employee e
JOIN dept d
ON e.dept_it = d.id
WHERE d.id = 0;
EOF
# Drop database
rm hr.db