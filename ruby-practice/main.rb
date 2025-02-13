age = 18
age += 3

# input = gets.chomp
# input += "!" 
# puts input

room_tidy = true
if room_tidy == true
  puts "I can play video games"
end

puts "2 is greater than 1" if 2 > 1

x = 2

if x > 2
  puts "x is greater"
elsif x < 2
  puts "x is less"
else 
  puts "x is equal"
end

puts 5 == 5
puts 2 != 5
puts 5.eql?(5)
puts 5.eql?(5.0)
puts 11 <=> 10

grade = 'B'

did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
  when 'A' then "Hell yeah!"
  when 'D' then "Don't tell your mother."
  else "'YOU SHALL NOT PASS!' -Gandalf"
end

puts did_i_pass

unless 3 > 5
  puts "3 is less than 5"
end

age = 19
response = age < 18 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."
