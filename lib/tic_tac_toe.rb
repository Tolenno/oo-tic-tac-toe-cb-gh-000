class TicTacToe
  def initialize(board)
    @board.new(9, " ")
  end

  def board=(board)
    @board = board
  end

  def board
    @board
  end
end
