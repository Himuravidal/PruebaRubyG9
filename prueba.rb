
def read_alum
file = File.open('alumnos.cvs', 'r')
alumnos = file.readlines.map(&:chomp).map{ |lines| lines.split(', ') }
file.close
alumnos
end

def clean_notes(alumnos)
alumnos.each do |alum|
  name = alum.shift
  puts name
end
end



def alum_prom(alumnos)
  alumnos.each do |sin|


sum = 0
alumnos.each do |alum|
  unless alum == 'A'
    sum += alum.to_i
  end
end
return sum / (alumnos.length.to_f)
end
end

clean_notes(read_alum)
