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
