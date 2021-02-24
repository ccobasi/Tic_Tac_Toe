require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  describe '#matrix_display' do
    it 'check matrix_display is string' do
      expect(board.matrix_display).to be_a String
    end
  end

  describe '#change' do
    it 'replaces the marks in the board' do
      expect(board.change('1', 'X')).to eq('X')
    end
  end

  describe '#win_con?' do
    it 'return true if 3 marks are the same' do
      board.change('1', 'X')
      board.change('2', 'X')
      board.change('3', 'X')

      expect(board.win_con?).to be true
    end

    it 'return false if 3 marks are not the same' do
      board.change('1', 'X')
      board.change('2', 'O')
      board.change('3', 'X')

      expect(board.win_con?).to be false
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

  describe '#empty' do
    it 'if it is empty' do
      expect(board.empty('1')).to be nil
    end

    it 'error if not empty' do
      board.change('1', 'X')
      expect(board.empty('1')).to be true
    end
  end
end
