require "json"

txt_file = File.open("google-10000-english-no-swears.txt", "r")
arr_of_words = txt_file.read

arr_of_words = arr_of_words.split("\n")
chosen_word = arr_of_words.sample

chosen_word = arr_of_words.sample until chosen_word.length >= 5 && chosen_word.length <= 12

lives = 6
guessingArr = Array.new(chosen_word.length, "_")
shownArr = guessingArr.join(" ")
missingArr = []
print shownArr
puts

while lives.positive?
  puts "Please guess a letter! Only the first char you enter will be taken. Enter 0 to save your game and try again later. Enter 1 to reload your saved game!"
  input = gets.chomp[0].downcase
  if input == "0"
    data = { chosen_word: chosen_word, guessingarr: guessingArr, lives: lives }
    json_string = data.to_json
    File.write("saved_game.json", json_string)
    puts "Your game has been saved!!"
    break
  elsif input == "1"
    json_string = File.read("saved_game.json")
    data = JSON.parse(json_string)
    lives = data["lives"]
    chosen_word = data["chosen_word"]
    guessingArr = data["guessingarr"]
    shownArr = guessingArr.join(" ")
    puts "Your game has been reloaded!"
    print shownArr
    puts
    next
  end
  if chosen_word.include? input
    indexes = []
    chosen_word.each_char.with_index { |char, i| indexes << i if char == input }
    indexes.each { |i| guessingArr[i] = input }
    shownArr = guessingArr.join(" ")
    print shownArr
    puts
  else
    puts "That is incorrect!! #{input} is not in the chosen word! You have #{lives - 1} lives left!"
    missingArr.push(input)
    puts "Your wrong guesses are [#{missingArr.join(', ')}]"
    print shownArr
    puts
    lives -= 1
  end
  if guessingArr.join == chosen_word
    puts "You have found the chosen word! The word was #{chosen_word}. Please play again!"
    break
  end
end
puts "You have run out of lives. The word was #{chosen_word}! Please try again!" if lives.zero?
