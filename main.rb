puts 'Игра "Black Jack"'
print "Для начала игры введите ваше имя: "
player_name = gets.chomp
player_name = 'Аноним' if player_name.to_s.empty?
