require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = build_deck
  end

  protected

  def build_deck
    deck = []
    %w(♠ ♣ ♥ ♦).each do |suit|
      (2..10).each do |number|
        deck << Card.new(suit, number)
      end
      %w(A K Q J).each do |facecard|
        deck << Card.new(suit, facecard)
      end
    end
    deck.shuffle!
  end
end
