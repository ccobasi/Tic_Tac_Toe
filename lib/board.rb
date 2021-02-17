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
   
    

end