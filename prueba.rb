file = File.open('alumnos.cvs', 'r').readlines
data = []
data.each { |line| data.push(line.split(', ').map(&:chomp)) }
puts data
