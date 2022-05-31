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
    
    def name_and_health(player)
        puts "#{player.name} (#{player.health})"
    end
    
    def play(rounds)
       puts @title
       puts "There are #{@players.size} players in #{@title}"

       @players.each {|player| puts "\n#{player}" }
       puts "\n"
       1.upto(rounds) do |round|
           puts "\nRound #{round}:"
           @players.each do |player|
               GameTurn.take_turn(player)
               puts player
            end
        end
    end

    def print_stats
        strong_players = @players.select { |player| player.strong? }
        wimpy_players = @players.reject { |player| player.strong? }

        puts "\n#{title} statistics:"
        puts "\n#{strong_players.size} strong player(s):"
        strong_players.each { |player| name_and_health(player) }

        puts "\n#{title} statistics:"
        puts "\n#{wimpy_players.size} wimpy player(s):"
        wimpy_players.each { |player| name_and_health(player) }

        sorted_players = @players.sort
        puts "\n#{title} Highest Score:"
        sorted_players.each do |player|
            formatted_name = player.name.ljust(20, '.')
            puts "#{formatted_name} #{player.score}"
        end
    end
end