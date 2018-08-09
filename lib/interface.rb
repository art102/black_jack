require_relative 'player'

class Interface
  attr_reader :player_choice, :answer_player

  def greeting(player, dealer)
    @player = player
    @dealer = dealer
    puts 'Как Вас зовут?'
    @player.name = gets.chomp
    # get_user_input
    # loop do
    #   puts "#{player.name}, сыграем в Black Jack?"
    #   puts 'Да - 1  Нет - 2'
    #   puts ''
    #   choice = gets.chomp.to_i
    #   case choice
    #   when 1
    #     break unless player.money > 0 && dealer.money > 0
    #     beginning_game
    #     player_choice = player_menu
    #     case player_choice
    #     when 1
    #       dealer_turn
    #     when 2
    #       player_turn
    #     when 3
    #       open_cards
    #       determine_winner
    #     end
    #   when 2
    #     break
    #   else
    #     puts "#{player.name}, сыграем ещё в Black Jack?"
    #     puts 'Да - 1  Нет - 2'
    #   end
    # end
  end

  # def get_user_input
  #   loop do
  #     puts "#{@player.name}, сыграем в Black Jack?"
  #     puts 'Да - 1  Нет - 2'
  #     puts ''
  #     choice = gets.chomp.to_i
  #     case choice
  #     when 1
  #       break unless @player.money > 0 && @dealer.money > 0
  #       player_choice = player_menu(@player)
  #       beginning_game
  #       # player_choice = player_menu(@player)
  #       # case player_choice
  #       # when 1
  #       #   dealer_turn
  #       # when 2
  #       #   player_turn
  #       # when 3
  #       #   open_cards
  #       #   determine_winner
  #       # end
  #     when 2
  #       break
  #     else
  #       puts "#{@player.name}, сыграем ещё в Black Jack?"
  #       puts 'Да - 1  Нет - 2'
  #     end
  #   end
  # end

  def repeat_question
    puts "Сыграем еще?(y/n): "
    @answer_player = gets.strip.downcase
  end

  def player_menu(player)
    puts ''
    puts '1. Пропустить'
    puts '2. Добавить карту' if player.total_cards < 3
    puts '3. Открыть карты'
    @player_choice = gets.chomp.to_i
  end

  def winner_player
    puts "Поздравляю #{@player.name}, Вы выиграли!"
  end

  def faile_message
    puts "Вы проиграли!"
  end

  def try_again
    puts 'Попробуйте ещё раз.'
  end
end
