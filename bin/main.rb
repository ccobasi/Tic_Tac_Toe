#!/usr/bin/env ruby
require 'io/console'
require 'colorize'
require_relative '../lib/board'
puts 'Hello Player!'
puts 'Instuctions:'
puts '1) Player 1 and Player 2 need to enter their nicknames'
puts '2) Player 1 & 2 need to select their marks (X or O)'
puts '3) Players will need to select their positions to input their marks'
puts 'For example X on position 1 is:'
puts "      [X] [ ] [ ]\n      [ ] [ ] [ ]\n      [ ] [ ] [ ]".yellow
puts '4) In order to win, you need to connect 3 of your marks in a line'
puts 'For example, three different win conditions are:'
puts "      [X] [X] [X]\n      [X] [X] [ ]\n      [X] [ ] [X]".yellow
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

# Inputs the players Marks, selects the mark for player one and gives player two the one thats left

marker = []
until %w[X O].include?(marker)
  puts 'Player 1, do you want to be X or O?'
  marker = gets.chomp.upcase
  case marker
  when 'X'

    puts "Player 1 mark is #{marker}"
  when 'O'

    puts "Player 1 mark is #{marker}"
  else
    puts 'Player 1, do you want to be X or O?'
    marker = gets.chomp.upcase
  end
end

player_mark2 = if marker == 'X'
                 'O'
               else
                 'X'
               end
puts "Player 2 mark is #{player_mark2}"

# Begins the game

puts '                  ARE YOU READY?!!!'.green
puts '             PRESS ENTER TO BEGIN THE GAME'.green
$stdin.noecho(&:gets).chomp

turn = 1
while turn <= 9
  if turn.odd?
    puts "\n Player 1: select your position"
    mark = marker
  else
    puts "\n Player 2: select your position"
    mark = player_mark2
  end

  pos = gets.chomp

  empty = d_matrix.empty(pos)
  if empty == true
    puts 'Invalid input. Choose an empty spot'.red
    turn -= 1
  else
    d_matrix.change(pos, mark)
  end

  turn += 1
  arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  if arr.include?(pos.to_i)
    if turn.odd?
      puts "\n  After the player 2 move the board now looks like this:\n"
    else
      puts "\n After the player 1 move the board now looks like this:\n"
    end
  else
    puts 'Invalid input. Enter number between 1-9'.red
    turn -= 1
  end
  puts ''
  puts d_matrix.matrix_display.yellow

  if turn == 10
    puts 'The game has ended in a draw'.green
    puts ' Do you want yo play again? (Y/N)'
    end_game_draw = gets.chomp
    case end_game_draw
    when 'y', 'Y', 'yes', 'YES'
      turn = 1
      d_matrix.reset_game
      puts "\n The board is clean and ready to play again!\n".green
      puts "\n"
      puts d_matrix.matrix_display.yellow

    when 'n', 'N', 'no', 'NO'
      puts "\n See you next time, player!\n"
      bye = true
    end
  end
  if d_matrix.win_con? == true
    if turn.odd?
      puts "Congratulations player #{player_two.blue} you are the winner!!!"

    else
      puts "Congratulations player #{player_one.blue} you are the winner!!!"

    end
    puts ' Do you want yo play again? (Y/N)'

    end_game = gets.chomp
    case end_game
    when 'y', 'Y', 'yes', 'YES'
      turn = 1
      d_matrix.reset_game
      puts "\n The board is clean and ready to play again!\n".green
      puts "\n"
      puts d_matrix.matrix_display.yellow

    when 'n', 'N', 'no', 'NO'
      puts "\n See you next time, player!\n"
      bye = true
    end
  end
  break if bye == true
end
