pwd=$(pwd)
task="0 7 * * * ${pwd}/task.sh >> ${pwd}/log$(date)"
echo $task | crontab -
find $pwd -name "${pwd}/log*" -mtime +7 -delete
