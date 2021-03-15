class QueuePlayers
  def initialize(players)
    @active_player_index = 0
    @players = players
  end

  def active_player
    @players[@active_player_index]
  end

  def set_next_player_active
    @active_player_index = @active_player_index + 1 > @players.count ? 0 : 1
  end
end
