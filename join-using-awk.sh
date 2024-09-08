#!/usr/bin/bash
echo -e "\nawk and sort:\n"
time awk -F';' '
    # Read dept.csv and store in associative array
    FNR==NR {
        dept[$1] = $0
        #print "Reading dept.csv: Key=" $1 ", Line=" $0 > "/dev/stderr"
        next
    }
    # For each line in employee.csv, join with dept.csv based on the key
    {
        key = $5
        #print "Reading employee.csv: Key=" key ", Line=" $0 > "/dev/stderr"
        if (key in dept) {
            #print "Match found: Employee Line=" $0 ", Dept Line=" dept[key] > "/dev/stderr"
            print $0";"dept[key]
        } else {
            print "No match for key: " key > "/dev/stderr"
        }
    }
' <(sed 1d dept.csv | sort -k 1 --field-separator=';') <(sed 1d employee.csv | sort -k 1 --field-separator=';')
echo -e "\nawk and sort\n"
time awk -F';' '
    # Read dept.csv and store in associative array
    FNR==NR {
        dept[$1] = $0
        #print "Reading dept.csv: Key=" $1 ", Line=" $0 > "/dev/stderr"
        next
    }
    # For each line in employee.csv, join with dept.csv based on the key
    {
        key = $5
        #print "Reading employee.csv: Key=" key ", Line=" $0 > "/dev/stderr"
        if (key in dept) {
            #print "Match found: Employee Line=" $0 ", Dept Line=" dept[key] > "/dev/stderr"
            print $0";"dept[key]
        } else {
            print "No match for key: " key > "/dev/stderr"
        }
    }
' <(sed 1d dept.csv) <(sed 1d employee.csv) | grep -e '.*;.*;.*;.*;0;0;.*'
echo -e "\nThe equivalent of the SQL request:\n"
time awk -F';' '
    # Read dept.csv and store in associative array
    FNR==NR {
        dept[$1] = $0
        #print "Reading dept.csv: Key=" $1 ", Line=" $0 > "/dev/stderr"
        next
    }
    # For each line in employee.csv, join with dept.csv based on the key
    {
        key = $5
        #print "Reading employee.csv: Key=" key ", Line=" $0 > "/dev/stderr"
        if (key in dept) {
            #print "Match found: Employee Line=" $0 ", Dept Line=" dept[key] > "/dev/stderr"
            print $0";"dept[key]
        } else {
            print "No match for key: " key > "/dev/stderr"
        }
    }
' <(sed 1d dept.csv) <(sed 1d employee.csv) \
 | grep -e '.*;.*;.*;.*;0;0;.*' \
 | cut -d';' -f2,7