test_scores = [
  [97, 65, 53, 90],
  [93, 78, 35, 99],
  [88, 67, 64, 78],
  [93, 48, 69, 39]
]

teacher_mailboxes = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]

puts teacher_mailboxes[0][0]
puts test_scores[2][1]
puts teacher_mailboxes[0][-1]
puts teacher_mailboxes.dig(3, 0)

test_scores << [100, 99, 98, 97]
test_scores[-1].push(100)
test_scores[-1].pop
puts test_scores

teacher_mailboxes.each_with_index do |row, row_index|
  puts "Row:#{row_index} = #{row}"
end

teacher_mailboxes.flatten.each do |teacher|
  puts "#{teacher} is amazing!"
end

vehicles = {
  alice: {year: 2019, make: "Toyota", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}

puts vehicles[:alice][:year]
puts vehicles[:blake][:make]
puts vehicles[:caleb][:model]

vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"}
vehicles[:dave][:color] = "red"
vehicles.delete(:blake)