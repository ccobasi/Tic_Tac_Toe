require_relative '../lib/board'

d_matrix = Board.new

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
      d_matrix.change('3', 'X')
      d_matrix.change('6', 'X')
      d_matrix.change('9', 'X')

      expect(d_matrix.for_x).to be true
    end

    it 'return false if 3 marks are not X in any row, column or diagonal' do
      d_matrix.change('1', 'X')
      d_matrix.change('2', 'O')
      d_matrix.change('3', 'X')

      expect(d_matrix.for_x).to be false
    end
  end

  describe '#for_o' do
    it 'return true if 3 marks are O in any row, column or diagonal' do
      d_matrix.change('1', 'O')
      d_matrix.change('4', 'O')
      d_matrix.change('7', 'O')

      expect(d_matrix.for_o).to be true
    end

    it 'return false if 3 marks are not O in any row, column or diagonal' do
      d_matrix.change('1', 'O')
      d_matrix.change('2', 'X')
      d_matrix.change('3', 'O')

      expect(d_matrix.for_o).to be false
    end
  end

  describe '#reset_game' do
    it 'returns empty board' do
      d_matrix.matrix_display.reset_game
      expect(d_matrix.matrix_display).to eq(d_matrix)
    end
  end

  describe '#empty' do
    it 'checks if the cell is empty' do
      expect(d_matrix.empty('1')).to be nil
    end
    it 'checks if the cell is empty if not' do
      d_matrix.change('1', 'X')
      expect(d_matrix.empty('1')).to be true
    end
  end
end
