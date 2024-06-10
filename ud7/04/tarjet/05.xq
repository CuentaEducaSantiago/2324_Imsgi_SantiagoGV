for $x in collection('academia')/curso
let $a := current-date()
where xs:date(data($x/fin))>$a
return $x/nombre/text()