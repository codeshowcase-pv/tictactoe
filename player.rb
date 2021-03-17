# frozen_string_literal: true

class Player
  attr_reader :move_mark, :name

  def initialize(move_mark, name)
    @move_mark = move_mark
    @name      = name
  end
end
