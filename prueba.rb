def read_alum(file_name)
  file = File.open(file_name, 'r')
  alumnos = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
  file.close
  alumnos
end

def prom_alum(alum)
  sum = 0
  alt_sum = 0
  alum.each do |ele|
    if ele.to_i.zero?
      alt_sum += 1
    else
      sum += ele.to_i
    end
  end
  sum / (alum.length.to_f - alt_sum)
end

def add_alumno(file_name)
  alumnos = read_alum(file_name)
  alumnos.each do |alumno|
    alum_name = alumno.shift
    prom = prom_alum(alumno)
    File.open('promedios.txt', 'a') { |file| file.puts" #{alum_name} : su promedio es #{prom}" }
  end
end

add_alumno('alumnos.cvs')
