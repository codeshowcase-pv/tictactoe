# frozen_string_literal: true

require './library'

class Game
  def initialize
    @board  = Board.new
    @render = Render.new(@board)

    player_a = Player.new('X', 'X')
    player_b = Player.new('0', '0')

    @queue_players = QueuePlayers.new([player_a, player_b])

    puts 'Game created'
  end

  def run
    loop do
      @render.clear
      @render.print_errors
      @render.print_board
      @render.clear_errors

      begin
        input = Input.new
      rescue InvalidInput => e
        @render.errors << e.message
        next
      end

      @active_player_move_mark = @queue_players.active_player.move_mark

      unless @board.set_cell(input.x, input.y, @active_player_move_mark)
        @render.errors << 'Эта клетка уже занята'
        next
      end

      @queue_players.set_next_player_active
    end
  end
end
