for $x in doc("books.xml")/bookstore/book
order by $x/title
return $x/title/text()

