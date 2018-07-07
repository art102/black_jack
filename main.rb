require_relative 'lib/player'
require_relative 'lib/game'

puts 'Игра "Black Jack"'
print "Для начала игры введите ваше имя: "
player_name = gets.chomp
player_name = 'Аноним' if player_name.to_s.empty?

player = Player.new(player_name)

game = Game.new(player)
