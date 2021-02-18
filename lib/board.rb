class Board
    attr_accessor :cell


    def initialize 
        @cell = { '1' => "\s", '2' => "\s", '3' => "\s", '4' => "\s", '5' => "\s", '6' => "\s", '7' => "\s", '8' => "\s", '9' => "\s" }
    end

    def matrix_display 
    "\s[#{@cell['1']}]  [#{@cell['2']}]  [#{@cell['3']}]
    [#{@cell['4']}]  [#{@cell['5']}]  [#{@cell['6']}]
    [#{@cell['7']}]  [#{@cell['8']}]  [#{@cell['9']}]"
    end

    def change(pos, value)
        @cell[pos] = value
      end

    # def win_con(board)
    #     win = false
    #     conditions = [
    #         [board[0], board[1], board[2]], ||
    #         [board[3], board[4], board[5]], ||
    #         [board[6], board[7], board[8]], ||
    #         [board[0], board[3], board[6]], ||
    #         [board[1], board[4], board[7]], ||
    #         [board[2], board[5], board[8]], ||
    #         [board[0], board[4], board[8]], ||
    #         [board[2], board[4], board[6]], 
    #     ]
    #     condition.any? do |element|
    #         element.all? {|i| i == 'X' || 'O' then win = true}
    #     end
    # end
   
    

end