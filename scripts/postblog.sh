source ../templates/blogpost.sh
awk '{sub(/\$title/,title);sub(/\$content/,content);sub(/\$signature/,signature);}1' title="$title" content="$content" signature="$signature" ../templates/blogpost.html > ../articles/"$title".html
awk '!x{x=sub(/\<ul>/,addition);}1' addition="ul>\n            <li>\n                <a href=\"/articles/$title.html\">$title - $date</a>\n            </li>\n" ../blog.html > ../output
mv ../output ../blog.html
echo "Blog titled $title has been created!"