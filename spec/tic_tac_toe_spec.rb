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
        expect(d_matrix.change('1', 'X')).to eq('X')
    end
    it 'changes the value of the choosen cell in the array' do
      expect(d_matrix.change('2', 'O')).to eq('O')
    end
  end

  describe '#win_con?' do
    it 'checks if win condition is valid (returns true if there is win condition) ' do
      d_matrix.change('1', 'X')
      d_matrix.change('2', 'X')
      d_matrix.change('3', 'X')

      expect(d_matrix.win_con?).to be true
    end
    it 'checks if win condition is invalid (returns false if there is no win condition) ' do
      d_matrix.change('1', 'X')
      d_matrix.change('2', 'O')
      d_matrix.change('3', 'X')

      expect(d_matrix.win_con?).to be false
    end
  end

  describe '#for_x' do
    it 'return true if 3 marks are X in any row, column or diagonal' do
      board.change('3', 'X')
      board.change('6', 'X')
      board.change('9', 'X')

      expect(board.for_x).to be true
    end

    it 'return false if 3 marks are not X in any row, column or diagonal' do
      board.change('1', 'X')
      board.change('2', 'O')
      board.change('3', 'X')

      expect(board.for_x).to be false
    end
  end

  describe '#for_o' do
    it 'return true if 3 marks are O in any row, column or diagonal' do
      board.change('1', 'O')
      board.change('4', 'O')
      board.change('7', 'O')

      expect(board.for_o).to be true
    end

    it 'return false if 3 marks are not O in any row, column or diagonal' do
      board.change('1', 'O')
      board.change('2', 'X')
      board.change('3', 'O')

      expect(board.for_o).to be false
    end
  end

  describe '#reset_game' do
    it 'returns empty board' do
      d_matrix.matrix_display.reset_game
      expect(d_matrix.matrix_display).to eq(d_matrix)
    end
  end

  describe '#empty' do
    it 'checks if the cell is empty and return true if cell is not empty' do
      outcome = @cell[input] == [5]
      expect(outcome).to be true
    end
    it 'checks if the cell is empty and return false if cell is empty' do
      outcome = @cell[input] == "\s"
      expect(outcome).to be false
    end
  end
end
