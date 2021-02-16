#!/usr/bin/env ruby
require 'io/console'
puts 'Hello Player!'
puts 'Instuctions:'
puts '1)Player 1 and Player 2 need to enter their nicknames'
puts '2) Player 1 & 2 need to select their marks (X or O)'
puts '3) Players will need to select their positions to input their marks'
puts "For example X on position 1 is:\n      [X] [ ] [ ]\n      [ ] [ ] [ ]\n      [ ] [ ] [ ]"
puts '4) In order to win, you need to connect 3 of your marks in a line'
puts "For example:\n      [X] [X] [X]\n      [X] [X] [ ]\n      [X] [ ] [X]"
puts 'PRESS ENTER TO CONTINUE'
$stdin.noecho(&:gets).chomp


puts 'Player 1, enter your Nickname:'
nick1 = gets.chomp
player_one = (nick1)
puts "Welcome: #{player_one}"

puts 'Player 2, enter your Nickname:'
nick2 = gets.chomp
player_two = (nick2)
puts "Welcome: #{player_two}"

player_1 = $stdin.read
puts inp

# def fill 
#     @pos =  (1..9).to_a
# end

# def matrix 
#     puts <<-fill 
#     #{fill [0]} | #{fill [1]} | #{fill [2]}

#     #{fill [3]} | #{fill [4]} | #{fill [5]}

#     #{fill [6]} | #{fill [7]} | #{fill [8]}
#     fill

#     puts matrix
# end

# def display_matrix(board)
#     puts ('  |   |')
#     puts('' +board[0] +  ' |' + board[1]+ '  |' + board[2])
#     puts ('  |   |')
#     puts('----------')
#     puts ('  |   |')
#     puts('' +board[3] +  ' |' + board[4]+ '  |' + board[5])
#     puts ('  |   |')
#     puts('----------')
#     puts ('  |   |')
#     puts('' +board[6] +  ' |' + board[7]+ '  |' + board[8])
#     puts ('  |   |')
# end

def player_input
    marker = []

    until (marker=='X' || marker == 'O')
        puts 'Do you want to be X or O'
        marker = gets.chomp.upcase
    if marker == 'X' then
        return puts 'Your mark is X'
    elsif marker == 'O' then
        return puts 'Your mark is O'
    else
        puts 'Do you want to be X or O'
        marker = gets.chomp.upcase
    end
end
end

# test = ['X','O','X','O','X','O','X','O','X']
# p display_matrix(test)
output = player_input
p output
puts '                  ARE YOU READY?!!!'
puts '             PRESS ENTER TO BEGIN THE GAME'
$stdin.noecho(&:gets).chomp

puts 'Player 1: select you position'
pos1 = gets.chomp
mark_one = (pos1)
puts "Your position to play is: #{pos1}"

puts 'Player 2: select you position'
pos2 = gets.chomp
mark_two = (pos2)
puts "Your position to play is: #{pos2}"

#this will display the board with the selected positions
#and also make an assestment of the win condition

puts "\n      [X] [O] [ ]\n      [ ] [ ] [ ]\n      [ ] [ ] [ ]"

puts  '         READY FOR THE NEXT ROUND?'
puts '           PRESS ENTER TO CONTINUE'
$stdin.noecho(&:gets).chomp

#Repeat the cicle until the win condition is fulfiled

#DISPLAY THE WINNER!!!
