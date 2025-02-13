i = 0
loop do
  puts "i is #{i}"
  i+=1
  break if i == 10
end

while i < 20 do 
  puts i
  i+=1
end

puts "DIVISION"

until i < 10 do
  puts i
  i-=1
end

puts (1..5)

for i in (0..5) 
  puts i.to_s + " the ith value"
end

5.times do
  puts "hello there!"
end

5.upto(10) { |num| print "#{num} "}
puts
10.downto(5) { |num| print "#{num} "}
puts