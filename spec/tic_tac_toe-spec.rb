#spec/tic_tac_toe-spec.rb
require_relative '../lib/board'
require_relative '../bin/main'



d_matrix = Board.new


empty_tic_tac_toe = Board.new
full_tie_tic_tac_toe = Board.new(p1, p2)
full_tie_tic_tac_toe.d_matrix.matrix_display = %w[O X O X O X X O X]
win_con1 = Board.new(p1, p2)
win_con1.d_matrix.matrix_display = ['O', 'O', 'O', 4, 5, 6, 7, 8, 9]
win_con2 = Board.new(p1, p2)
win_con2.d_matrix.matrix_display = [1, 2, 3, 'O', 'O', 'O', 7, 8, 9]
win_con3 = Board.new(p1, p2)
win_con3.d_matrix.matrix_display = [1, 2, 3, 4, 5, 6, 'O', 'O', 'O']
win_con4 = Board.new(p1, p2)
win_con4.d_matrix.matrix_display = ['O', 2, 3, 'O', 5, 6, 'O', 8, 9]
win_con5 = Board.new(p1, p2)
win_con5.d_matrix.matrix_display = [1, 'O', 3, 4, 'O', 6, 7, 'O', 9]
win_con6 = Board.new(p1, p2)
win_con6.d_matrix.matrix_display = [1, 2, 'O', 4, 5, 'O', 7, 8, 'O']
win_con7 = Board.new(p1, p2)
win_con7.d_matrix.matrix_display = ['O', 2, 3, 4, 'O', 6, 7, 8, 'O']
win_con8 = Board.new(p1, p2)
win_con8.d_matrix.matrix_display = [1, 2, 'O', 4, 'O', 6, 'O', 8, 9]

describe Board do
    describe '#matrix_display' do
        it 'returns the board in the displayable form' do
            expect(d_matrix.matrix_display).to eq(%(
            #{d_matrix.matrix_display[0]} | #{d_matrix.matrix_display[1]} | #{d_matrix.matrix_display[2]}
            ---+---+---
            #{d_matrix.matrix_display[3]} | #{d_matrix.matrix_display[4]} | #{d_matrix.matrix_display[5]}
            ---+---+---
            #{d_matrix.matrix_display[6]} | #{d_matrix.matrix_display[7]} | #{d_matrix.matrix_display[8]} ))
           
        end
    end
    
    
    describe '#change' do
        it 'changes the value of the choosen cell in the array' do
            d_matrix.change(5)
            expect(d_matrix.matrix_display).to eq([1, 2, 3, 4, 'Y', 6, 7, 8, 9])
        end
    end

   
end


