#!/usr/bin/env ruby
require 'io/console'
require '../lib/board.rb'
puts 'Hello Player!'
puts 'Instuctions:'
puts '1)Player 1 and Player 2 need to enter their nicknames'
puts '2) Player 1 & 2 need to select their marks (X or O)'
puts '3) Players will need to select their positions to input their marks'
puts "For example X on position 1 is:\n      [X] [ ] [ ]\n      [ ] [ ] [ ]\n      [ ] [ ] [ ]"
puts '4) In order to win, you need to connect 3 of your marks in a line'
puts "For example, three different win conditions are:\n      [X] [X] [X]\n      [X] [X] [ ]\n      [X] [ ] [X]"
puts 'PRESS ENTER TO CONTINUE'
$stdin.noecho(&:gets).chomp


d_matrix = Board.new

# Inputs the players names
puts 'Player 1, enter your Nickname:'
nick1 = gets.chomp
player_one = nick1
puts "Welcome: #{player_one}"

puts 'Player 2, enter your Nickname:'
nick2 = gets.chomp
player_two = nick2
puts "Welcome: #{player_two}"

# Inputs the players Marks, selects the mark for player one and gisves player two the one thats left

  marker = []
  until %w[X O].include?(marker)
    puts 'Player one, do you want to be X or O?'
    marker = gets.chomp.upcase
    case marker
    when 'X'

      puts "Player 1 mark is #{marker}"
    when 'O'

      puts "Player 1 mark is #{marker}"
    else
      puts 'Player one, do you want to be X or O?'
      marker = gets.chomp.upcase
    end
  end

  player_mark2 = if marker == 'X'
                   'O'
                 else
                   'X'
                 end
  puts "Player 2 mark is #{player_mark2}"

# def place_marker(board, marker, position)
#   board[position] = marker
# end

# def choose_first
#   (return 'Player 2 go first' if rand(0..1).zero?)
# end

# def valid_position
#   loop do
#     break if (1..9).include?(position) && !board[position - 1].is_a?(String)

#     puts 'Please enter a valid number from 1 to 9 to be replaced by your symbol' unless (1..9).include?(position)
#     position.gets.chomp.to_i
#   end
#   position
# end
 
# def space_check(board, position)
#   board[position] == ''
# end

# def player_choice(board)
#   position = 0
#   until position (1..9) || position != space_check(board, position)
#     puts 'Choose your next position:(1-9)'
#     position = gets.chomp.to_i
#   end
#   position
# end

# def replay
#   puts 'Do you want to play again? Enter Yes or No: '.gets.chomp
# end

# Begins the game

puts '                  ARE YOU READY?!!!'
puts '             PRESS ENTER TO BEGIN THE GAME'
$stdin.noecho(&:gets).chomp


wincon = true
turn = 1
while turn <= 9
  if turn.odd?
    puts 'Player 1: select you position'
    mark = marker
  else
    puts 'Player 2: select you position'
    mark = player_mark2
  end

  pos = gets.chomp
  d_matrix.change(pos, mark)

  turn += 1
  if turn.odd?
    puts "\n  After the player two move the board now looks like this:"
    puts d_matrix.matrix_display
  else
    puts "\n  After the player one move the board now looks like this:"
    puts d_matrix.matrix_display
  end

  while wincon == true # wincon is not yet initialized
    if turn == 10
      puts 'This is a draw' 
    elsif turn.odd?
     puts "Player #{player_two} is the winner" # fetch wiining player name
    else
      puts "Player #{player_one} is the winner" # fetch wiining player name
    end
    break
  end
end
# this will display the board with the selected positions
# and also make an assestment of the win condition

# Repeat the cicle until the win condition is fulfiled
# Or the cicle gets to 9 iterations with no win condition, its a TIE

# DISPLAY THE WINNER!!! (or tie)
