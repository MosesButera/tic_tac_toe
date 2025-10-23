require_relative 'people'

class Player < People
  def initialize(name, value)
    @name = name
    @value = value
  end

  def play(row, column)
    @@rows[row][column] = @value
    p table(@@rows)
  end
  attr_reader :name, :value
end
