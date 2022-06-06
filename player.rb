class Player
  attr_reader :health
  attr_accessor :name
    
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
    
  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end
    
  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
    
  def strong?
    @health > 100
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
end

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)
player4 = Player.new('Alvin')
player5 = Player.new('Simon', 80)
player6 = Player.new('Theodore', 200)

if __FILE__ == $0
  player1.w00t
  player2.blam
  puts player3.health
  puts player4.name
  puts player5 = 'lawrence'
  puts player6
end
