my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {},
  9 => "nine",
  :six => 6
}

new_hash = Hash.new

puts my_hash
puts new_hash
puts my_hash["a random word"]
# puts my_hash.fetch("twenty two")
puts my_hash.fetch("twenty two", 22)

my_hash["fall"] = "sneakers"
my_hash.delete("fall")

puts my_hash.keys
puts my_hash.values

puts my_hash.merge(new_hash)

# 'Rocket' syntax
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}
# 'Symbols' syntax
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}

print american_cars; puts
print japanese_cars; puts