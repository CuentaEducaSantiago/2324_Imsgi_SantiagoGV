<libros>
  {
    for $x in doc("books.xml")/bookstore/book
    let $y := count($x/author)
    return <lib2025 autores="($y)">($x/title/text())</lib2025>
  }
</libros>