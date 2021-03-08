class TicTacToe

  attr_reader :board

  def initialize
    @board = [0] * 9
    @current_player = 1
    @equal_cells_in_final_states = [
      # горизонтали
      [0, 1, 2],
      [3, 4, 5],
      [6, 7 ,8],
      # вертикали
      [0, 3, 6],
      [1, 4, 7],
      [2, 5 ,8],
      # диагонали
      [0, 4, 8],
      [2, 4, 6],
    ]
  end

  def make_step(row, column, value)
    @board[(row * 3) + column] = value
  end
end

game = TicTacToe.new
p game.board
game.make_step(1,2,1)
p game.board
