
def read_alum(file_name)
file = File.open(file_name, 'r')
alumnos = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
file.close
alumnos
end

# def clean_notes(alumnos)
# alumnos.each do |alum|
#   name = alum.shift
#   alum
# end
# end
def prom_alum(alum)
  sum = 0
  str_sum = 0
  alum.each do |ele|
    unless ele.to_i == 0
      sum += ele.to_i
    else
      str_sum+=1
    end
  end
  return sum / (alum.length.to_f - str_sum)
end

def add_alumno(file_name)
  alumnos = read_alum(file_name)
  # p alumnos
  alumnos.each do |alumno|
    nombre_alumno = alumno.shift
    promedio = prom_alum(alumno)
    File.open("promedios.txt", "a") { |file|
		file.puts "#{nombre_alumno}: su promedio es #{promedio}"
    }
  end
  return nil
end

add_alumno('alumnos.cvs')
