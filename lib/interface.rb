require_relative 'player'

class Interface
  def greeting(player, dealer)
    @player = player
    @dealer = dealer
    puts 'Как Вас зовут?'
    @player.name = gets.chomp
    get_user_input
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

  def get_user_input
    loop do
      puts "#{@player.name}, сыграем в Black Jack?"
      puts 'Да - 1  Нет - 2'
      puts ''
      choice = gets.chomp.to_i
      case choice
      when 1
        break unless @player.money > 0 && @dealer.money > 0
        player_choice = player_menu(@player)
        # beginning_game
        # player_choice = player_menu(@player)
        # case player_choice
        # when 1
        #   dealer_turn
        # when 2
        #   player_turn
        # when 3
        #   open_cards
        #   determine_winner
        # end
      when 2
        break
      else
        puts "#{@player.name}, сыграем ещё в Black Jack?"
        puts 'Да - 1  Нет - 2'
      end
    end
  end

  def player_menu(player)
    puts ''
    puts '1. Пропустить'
    puts '2. Добавить карту' if player.total_cards < 3
    puts '3. Открыть карты'
    gets.chomp.to_i
  end
end
