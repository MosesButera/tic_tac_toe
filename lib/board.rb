class Board
  def initialize
    @board = Array.new(9, '.')
  end
  attr_reader :board

  def display
    sep = '+----------+---------+'
    @board.each_slice(3) do |row|
      puts sep
      puts "|   #{row.map { |elem| elem.to_s.ljust(2) }.join('  |  ')} |"
      puts sep
    end
  end
end
