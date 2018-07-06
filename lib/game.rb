class Game
  DEFAULT_BANK = 100
  CARDS = 2
  BET = 10
  MAX_CARDS = 3
  ACTION_METHODS = %i[skip_turn add_card open_cards].freeze

  attr_reader :player, :dealer, :status, :player_turn

  def initialize(player)
    @player = player
    @player.deposit(DEFAULT_BANK)
    @dealer = Player.new('Дилер', DEFAULT_BANK)

    start_game
  end

  def start_game
    @game_bank = 0
    @deck = Deck.new
    @player_turn = true
    player.zero_cards
    dealer.zero_cards
    give_cards
    place_a_bet
    @status = :in_progress
  end

  def give_cards
    CARDS.times do
      player.add_card(deck.take_card)
      dealer.add_card(deck.take_card)
    end
  end

  def place_a_bet
    player.withdraw(BET)
    dealer.withdraw(BET)
    self.game_bank = BET * 2
  end

  def return_bet
    player.deposit(BET)
    dealer.deposit(BET)
    self.game_bank = 0
  end

  def next_player_turn(player_choice)
    send ACTION_METHODS[player_choice]
  end
end
