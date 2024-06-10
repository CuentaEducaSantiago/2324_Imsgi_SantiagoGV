for $x in doc("books.xml")/bookstore/book
order by $x/category descending, $x/title 
where $x/price>30
return concat($x/title/text(), ': ', $x/price/text())