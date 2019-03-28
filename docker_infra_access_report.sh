#!/bin/sh
host=`hostname`
timestamp=`date`
user_id=`whoami`

echo "$timestamp;$host;$user_id" | awk -F ";" '{ printf "%-35s %-20s %s\n", $1, $2, $3 }' >> docker_infra_access_report.txt

/usr/bin/git add docker_infra_access_report.txt
/usr/bin/git commit -m "Adding an entry to the file: docker_infra_access_report.txt"
/usr/bin/git push https://github.com/snangunuri/test_repo.git master
