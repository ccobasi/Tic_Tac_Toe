#!/usr/bin/env ruby
puts 'Hello Player!'
puts 'Instuctions:'
puts '1) Player 1 and Player 2 need to enter their nicknames'
puts '2) Select po'



player_1 = $stdin.read
puts inp

def fill 
    @pos =  (1..9).to_a
end

def matrix 
    puts <<-fill 
    #{fill [0]} | #{fill [1]} | #{fill [2]}

    #{fill [3]} | #{fill [4]} | #{fill [5]}

    #{fill [6]} | #{fill [7]} | #{fill [8]}
    fill

    puts matrix
end

