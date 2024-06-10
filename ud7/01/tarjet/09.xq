for $x in doc("books.xml")/bookstore/book
order by $x/title
where count($x/author)>=2
return $x/title/text()