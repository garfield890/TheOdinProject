class Mastermind
  def initialize
    available_colors = %w[R B G Y O P W]
    @sequence_array = available_colors.sample(4) # Pick 4 unique colors
    @lives = 12
  end

  def check_guess(arr)
    if arr == @sequence_array
      puts "You win!! It took you #{12 - @lives + 1} guesses! Good work."
    else
      @lives -= 1
      print "Feedback: "
      (0..3).each do |i|
        if @sequence_array[i] == arr[i]
          print "G"
        elsif @sequence_array.include?(arr[i])
          print "Y"
        else
          print "B"
        end
      end
      puts

      unless @lives.zero?
        puts "You have #{@lives} lives left!"
        return false
      end
      puts "You have lost all your lives!"
    end
    true
  end
end

puts "Welcome to the Mastermind Game! The computer has chosen a code. You must guess!"
puts
game = Mastermind.new
puts "Please make your next guess (4 characters, no spaces):" until game.check_guess(gets.chomp.chars)
puts "Game Over!"
