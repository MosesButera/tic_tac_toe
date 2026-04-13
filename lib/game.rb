# frozen_string_literal: true

require_relative './board'
require_relative './player'
require_relative './referee'

class Game
  def initialize
    @board = Board.new
    @p1 = Player.new('X')
    @p2 = Player.new('O')
    @current_player = @p1
    @referee = Referee.new
  end
end
