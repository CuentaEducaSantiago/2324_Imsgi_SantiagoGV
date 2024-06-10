<libros>
{for $x in doc("books.xml")/bookstore
order by $x/category
return ($x/book/title, <total>{count($x/book)}</total>)}
</libros>