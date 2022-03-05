newContent=$(cat funmessage.txt | grep -v '^#' | while read -r line; do
	output=$(echo $line | base64 -w 0)
	echo "'$output',"
done)
newContent="var funnymessagearray = ["$newContent"'VGhlIGVuZC4='];"
echo $newContent
perl -0777 -i -pe "s/(\/\/ FUNMESSAGEARRAY START\\n).*(\\n\/\/ FUNMESSAGEARRAY END)/\$1$newContent\$2/s" index.html
