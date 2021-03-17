# frozen_string_literal: true

class QueuePlayers
  def initialize(players)
    @active_player_index = 0
    @players             = players.shuffle
  end

  def active_player
    @players[@active_player_index]
  end

  def set_next_player_active
    next_index           = @active_player_index + 1
    @active_player_index = next_index == @players.count ? 0 : next_index
  end
end
