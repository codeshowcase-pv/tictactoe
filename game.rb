# frozen_string_literal: true

require './board'
require './render'
require './input'
require './player'
require './queue_players'

class Game
  def initialize
    @board = Board.new
    @render = Render.new @board

    player_a = Player.new(1, 'X')
    player_b = Player.new(2, '0')

    @queue_players = QueuePlayers.new([player_a, player_b])

    p 'Game created'
  end

  def run
    loop do
      @render.clear
      @render.board
      input = Input.new

      @active_player_value = @queue_players.active_player.value

      @board.set_cell(input.x, input.y, @active_player_value) if input.x && input.y

      @queue_players.set_next_player_active
    end
  end
end
