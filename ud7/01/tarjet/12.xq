(:<publicacion>
  {for $x in doc("books.xml")/bookstore/book
  return $x/year}
</publicacion>:)

<publicacion>
  {let $x := doc("books.xml")/bookstore/book
  return $x/year}
</publicacion>