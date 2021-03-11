# frozen_string_literal: true

class TicTacToe
  attr_reader :board

  def initialize
    @board = [0] * 9
    @current_player = 1
    # rubocop:disable Style/StringHashKeys
    @displayed_characters = {
      '0' => '.',
      '1' => 'X',
      '2' => 'O'
    }
    # rubocop:enable Style/StringHashKeys
  end

  def final_cells
    [
      # горизонтали
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      # вертикали
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      # диагонали
      [0, 4, 8],
      [2, 4, 6]
    ]
  end

  def make_step(row, column, value)
    @board[(row * 3) + column] = value
  end

  # метод определяет завершена ли игра
  def final?
    # прохождение по массиву сетов с индексами ячеек
    cell_check_result = final_cells.map do |cells_set|
      # извлечение массивов со значениями контрольных ячеек с доски
      cells_values = [@board[cells_set[0]], @board[cells_set[1]], @board[cells_set[2]]]

      # возвращение массива с true\false , где true указывает на равенство всех трёх контрольных ячеек, не равных 0
      # а false на неравенство этих ячеек
      cells_values.uniq.length == 1 && cells_values.first != 0
    end

    cell_check_result.uniq.length == 2 || @board.index(0).nil?
  end

  def display_board
    (0..2).each do |row|
      row_string = ''
      (0..2).each do |column|
        row_string += @displayed_characters[board[(row * 3) + column].to_s]
      end
      puts row_string
    end
  end

  def run
    until final?
      display_board
      p "team #{@displayed_characters[@current_player.to_s]}"
      inputed_data = gets.chomp

      if validate_input inputed_data
        row = inputed_data[0].to_i
        column = inputed_data[1].to_i
        make_step(row, column, @current_player)

        @current_player = @current_player + 1 > 2 ? 1 : 2
      else
        p 'bad input, XX (11), X - row(0,1,2) , X - column(0,1,2)'
      end
    end

    display_board
    p 'Game over'
  end

  def validate_input(inputed)
    inputed.length == 2 && inputed[0].ord.between?(48, 50) && inputed[1].ord.between?(48, 50)
  end
end

game = TicTacToe.new

game.run
