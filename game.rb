require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'
require 'csv'

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
    puts "#{player.name}: health - #{player.health}"
  end
  
  def load_players(from_file)
    CSV.foreach(from_file) do |row|
      player = Player.new(row[0], row[1].to_i)
      add_player(player)
    #File.readlines(from_file).each do |line|
      #add_player(Player.from_csv(line))
    end
  end

  def high_score_entry(player)
    formatted_name = player.name.ljust(20, '.')
    "#{formatted_name} #{player.score}"
  end
  
  def play(rounds)
    puts "\n#{@title}"
    puts "There are #{@players.size} players in #{@title}"

    @players.each { |player| puts player }

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points}"
    end
    puts "\n"

    1.upto(rounds) do |round|
      if block_given?
        break if yield
      end

      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
        puts "\n"
      end
    end
  end
  
  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end

  def print_stats
    strong_players = @players.select { |player| player.strong? }
    wimpy_players = @players.reject { |player| player.strong? }

    puts "\n#{title} statistics:"
    puts "\n#{strong_players.size} strong player(s):"
    strong_players.each { |player| name_and_health(player) }

    puts "\n#{wimpy_players.size} wimpy player(s):"
    wimpy_players.each { |player| name_and_health(player) }

    sorted_players = @players.sort
    puts "\n#{title} Highest Score:"
    sorted_players.each do |player|
      puts high_score_entry(player)
    end
    #puts " "

    #@players.each do |player|
      #puts "\n#{player.name}'s point totals:"
      #puts "#{player.points} grand total points"
    #end
    
    puts "\n#{total_points} total points from treasures found:"
    
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end
  end
  
  def save_high_scores(to_file="high_scores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@title} High Scores:"
      @players.sort.each do |player|
        file.puts high_score_entry(player)
      end
    end
  end
end