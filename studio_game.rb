require_relative 'game'
require_relative 'die'

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)
#player4 = Player.new('Alvin')
#player5 = Player.new('Simon', 80)
#player6 = Player.new('Theodore', 200)

knuckleheads = Game.new("knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(2)
knuckleheads.print_stats

=begin
chipmunks = Game.new('chipmunks')
chipmunks.add_player(player4)
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.play
chipmunks.print_stats
=end

