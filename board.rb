# frozen_string_literal: true

class Board
  attr_reader :game_field

  EMPTY_CELL_SYMBOL = '_'

  def initialize
    @game_field = Array.new(3) { Array.new(3) { EMPTY_CELL_SYMBOL } }
  end

  def set_cell(x, y, value) # rubocop:disable Naming/MethodParameterName
    return false unless @game_field[y][x] == EMPTY_CELL_SYMBOL

    @game_field[y][x] = value
  end
end
