class Board
    def initialize(num)
        @grid = Array.new(num) {Array.new(num, :N)}
        @size = num * num
    end

    def size
        @size
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos, value)
        @grid[pos[0]] [pos[1]] = value
    end

    def num_ships
        @grid.flatten.count {|ele| ele == :S}
    end

    def attack(pos)
        if self[pos] == :S
            self[pos]= :H
            p "you sunk my battleship"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        num_rand_ships = @size / 4
        while self.num_ships < num_rand_ships
            pos = [rand(0...@grid.length), rand(0...@grid.length)]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |subarray|
            subarray.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(grid)
        i = 0 
        while i < grid.length
            puts grid[i].join(" ")
            i += 1
        end
    end

    def cheat
        Board.print_grid(@grid)
    end
    
    def print
        Board.print_grid(hidden_ships_grid)
    end
end
