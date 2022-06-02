class Board

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def [](position)
        row = position[0]
        column = position[1]
        @grid[row][column]
    end

    def valid?(position) #position will be an array
        position.none?{|ele| ele > 2 || ele < 0}
    end

    def empty?(position)
        return true if @grid[position] == "_"
        return false
    end
        
    def place_mark(position, mark)
        if !valid?(position)
            raise "invalid position"
        elsif !empty?(position)
            raise "not an empty position"
        end
        self[position] = mark
    end


end