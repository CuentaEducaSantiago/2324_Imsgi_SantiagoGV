<total>
  {for $x in doc("books.xml")/bookstore
  order by $x/category
  return count($x/book)}
</total>