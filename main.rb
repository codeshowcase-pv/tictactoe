class TicTacToe

  attr_reader :board

  def initialize
    @board = [0] * 9
    @current_player = 1
    @equal_cells_in_final_states = [
      # горизонтали
      [1, 1, 1, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 1, 1, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 1, 1, 1],
      # вертикали
      [1, 0, 0, 1, 0, 0, 1, 0, 0],
      [0, 1, 0, 0, 1, 0, 0, 1, 0],
      [0, 0, 1, 0, 0, 1, 0, 0, 1],
      # диагонали
      [1, 0, 0, 0, 1, 0, 0, 0, 1],
      [0, 0, 1, 0, 1, 0, 1, 0, 0],
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
