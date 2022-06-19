require_relative '../lib/studio_game/game'
require_relative '../lib/studio_game/die'
require_relative '../lib/studio_game/clumsy_player'
require_relative '../lib/studio_game/berserk_player'

klutz = StudioGame::ClumsyPlayer.new("klutz", 105)
berserker = StudioGame::BerserkPlayer.new("berserker", 50)

knuckleheads = StudioGame::Game.new("knuckleheads")
default_player_file = File.join(File.dirname(__FILE__), 'players.csv')
knuckleheads.load_players(ARGV.shift || default_player_file)
knuckleheads.add_player(klutz)
knuckleheads.add_player(berserker)

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
