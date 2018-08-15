require_relative 'bank'
require_relative 'deck'
require_relative 'player'

class Game
  attr_accessor :player, :dealer, :deck, :bank

  def initialize(interface)
    @bank = Bank.new
    @deck = Deck.new
    @player = Player.new('Player', 100)
    @dealer = Player.new('Дилер', 100)
    @interface = interface
    interface.greeting(player, dealer)
    start_game
  end

  def start_game
    restart_game
    2.times { player.hit(@deck) }
    2.times { dealer.hit(@deck) }
    bank.push(player.rate(10))
    bank.push(dealer.rate(10))
    @interface.show_cards
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

  private

  def actions
    case @interface.player_choice
    when 1
      dealer_turn
    when 2
      player_turn
    when 3
      @interface.open_cards
      determine_winner
    end
  end

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

  def determine_winner
    if @player.points > 21 || @player.points < @dealer.points && @dealer.points <= 21
      @interface.faile_message
      dealer.win(bank.pop_all)
    elsif @player.points > @dealer.points || @dealer.points > 21
      @interface.winner
      player.win(bank.pop_all)
    else
      @interface.draw
    end
  end

  def restart_game
    @deck = Deck.new
    player.cards = []
    dealer.cards = []
  end
end
