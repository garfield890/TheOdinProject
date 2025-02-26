class Mastermind
  def initialize() 
    available_colors = ['R', 'B', 'G', 'Y', 'O', 'P', 'W']
    @sequence_array = available_colors.shuffle.first(4)  # Pick 4 unique colors
    @lives = 12
  end

  def checkGuess(arr) 
    if (arr == @sequence_array)
      puts "You win!!" + " It took you #{12-@lives+1} guesses! Good work."
      return true
    else
      @lives -= 1
      print "Feedback: "
      for i in (0..3)
        if @sequence_array[i] == arr[i]
          print "G"
        elsif @sequence_array.include?(arr[i])
          print "Y"
        else
          print "B"
        end
      end
      puts

      unless @lives == 0
        puts "You have #{@lives} lives left!"
        return false
      end
      puts "You have lost all your lives!"
      return true
    end
  end
end


puts "Welcome to the Mastermind Game! The computer has chosen a code. You must guess!"
puts
game = Mastermind.new
until game.checkGuess(gets.chomp.chars)
  puts "Please make your next guess (4 characters, no spaces):"
end
puts "Game Over!"