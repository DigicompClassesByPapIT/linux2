awk -F';' '
    NR > 1 {
        dept_id = $5
        salary = $4
        sum[dept_id] += salary
    }
    END {
        for (dept_id in sum) {
            print "Department ID:", dept_id, "Total Salary:", sum[dept_id]
        }
    }
' employee.csv