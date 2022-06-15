require_relative 'game'
require_relative 'die'
require_relative 'clumsy_player'
require_relative 'berserk_player'

#player1 = Player.new('moe')
#player2 = Player.new('larry', 60)
#player3 = Player.new('curly', 125)
#player4 = Player.new('Alvin')
#player5 = Player.new('Simon', 80)
#player6 = Player.new('Theodore', 200)
klutz = ClumsyPlayer.new("klutz", 105)
berserker = BerserkPlayer.new("berserker", 50)

knuckleheads = Game.new("knuckleheads")
#knuckleheads.add_player(player1)
#knuckleheads.add_player(player2)
#knuckleheads.add_player(player3)
knuckleheads.load_players(ARGV.shift || 'players.csv')
knuckleheads.add_player(klutz)
knuckleheads.add_player(berserker)
#knuckleheads.play(10) do |treasure|
#  knuckleheads.total_points >= 2000
#end

loop do
  puts "\nhow many game rounds would you like? (enter a number or 'q' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/ then knuckleheads.play(answer.to_i)
  when "q", "quit", "exit" then knuckleheads.print_stats
    break
  else
    puts "please enter a number or 'quit'"
  end
end
knuckleheads.save_high_scores
