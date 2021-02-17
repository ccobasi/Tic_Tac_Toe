#!/usr/bin/env ruby
require 'io/console'
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
def player_input
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
end

def place_marker(board, marker, position)
    board[position] = marker
end

def win_check(board,mark)
    return((board[7]==mark && board[8]==mark && board[9]==mark) || # acros the top
    (board[4]==mark && board[5]==mark && board[6]==mark) || # across the middle
    (board[1]==mark && board[2]==mark && board[3]==mark) || # across the bottom
    (board[7]==mark && board[4]==mark && board[1]==mark) || # down the left
    (board[8]==mark && board[5]==mark && board[2]==mark) || # down the middle
    (board[9]==mark && board[6]==mark && board[3]==mark) || # down the right
    (board[7]==mark && board[5]==mark && board[3]==mark) || # diagonal
    (board[9]==mark && board[5]==mark && board[1]==mark))   # diagonal
end

def choose_first
    if rand(0..1) == 0 then
        return 'Player 2 go first'
    else
        return 'Player 1 go first'
    end
end

def valid_position
    loop do
      break if (1..9).include?(position) && !board[position - 1].is_a?(String)

      puts 'Please enter a valid number from 1 to 9 to be replaced by your symbol' unless (1..9).include?(position)

      position = gets.chomp.to_i
    end
    
    position
  end

def space_check(board,position)
    return board[position] == ''
end

def full_board_check(board)
    for i in (1...10)
        if space_check(board,i) then
            return false
        end
    return true
    end
end

def player_choice(board)
    position = 0
    until position in [1,2,3,4,5,6,7,8,9] || != space_check(board, position)
        puts 'Choose your next position:(1-9)'
        position = gets.chomp.to_i
    return position
end

def replay
    rematch = puts 'Do you want to play again? Enter Yes or No: '.gets.chomp
    return rematch
end

  output = valid_position
  p output
  

# Begins the game

puts '                  ARE YOU READY?!!!'
puts '             PRESS ENTER TO BEGIN THE GAME'
$stdin.noecho(&:gets).chomp

puts 'Player 1: select you position'
pos1 = gets.chomp
# mark_one = pos1
puts "Your position to play is: #{pos1}"

puts 'Player 2: select you position'
pos2 = gets.chomp
# mark_two = pos2
puts "Your position to play is: #{pos2}"

# this will display the board with the selected positions
# and also make an assestment of the win condition

puts "\n      [X] [O] [ ]\n      [ ] [ ] [ ]\n      [ ] [ ] [ ]"

puts 'READY FOR THE NEXT ROUND?'
puts 'PRESS ENTER TO CONTINUE'
$stdin.noecho(&:gets).chomp

# Repeat the cicle until the win condition is fulfiled
# Or the cicle gets to 9 iterations with no win condition, its a TIE

# DISPLAY THE WINNER!!! (or tie)
