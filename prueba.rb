file = File.open('alumnos.cvs', 'r')
alumnos = file.readlines.map(&:chomp).map{ |lines| lines.split(', ')}
file.close
print alumnos
