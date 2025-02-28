txtFile = File.open("google-10000-english-no-swears.txt", 'r');
arrOfWords = txtFile.read

arrOfWords = arrOfWords.split("\n")
chosenWord = arrOfWords.sample

until chosenWord.length >= 5 && chosenWord.length <= 12
  chosenWord = arrOfWords.sample
end

lives = 6
guessingArr = Array.new(chosenWord.length, "_") 
shownArr = guessingArr.join(' ')
missingArr = Array.new
print shownArr; puts

while lives > 0
  puts "Please guess a letter! Only the first char you enter will be taken."
  input = gets.chomp[0].downcase
  if chosenWord.include? input
    indexes = []
    chosenWord.each_char.with_index { |char, i| indexes << i if char == input }
    indexes.each { |i| guessingArr[i] = input }
    shownArr = guessingArr.join(' ')
    print shownArr; puts
  else
    puts "That is incorrect!! #{input} is not in the chosen word! You have #{lives-1} lives left!"
    missingArr.push(input)
    puts "Your wrong guesses are [#{missingArr.join(', ')}]"
    lives -= 1
  end
  if guessingArr.join == chosenWord
    puts "You have found the chosen word! The word was #{chosenWord}. Please play again!"
    break
  end
end
puts "You have run out of lives. The word was #{chosenWord}! Please try again!" if lives == 0