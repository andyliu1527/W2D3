require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @player = Player.new()
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def board
        @board
    end

    def player
        @player
    end

    def start_game
        @board.place_random_ships
        p "Number of Ships: " + @board.num_ships.to_s
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p 'you lose'
            return true
        end
        return false
    end

    def win?
        if @board.num_ships == 0
            p 'you win'
            return true
        end
        return false
    end

    def game_over?
        return true if lose? || win?
        return false
    end

    def turn
        pos = @player.get_move
        if !@board.attack(pos)
            @remaining_misses -= 1
        end
        @board.print
        p "Remaining misses: " + @remaining_misses.to_s
    end
end
