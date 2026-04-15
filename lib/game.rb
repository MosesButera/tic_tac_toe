# frozen_string_literal: true

require_relative './board'
require_relative './player'
require_relative './referee'

class Game
  attr_reader :current_player

  def initialize(board: Board.new, referee: Referee.new)
    @board = board
    @p1 = Player.new('X')
    @p2 = Player.new('O')
    @current_player = @p1
    @referee = referee
  end

  def switch_player
    @current_player = @current_player == @p1 ? @p2 : @p1
  end

  def start_game
    loop do
      @board.display
      move = @current_player.choose_move(@board)
      @board.place_move(move, @current_player.marker)

      if @referee.check_winner(@board)
        @board.display
        puts "#{@current_player.marker} wins!"
        break
      elsif @referee.is_draw?(@board)
        @board.display
        puts 'Draw!'
        break
      end

      switch_player
    end
  end
end
