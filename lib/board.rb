class Board
  def initialize
    @board = Array.new(9, '.')
  end

  def grid
    @board
  end

  def display
    sep = '+----------+---------+'
    @board.each_slice(3) do |row|
      puts sep
      puts "|   #{row.map { |elem| elem.to_s.ljust(2) }.join('  |  ')} |"
      puts sep
    end
  end

  def place_move(spot, marker)
    @board[spot] = marker
  end

  def is_cell_empty?(spot)
    @board[spot] == '.'
  end

  def is_full?
    @board.all? { |cell| cell != '.' }
  end
end
