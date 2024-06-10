<books>
{
for $x at $y in doc('books.xml')/bookstore/book
return  <book>{$y}. {data($x/title)}</book>
}
</books>