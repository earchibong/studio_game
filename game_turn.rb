require_relative 'die'
require_relative 'player'

module GameTurn
  def self.take_turn(player)
    die = Die.new
    number_rolled = die.roll
    case number_rolled
    when 1..2 then player.blam
    when 3..4 then puts "#{player} was skipped"
    else 
        player.w00t
    end
  end
end
