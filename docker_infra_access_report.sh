#!/bin/sh
host=`hostname`
timestamp=`date "+%b-%d-%Y"`
user_id=`whoami`

report_file=docker_infra_access_report.csv
echo "$timestamp $host $user_id" | awk '{ print $1","$2","$3 }' >> $report_file

/usr/bin/git add $report_file
/usr/bin/git commit -m "Adding an entry to the file: $report_file"
/usr/bin/git push https://github.com/snangunuri/test_repo.git master
