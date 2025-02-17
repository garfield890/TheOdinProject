friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

print friends.select { |friend| friend != 'Brian'}; puts
print friends.reject { |friend| friend == "Brian"}; puts

friends.each { |friend| puts "Hello, " + friend}
my_array = [1, 2]

my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end

friends.each_with_index { |friend, index| puts "hello " + friend + "! at index " + index.to_s}
puts friends.map { |friend | friend.upcase}

responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
puts responses.select { |person, response| response == 'yes'}

my_numbers = [5, 6, 7, 8]

puts my_numbers.reduce(1000) { |sum, number| sum + number }

puts my_numbers.include?(6)
puts my_numbers.any? {|number| number > 40}
puts my_numbers.all? {|number| number > 3}
puts my_numbers.none? {|number| number > 40}
