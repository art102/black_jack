class Game
  DEFAULT_BANK = 100
  CARDS = 2
  BET = 10
  MAX_CARDS = 3
  ACTION_METHODS = %i[skip_turn add_card open_cards].freeze

  attr_reader :player, :dealer, :status, :player_turn

end
