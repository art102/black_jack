require_relative 'bank'
require_relative 'deck'
require_relative 'player'

class Game
  attr_accessor :player, :dealer, :deck, :bank

  def initialize(interface)
    # @interface = interface
    @bank = Bank.new
    @deck = Deck.new
    @player = Player.new('Dealer', 100)
    @dealer = Player.new('Дилер', 100)
    @interface = interface
    interface.greeting(player, dealer)
    start_game
    # @user_input = interface.get_user_input
  end

  def start_game
    restart_game
    2.times { player.hit(@deck) }
    2.times { dealer.hit(@deck) }
    bank.push(player.rate(10))
    bank.push(dealer.rate(10))
    player.show_cards
    dealer.show_cards
    loop do
      @interface.player_menu(player)
      actions
      @interface.repeat_question
      if @interface.answer_player == 'y'
        start_game
      else
        exit
      end
    end
  end

  # beginning_game(@player, @dealer)

  # def start_game
  #   @interface
  # end

  # def new_game
  #   puts 'Как Вас зовут?'
  #   player.name = gets.chomp

  #   loop do
  #     puts "#{player.name}, сыграем в Black Jack?"
  #     puts 'Да - 1  Нет - 2'
  #     puts ''
  #     choice = gets.chomp.to_i
  #     case choice
  #     when 1
  #       break unless player.money > 0 && dealer.money > 0
  #       beginning_game
  #       player_choice = player_menu
  #       case player_choice
  #       when 1
  #         dealer_turn
  #       when 2
  #         player_turn
  #       when 3
  #         open_cards
  #         determine_winner
  #       end
  #     when 2
  #       break
  #     else
  #       puts "#{player.name}, сыграем ещё в Black Jack?"
  #       puts 'Да - 1  Нет - 2'
  #     end
  #   end
  # end

  private

  def actions
    case @interface.player_choice
    when 1
      dealer_turn
    when 2
      player_turn
    when 3
      #open_cards
      @interface.open_cards
      determine_winner
    end
  end

  # def beginning_game
  #   restart_game
  #   2.times { player.hit(@deck) }
  #   2.times { dealer.hit(@deck) }
  #   bank.push(player.rate(10))
  #   bank.push(dealer.rate(10))
  #   player.show_cards
  #   dealer.show_cards
  # end

  # def player_menu
  #   puts ''
  #   puts '1. Пропустить'
  #   puts '2. Добавить карту' if player.total_cards < 3
  #   puts '3. Открыть карты'
  #   gets.chomp.to_i
  # end

  def player_turn
    player.hit(@deck) if player.total_cards < 3
    @interface.open_cards
    determine_winner
  end

  def dealer_turn
    dealer.hit(@deck) if dealer.points <= 18 && dealer.total_cards < 3
    @interface.open_cards
    determine_winner
  end

  # def open_cards
  #   puts "#{player.name} cards: #{player.cards * ' '}"
  #   puts "#{dealer.name} cards: #{dealer.cards * ' '}"
  #   puts "#{player.name} points is: #{player.points}"
  #   puts "#{dealer.name} points is: #{dealer.points}"
  # end

  def determine_winner
    if dealer.busted? || player.ochko? 
      @interface.winner_player
      dealer.win(bank.pop_all)
    elsif player.busted? || dealer.ochko?
      @interface.faile_message
      player.win(bank.pop_all)
    else
      @interface.try_again
      bet = bank.pop_all / 2
      player.win(bet)
      dealer.win(bet)
    end
  end

  def restart_game
    @deck = Deck.new
    player.cards = []
    dealer.cards = []
  end
end
