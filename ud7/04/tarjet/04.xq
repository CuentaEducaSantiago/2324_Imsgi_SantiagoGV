for $x in collection('academia')/profesor
for $y in collection('academia')/curso
where $x/dni=33856315
where $x/nombre=$y/profesor
return data($y/nombre)