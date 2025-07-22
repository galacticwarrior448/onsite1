pwd=$(pwd)
task="0 7 * * * ${pwd}/task.sh"
echo $task | crontab -

