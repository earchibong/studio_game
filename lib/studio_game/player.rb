require_relative 'treasure_trove'
require_relative 'playable'

module StudioGame
  class Player
    include Playable
    attr_accessor :name, :health
  
      
    def initialize(name, health = 100)
      @name = name.capitalize
      @health = health
      @found_treasures = Hash.new(0)
    end
      
    def score
      @health + points
    end
      
    def to_s
    "I'm #{@name} with: health = #{@health}, points = #{points} and score = #{score}"
    end
      
    def name=(new_name)
      @name = new_name.capitalize
    end
      
    def <=>(other)
      other.score <=> score
    end
      
    def found_treasure(treasure)
      @found_treasures[treasure.name] += treasure.points
      puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
      puts "#{@name}'s treasures: #{@found_treasures}"
    end
    
    def points
      @found_treasures.values.reduce(0, :+)
    end
    
    def each_found_treasure
      @found_treasures.each do |name, point|
        yield Treasure.new(name, point)
      end
    end
    
    def self.from_csv(string)
      name, health = string.split(',')
      Player.new(name, Integer(health))
    end
  end
end

player1 = StudioGame::Player.new('moe')
player2 = StudioGame::Player.new('larry', 60)
player3 = StudioGame::Player.new('curly', 125)
player4 = StudioGame::Player.new('Alvin')
player5 = StudioGame::Player.new('Simon', 80)
player6 = StudioGame::Player.new('Theodore', 200)

if __FILE__ == $0
  player1.w00t
  player2.blam
  puts player3.health
  puts player4.name
  puts player5 = 'lawrence'
  puts player6
end
