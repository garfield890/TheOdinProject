require_relative "hashmap"

test = HashMap.new(0.75, 16)
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

test.set('jacket', 'green')
test.set('apple', 'green')
puts test.size
puts test.capacity
test.set('moon', 'silver')
puts "\n"
puts test.size
puts test.capacity
test.set('dog', 'blue')
test.set('grape', 'dark orange')
puts "\n"
puts test.size
puts test.capacity
puts test.get('dog')
puts test.has?('kite')
puts test.has?('warriors')
puts test.remove('kite')
puts test.size
p test.keys
p test.values
p test.entries
test.clear
