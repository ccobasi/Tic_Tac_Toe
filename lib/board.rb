# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

class Board
  attr_reader :cell

  def initialize
    @cell = { '1' => "\s", '2' => "\s", '3' => "\s", '4' => "\s", '5' => "\s", '6' => "\s", '7' => "\s",
              '8' => "\s", '9' => "\s" }
  end

  def matrix_display
    "    [#{@cell['1']}]  [#{@cell['2']}]  [#{@cell['3']}]
    [#{@cell['4']}]  [#{@cell['5']}]  [#{@cell['6']}]
    [#{@cell['7']}]  [#{@cell['8']}]  [#{@cell['9']}]"
  end

  def change(pos, value)
    @cell[pos] = value
  end

  def win_con?
    @win_con = true if for_x || for_o
  end

  def for_x
    # for X
    @cell.slice('1', '2', '3').values.all?('X') ||
      @cell.slice('4', '5', '6').values.all?('X') ||
      @cell.slice('7', '8', '9').values.all?('X') ||
      @cell.slice('1', '4', '7').values.all?('X') ||
      @cell.slice('2', '5', '8').values.all?('X') ||
      @cell.slice('3', '6', '9').values.all?('X') ||
      @cell.slice('1', '5', '9').values.all?('X') ||
      @cell.slice('3', '5', '7').values.all?('X')
  end

  def for_o
    # for O
    @cell.slice('1', '2', '3').values.all?('O') ||
      @cell.slice('4', '5', '6').values.all?('O') ||
      @cell.slice('7', '8', '9').values.all?('O') ||
      @cell.slice('1', '4', '7').values.all?('O') ||
      @cell.slice('2', '5', '8').values.all?('O') ||
      @cell.slice('3', '6', '9').values.all?('O') ||
      @cell.slice('1', '5', '9').values.all?('O') ||
      @cell.slice('3', '5', '7').values.all?('O')
  end

  def reset_game
    @cell = { '1' => "\s", '2' => "\s", '3' => "\s", '4' => "\s", '5' => "\s", '6' => "\s", '7' => "\s",
              '8' => "\s", '9' => "\s" }
  end

  def empty(input)
    return true unless @cell[input] == "\s"
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
