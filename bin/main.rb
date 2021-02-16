#!/usr/bin/env ruby
# puts 'Hello Player!'
# puts 'Instuctions:'
# puts '1) Player 1 and Player 2 need to enter their nicknames'
# puts '2) Select po'



# player_1 = $stdin.read
# puts inp

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

def display_matrix(board)
    puts ('  |   |')
    puts('' +board[0] +  ' |' + board[1]+ '  |' + board[2])
    puts ('  |   |')
    puts('----------')
    puts ('  |   |')
    puts('' +board[3] +  ' |' + board[4]+ '  |' + board[5])
    puts ('  |   |')
    puts('----------')
    puts ('  |   |')
    puts('' +board[6] +  ' |' + board[7]+ '  |' + board[8])
    puts ('  |   |')
end

def player_input
    marker = []

    until (marker=='X' || marker == 'O')
        puts 'Do you want to be X or O'
        marker = gets.chomp.upcase
    if marker == 'X' then
        return ['X','O']
    else
        return ['O', 'X']
    end
end
end

# test = ['X','O','X','O','X','O','X','O','X']
# p display_matrix(test)
output = player_input
p output
