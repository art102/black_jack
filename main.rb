require_relative 'lib/card'
require_relative 'lib/interface'
require_relative 'lib/player'
require_relative 'lib/game'

puts 'Игра "Black Jack"'
print "Для начала игры введите ваше имя: "
player_name = gets.chomp
player_name = 'Аноним' if player_name.to_s.empty?

player = Player.new(player_name)

game = Game.new(player)

interface = Interface.new(game)

while game.in_progress?
  interface.print_game_status(game)
  if game.player_turn
    game.next_player_turn(interface.get_player_choice)
  else
    game.next_dealer_turn
  end
  interface.print_game_status(game)

  interface.next_game_request if game.finished?
end
