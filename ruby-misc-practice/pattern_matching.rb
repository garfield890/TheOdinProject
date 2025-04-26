grade = 'C'

result = case grade
in 'A' then puts 'Amazing effort'
in 'B' then puts 'Good work'
in 'C' then puts 'Well done'
in 'D' then puts 'Room for improvement'
else puts 'See me'
end

# login = { username: 'hornby', password: 'iliketrains' }

# login => { username: username }

case grade
in String then puts 'this is a String'
in Integer then puts 'this is an integer'
in TrueClass then puts 'this is a boolean'
end

age = 15

case age
in a
  puts a
end

case 3
in 3 => age
  puts age
end

case 0
in 0 | 1 | 2
  puts :match
end

value = true

case 0
in 0 if value
  puts :match
end