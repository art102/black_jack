class Interface
  PLAYER_ACTIONS = ['Skip', 'Add card', 'Open cards'].freeze
  RESULT_MESSAGE = {win: 'You won', loss: 'You lose', draw: 'Draw'}.freeze

  attr_reader :game

  def initialize(game)
    @game = game
  end

  def view_player_info(player, hide = false)
    puts "Player: #{player.name}\nCount: #{hide ? '**' : player.score}\nMoney: #{player.bank}\n"
    cards_list = ''
    player.cards.each { |card| cards_list += hide ? ' **' : " #{card}" }
    puts "Cards: #{cards_list}"
    puts "____________________\n"
  end
end
