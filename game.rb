require './board'
require './render'
require './input'

class Game
  def initialize
    @board = Board.new
    @render = Render.new @board
    p 'Game created'
  end

  def run
    loop do
      @render.clear
      @render.board
      input = Input.new

      @board.set_cell(input.x, input.y, 1) if input.x && input.y
    end
  end
end