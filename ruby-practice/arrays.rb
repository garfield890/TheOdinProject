require 'pry-byebug'

num_array = [0, 1, 2, 3, 4, 5]
str_array = ["l", "r", "lrlrl"]
newArr = Array.new(3, 7)

puts num_array[0]
puts str_array[2]
puts newArr[1]

puts str_array.last
puts num_array.first
print str_array.last(2)
puts

print num_array.unshift(1)
puts
num_array = num_array.shift

method_array = [1, 2, 34, 120]
puts method_array.empty?
puts method_array.length
print method_array.reverse; puts
puts method_array.include?(2)
puts method_array.join("-")

method_array.clear
method_array.insert(0, 89)
puts a.sample
method_array = [1, 2, 34, 120]
method_array.shuffle
method_array.uniq