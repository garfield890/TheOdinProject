grade = 'C'

result = case grade
in 'A' then puts 'Amazing effort'
in 'B' then puts 'Good work'
in 'C' then puts 'Well done'
in 'D' then puts 'Room for improvement'
else puts 'See me'
end

login = { username: 'hornby', password: 'iliketrains' }

login => { username: username }

puts result
