require_relative 'lib/people'
require_relative 'lib/player'
require_relative 'lib/referee'

# Create an instance of referee object
referee = Referee.new('Referee')
updated_rows = People.class_variable

puts 'Game Start :)'

# Get player names and values(either X or O)
puts 'Welcome to TIC_TAC_TOE'
puts 'Please enter person_1 name'
person_1_name = gets.chomp
puts "Please enter X or O for #{person_1_name}"
person_1_value = gets.chomp
puts 'Please enter person_2 name'
person_2_name = gets.chomp
puts "Please enter X or O for #{person_2_name}"
person_2_value = gets.chomp

# create an instance with user provided data:
person_1_instance = Player.new(person_1_name, person_1_value)
person_2_instance = Player.new(person_2_name, person_2_value)

# loop 9 times since there are 9 possible cells on a 3*3 board
9.times do
  # Get player 1 move
  puts "#{person_1_instance.name} please enter row (0-2)"
  p1_row = gets.chomp.to_i
  puts "#{person_1_instance.name} please enter column (0-2)"
  p1_column = gets.chomp.to_i

  # Update table and rows array/play with player 1 move
  person_1_instance.play(p1_row, p1_column)
  updated_rows = People.class_variable
  decision = referee.check_winner(updated_rows)

  break if decision != 'continue playing. no winner!'

  # Get player 2 move
  puts "#{person_2_instance.name} please enter row (0-2)"
  p2_row = gets.chomp.to_i
  puts "#{person_2_instance.name} please enter column (0-2)"
  p2_column = gets.chomp.to_i

  # Update table/play with player 2 move
  person_2_instance.play(p2_row, p2_column)

  decision = referee.check_winner(updated_rows)

  break if decision != 'continue playing. no winner!'
end
