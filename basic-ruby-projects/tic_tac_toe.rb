class TicTacToeBoard 
  def initialize() 
    @board = Array.new(3) { Array.new(3, "-") }
  end

  def playMove(playerNum, row, col)
    if (playerNum == 1)
      @board[row][col] = "X"
    elsif (playerNum == 2)
      @board[row][col] = "O"
    end
  end

  def checkWin() 
    if (@board[0][0] == @board[0][1] && @board[0][1] == @board[0][2] && @board[0][0] != "-")
      if (@board[0][0] == "X")
        puts "Player 1 wins! The firstrow has 3 X's."
      else
        puts "Player 2 wins! The first row has 3 O's."
      end
      return true
    elsif (@board[1][0] == @board[1][1] && @board[1][1] == @board[1][2] && @board[1][0] != "-")
      if (@board[1][0] == "X")
        puts "Player 1 wins! The second row has 3 X's."
      else
        puts "Player 2 wins! The second row has 3 O's."
      end
      return true
    elsif (@board[2][0] == @board[2][1] && @board[2][1] == @board[2][2] && @board[2][0] != "-")
      if (@board[2][0] == "X")
        puts "Player 1 wins! The third row has 3 X's."
      else
        puts "Player 2 wins! The third row has 3 O's."
      end
      return true
    elsif (@board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] && @board[0][0] != "-")
      if (@board[0][0] == "X")
        puts "Player 1 wins! The left diagonal has 3 X's."
      else
        puts "Player 2 wins! The left diagonal has 3 O's."
      end
      return true
    elsif (@board[0][2] == @board[1][1] && @board[1][1] == @board[2][0] && @board[0][2] != "-")
      if (@board[0][2] == "X")
        puts "Player 1 wins! The right diagonal has 3 X's."
      else
        puts "Player 2 wins! The right diagonal has 3 O's."
      end
      return true
    elsif (@board[0][0] == @board[1][0] && @board[1][0] == @board[2][0] && @board[0][0] != "-")
      if (@board[0][0] == "X")
        puts "Player 1 wins! The first column has 3 X's."
      else
        puts "Player 2 wins! The first column has 3 O's."
      end
      return true
    elsif (@board[0][1] == @board[1][1] && @board[1][1] == @board[2][1] && @board[0][1] != "-")
      if (@board[0][1] == "X")
        puts "Player 1 wins! The second column has 3 X's."
      else
        puts "Player 2 wins! The second column has 3 O's."
      end
      return true
    elsif (@board[0][2] == @board[1][2] && @board[1][2] == @board[2][2] && @board[0][2] != "-")
      if (@board[0][2] == "X")
        puts "Player 1 wins! The third column has 3 X's."
      else
        puts "Player 2 wins! The third column has 3 O's."
      end
      return true
    end
    if @board.all? { |row| row.all? { |cell| cell != "-" } }
      puts "It's a tie!"
      return true
    end
  end

  def printBoard()
    print @board[0]; puts
    print @board[1]; puts
    print @board[2]; puts
  end
end

puts "Welcome to TicTacToe! Player 1 begins first"; puts
board = TicTacToeBoard.new()
board.printBoard
currentPlayer = 1
until board.checkWin
  puts
  print "Player #{currentPlayer}: Enter row: "
  inputRow = gets.chomp.to_i
  print "Player #{currentPlayer}: Enter column: "
  inputCol = gets.chomp.to_i
  board.playMove(currentPlayer, inputRow-1, inputCol-1)
  board.printBoard
  currentPlayer = currentPlayer == 1 ? 2 : 1
end

puts "Thank you for playing!"