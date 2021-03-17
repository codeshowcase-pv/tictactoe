# frozen_string_literal: true

class Input
  attr_reader :x, :y

  def initialize
    get

    raise InvalidInput, @input unless valid?

    @x, @y = transform
  end

  def get
    @input = gets.chomp
  end

  private

  def valid?
    @input.match?(/\A[1-3] ?[1-3]\z/)
  end

  def transform
    [@input[0].to_i - 1, @input[-1].to_i - 1]
  end
end
