require_relative 'people'
require_relative 'player'
# Create Referee class inheriting from People superclass
class Referee < People
  def initialize(name)
    @name = name
  end

  def check_winner(rows)
    # Win cases: There are only 8 possible win cases for either "X" marks or "O" marks.
    diag_1 = [rows[0][0], rows[1][1], rows[2][2]]
    diag_2 = [rows[0][2], rows[1][1], rows[2][0]]
    horiz_1 = [rows[0][0], rows[0][1], rows[0][2]]
    horiz_2 = [rows[1][0], rows[1][1], rows[1][2]]
    horiz_3 = [rows[2][0], rows[2][1], rows[2][2]]
    vert_1 = [rows[0][0], rows[1][0], rows[2][0]]
    vert_2 = [rows[0][1], rows[1][1], rows[2][1]]
    vert_3 = [rows[0][2], rows[1][2], rows[2][2]]

    if diag_1.uniq.length == 1 && diag_1.first != '.'
      p "#{diag_1.first} wins diagonally"
    elsif diag_2.uniq.length == 1 && diag_2.first != '.'
      p "#{diag_2.first} wins diagonally"
    elsif [horiz_1, horiz_2, horiz_3].any? { |r| r.uniq.length == 1 && r.first != '.' }
      p 'Horizontal winner'
    elsif [vert_1, vert_2, vert_3].any? { |r| r.uniq.length == 1 && r.first != '.' }
      p 'Vertical winner'
    else
      p 'Continue playing. no winner!'
    end
  end
end
