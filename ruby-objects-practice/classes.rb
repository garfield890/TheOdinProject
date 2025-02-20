class Person
  def shout (str)
    return str
  end
end

# inheritance provides access to the data and methods in Person as well (defines more data and methods without repeating)
class Viking < Person
  # put your methods and variables here
  @@starting_health
  def initialize(name, age , strength)
    @name = name
    @age = age
    @health = @@starting_health
    @strength = strength
  end

  def self.create_warrior(name)
    age = rand * 20 + 15   # remember, rand gives a random 0 to 1
    health = [age * 5, 120].min
    strength = [age / 2, 10].min
    Viking.new(name, health, age, strength)  # returned
  end

  def attack(enemy)
    # code to fight
  end

  def take_damage(damage)
    self.health -= damage
    self.shout("OUCH")
  end

  def shout(str)
    return "Hello" + str + super
  end

  def sleep
    @health += 1 unless health >= 99
  end

  attr_accessor :name, :age, :health, :strength
end

# use CamelCase not snake_case
oleg = Viking.new("Oleg", 19, 100, 8)
lars = Viking.new("Lars", 76, 67, 10)
oleg.attack(lars)
puts oleg.health