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

def clean_alum(alumnos)
  clean_notes = 0
  alumnos.each do |alu|
    clean_notes += 1 if alu == 'A'
  end
  clean_notes
end

def inasist(file_name)
  alum = read_alum(file_name)
  alum.each do |alu|
    name = alu.shift
    no_asisstence = clean_alum(alu)
    puts " Don(a):  #{name} tuvo un total de #{no_asisstence} inasistencia"
  end
end

def approved(file_name, grade = 5)
  alum = read_alum(file_name)
  alum.each do |alu|
    name = alu.shift
    prom = prom_alum(alu)
    puts "Don(a) : #{name} aprobo con nota #{prom}" if prom > grade
  end
end

puts 'Prueba Ruby SISTEMA DE ALUMNOS'
puts 'Press Enter'
opt = gets.chomp
while opt != '4'
  puts 'Ingresa 1 para generar un archivo con los nombres y promedios de los alumnos'
  puts 'Ingresa 2 contabilizar el total de inasistencias de los alumnos'
  puts 'Ingresa 3 cambia el criterio de evaluacion y muestra los aprovados'
  puts 'Ingresa 4 para salir'
  opt = gets.chomp
  case  opt
  when '1'
    add_alumno('alumnos.cvs')
    puts 'Se genero un archivo con los promedios'
    puts '#######################################################'
  when '2'
    inasist('alumnos.cvs')
    puts '#######################################################'
  when '3'
    puts 'Ingrese nota de aprobacion'
    grade = gets.chomp.to_f
    if grade.zero?
      approved('alumnos.cvs')
    else
      approved('alumnos.cvs', grade)
    end
  when '4'
    puts 'Adios'
  else
    'Ingresa un número del 1 al 4'
  end
end
