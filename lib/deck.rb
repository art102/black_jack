class Deck
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  SUITS = %w(♦ ♠ ♥ ♣).freeze

  attr_reader :cards

  def initialize
    @cards = build_deck
  end

  def take_card
    cards.pop
  end
end
