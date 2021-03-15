# frozen_string_literal: true

class Render

  def initialize(board)
    @board = board
    @symbols = {
      nil => '_',
      1   => 'X',
      2   => 'O'
    }
  end

  def clear
    puts "\e[H\e[2J"
  end

  def board
    @board.game_field.each do |row|
      render_row = ''
      row.each { |symbol_code| render_row += "#{@symbols[symbol_code]} " }
      puts render_row
    end
  end
end
