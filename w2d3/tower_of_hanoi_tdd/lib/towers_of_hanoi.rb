class Towers
    attr_reader :towers

    def initialize
        @towers = Array.new(3) { Array.new }
        @towers[0] = [5, 4, 3, 2, 1]
    end

    def won?
        # game.towers[0].empty? && game.towers[1].empty? && (game.towers[2] == game.towers[2].sort) || game.towers[0].empty? && game.towers[2].empty? && (game.towers[1] == game.towers[1].sort)
        return false
    end 

end