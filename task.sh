#/bin/bash


filesraw=("$(ls -alTtr | awk '{print "\""$10,$6,$7,$9"\""}' | tr '\n' ' ')")
read -r -a files <<< "$filesraw"

echo ${#files[@]}
for file in "${files[@]}"; do
	echo $file
	year=$(echo $file | awk '{print $3}')
	echo $year
done



echo -e "The most common file extensions are \n $(find . -type f | sed 's/.*\///' | sed 's/.*\.//' | sort | uniq -c | sort -r | head -n 10)";
echo -e "The largest files are \n $(ls -lR | awk '{print $5,$9}' | sort -nr | head -n 5)"
echo -e "the Most Open files are $(ls -l | awk '{print $1, $9}' | awk '/rwx@/') and closed are $("ls -l | awk '{print $1, $9}' | awk '/x@/'")

