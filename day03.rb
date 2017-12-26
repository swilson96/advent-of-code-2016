input = File.open('input/day03.txt').read

def is_triangle_string?(line_input)
  sides = line_input.chomp.strip.split(/\W+/).map { |e| e.strip.to_i }
  puts "#{sides}" unless sides.length == 3
  is_triangle_array? sides
end


def is_triangle_array?(sides)
  max = sides.max
  sides.delete(max)

  return true if sides.length < 2 # two sides the same

  ((sides[0] + sides[1]) > max)
end


valid = 0

input.lines.each do |candidate|
  valid += 1 if is_triangle_string?(candidate)
end

puts "part 1: #{valid} possible triangles (should be 1050)"

valid = 0
lines = input.lines
num_lines = lines.length

puts "total rows: #{num_lines}"

count = 0

(0..(num_lines-1)).step(3).each do |i|
# (0..2).step(3).each do |i|
  top = lines[i].chomp.strip.split(/\W+/).map { |e| e.strip.to_i }
  middle = lines[i+1].chomp.strip.split(/\W+/).map { |e| e.strip.to_i }
  bottom = lines[i+2].chomp.strip.split(/\W+/).map { |e| e.strip.to_i }

  # puts "a triangle: #{[top[0], middle[0], bottom[0]]} possible? #{is_triangle_array?([top[0], middle[0], bottom[0]])}"

  valid += 1 if is_triangle_array?([top[0], middle[0], bottom[0]])
  valid += 1 if is_triangle_array?([top[1], middle[1], bottom[1]])
  valid += 1 if is_triangle_array?([top[2], middle[2], bottom[2]])

  count += 3
end

puts "considered #{count} possibilities"

puts "part 2: #{valid} possible triangles (should be 1921)"
