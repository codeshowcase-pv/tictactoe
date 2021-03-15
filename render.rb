class Render

  def initialize(board)
    @board = board
    @board_symbols = {
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
      row.each { |symbol_code| render_row += "#{@board_symbols[symbol_code]} " }
      puts render_row
    end
  end
end
