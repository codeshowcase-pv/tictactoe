class Board
  attr_reader :game_field

  def initialize
    @game_field = Array.new(3) { Array.new(3) }
  end

  def set_cell(x, y, value) # rubocop:disable Naming/MethodParameterName
    return false unless @game_field[y][x].nil?

    @game_field[y][x] = value
  end
end
