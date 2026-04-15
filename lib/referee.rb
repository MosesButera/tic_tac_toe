# frozen_string_literal: true

require_relative './board'
require_relative './player'

class Referee
  WINS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # Horizontal rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # Vertical columns
    [0, 4, 8], [2, 4, 6]             # Diagonals
  ].freeze

  def check_winner(board)
    grid = board.grid
    WINS.each do |win_combo|
      if grid[win_combo[0]] == grid[win_combo[1]] && grid[win_combo[1]] == grid[win_combo[2]] && grid[win_combo[0]] != '.'
        return grid[win_combo[0]] # Return 'X' or 'O'
      end
    end
    nil
  end

  def is_draw?(board)
    board.is_full? && check_winner(board).nil?
  end
end
