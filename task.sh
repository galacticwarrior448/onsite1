#!/bin/bash

readarray -t files < <(ls -lTtr | awk '{print $10,$6,$7,$9 }')

declare -A groupfiles
for file in "${files[@]}"; do
	year=$(echo $file | awk '{print $4}')
	month=$(echo $file | awk '{print $3}')
	name=$(echo $file | awk '{print $1}')
	date="${year}-${month}"
	groupfiles["$date"]+="$name "$'\n'
done;
			
for date in $(echo "${!groupfiles[@]}" | tr ' ' '\n' | sort -t- -k1,1n -k2,2M); do
	echo $date
	echo -ne "${groupfiles[$date]}"
	echo
	
done  



echo -e "The most active months are \n $(ls -lTtr | awk '{print $7, $9}' | sort | uniq -c | sort -rn | head -n 5 | awk '{print $1 " files " $2 $3}')"

echo -e "The most common file extensions are \n $(find . -type f | sed 's/.*\///' | sed 's/.*\.//' | sort | uniq -c | sort -r | head -n 10 | awk '{print $1 " files of type ."$2}')";

echo -e "The largest files are \n $(ls -lR | awk '{print $5,$9}' | sort -nr | head -n 5)"

echo -e "the Most Open files are $(ls -l | awk '{print $1, $9}' | awk '/rwx@/') and closed are $(ls -l | awk '{print $1, $9}' | awk '/------@/')"



