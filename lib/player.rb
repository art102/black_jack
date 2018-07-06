class Player
  MAX_SCORE = 21
  SKIP_SCORE = 17

  attr_accessor :name, :cards
  attr_reader :bank

  def initialize(name, bank = 0)
    @name = name
    @cards = []
    @bank = bank
  end

  def add_card(card)
    cards << card
  end

  def deposit(amount)
    self.bank += amount
  end

  def withdraw(amount)
    self.bank -= amount
  end

  def zero_cards
    self.cards = []
  end

  def score
    score = 0
    cards.each { |card| score += score > 10 ? card.ace_cost : card.cost}

    score
  end
end
