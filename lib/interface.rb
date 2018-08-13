require_relative 'player'

class Interface
  attr_reader :player_choice, :answer_player

  def greeting(player, dealer)
    @player = player
    @dealer = dealer
    puts 'Как Вас зовут?'
    @player.name = gets.chomp
  end

  def repeat_question
    print "Сыграем еще?(y/n): "
    @answer_player = gets.strip.downcase
  end

  def player_menu(player)
    puts ''
    puts '1. Пропустить'
    puts '2. Добавить карту' if player.total_cards < 3
    puts '3. Открыть карты'
    @player_choice = gets.chomp.to_i
  end

  def open_cards
    puts "#{@player.name} cards: #{@player.cards * ' '}"
    puts "#{@dealer.name} cards: #{@dealer.cards * ' '}"
    puts ""
    puts "#{@player.name} points is: #{@player.points}"
    puts "#{@dealer.name} points is: #{@dealer.points}"
    puts ""
  end

  def winner
    puts "Поздравляю, Вы выиграли!"
  end

  def faile_message
    puts "Вы проиграли!"
  end

  def draw
    puts 'Ничья.'
  end
end
