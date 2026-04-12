require_relative './board'

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def choose_move(board)
    loop do
      puts "Player #{@marker}, enter 1-9:"
      input = gets.to_i - 1 # convert to zero index 0-8
      return input if input.between?(0, 8) && board.is_cell_empty?(input)

      puts 'Invalid move.'
    end
  end
end
