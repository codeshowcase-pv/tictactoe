# frozen_string_literal: true

class InvalidInput < StandardError
  attr_reader :input

  def initialize(input)
    @input = input
    super(message)
  end

  def message
    "Некоррекнтый ввод. Вы ввели #{input}. Допустимы только координаты клеток"
  end
end
