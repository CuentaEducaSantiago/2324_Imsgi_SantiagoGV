for $x in collection('academia')/curso
for $c in collection('academia')/aula[nombre="Aula 1"]
where $x/aula=$c/@id
return data($x/nombre)