class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def value
    total = 0
    ace_count = 0

    @cards.each do |card|
      ace_count += 1 if card.value == 11
      total += card.value
    end

    ace_count >= 1 && total > 21 ? total - 10 : total
  end

  def display
    @cards.each { |card| print "#{card.display} " }
  end

  def display_hidden
    @cards.count.times { print '🂠 ' }
  end
end
