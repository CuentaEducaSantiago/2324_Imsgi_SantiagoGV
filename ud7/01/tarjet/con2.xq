for $x in doc("books.xml")/bookstore/book
order by $x/title
where $x/price>30
return $x/title/text()