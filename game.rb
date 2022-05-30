require_relative 'player'
require_relative 'game_turn'

class Game
    attr_reader :title

    def initialize(title)
        @title = title
        @players = []
    end
    
    def add_player(player_name)
        @players.push(player_name)
    end
    
    def play
       puts @title
       puts "There are #{@players.size} players in #{@title}" 
       
       @players.each {|player| puts player }
       @players.each do |player|
           GameTurn.take_turn(player)
            puts player
        end
    end
end