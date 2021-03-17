# frozen_string_literal: true

class Render
  attr_reader :errors

  def initialize(board)
    @board  = board
    @errors = []
  end

  # Это полностью очистит консоль
  def clear
    puts "\e[H\e[2J"
  end

  def print_board
    @board.game_field.each { |row| puts row.join(' ') }
  end

  def print_errors
    puts errors.join('. ')
  end

  def clear_errors
    @errors = []
  end
end
