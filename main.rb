class TicTacToe

  attr_reader :board

  def initialize
    @board = [0] * 9
    @current_player = 1
    @cells_sets_in_final_states = [
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

  # метод определяет завершена ли игра
  def is_final
    # прохождение по массиву сетов с индексами ячеек
    cell_check_result = @cells_sets_in_final_states.map do |cells_set|
      #извлечение массивов со значениями контрольных ячеек с доски
      cells_values = [@board[cells_set[0]], @board[cells_set[1]], @board[cells_set[2]]]

      # возвращение массива с true\false , где true указывает на равенство всех трёх контрольных ячеек, не равных 0
      # а false на неравенство этих ячеек
      cells_values.uniq.length == 1 && cells_values.first != 0
    end

    cell_check_result.uniq.length == 2 || @board.index(0).nil?
  end
end

game = TicTacToe.new
p game.board

p game.is_final
game
