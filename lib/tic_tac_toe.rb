class TicTacToe
  def initialize #initializes the board array to the class
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    #across combinations
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row

    #up/down combinations
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column

    #diagonal combinations
    [0, 4, 8], #diagonal topleft/bottomright
    [2, 4, 6] #diagonal bottomleft/topright

  ]

  def display_board #displays the board layout to the user in the command line
    rows = [" #{@board[0]} | #{@board[1]} | #{@board[2]} ", "-----------", " #{@board[3]} | #{@board[4]} | #{@board[5]} ", "-----------", " #{@board[6]} | #{@board[7]} | #{@board[8]} "]
    puts rows[0]
    puts rows[1]
    puts rows[2]
    puts rows[3]
    puts rows[4]
  end

  def input_to_index(user_input) #converts string input from gets to an integer so it can be used to access array indices
    user_input.to_i - 1
  end

  def move(position, current_player) #moves player marker (X or O) to their desired position on the board
    @board[position] = current_player
  end


  def position_taken?(position) #checks if the position is taken
    @board[position] != " " && @board[position] != ""
  end


  def valid_move?(position) #checks if move is on the board or if the position is taken
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn_count #counts the number of turns that have been taken
    count = 0
      @board.each do |index|
        index == "X" || index == "O" ? count += 1 : nil
      end
      return count
    end

    #determines the current player (X or O) - because X always goes first, #turn_count will always be uneven before X's go
    def current_player(board)
      count = turn_count(board)
      if count.even?
        return "X"
      else
        return "O"
      end
    end

end
