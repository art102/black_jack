class Game
  def initialize
    puts 'Как вас зовут?'
    @name = gets.chomp.capitalize
    bank
    start_game
  end

  private

  def bank
    @player_bank = 100
    @dealer_bank = 100
  end

  def start_game
    bank if @player_bank <= 0 || @dealer_bank <= 0
    @game_bank = 0
    @deck = Deck.new
    @deck.shuffle
    @player_hand = Hand.new
    @dealer_hand = Hand.new

    deal_cards
    bet(10)
    info
    menu
    continue
  end

  def continue
    puts "Для продолжения игры нажмите 'Y'"
    start_game if gets.chomp == 'Y'
  end

  def deal_cards
    2.times { @deck.deal_card(@player_hand) }
    2.times { @deck.deal_card(@dealer_hand) }
  end

  def info
    system 'clear'
    puts 'Дилер:'
    puts "#{@dealer_bank}$"
    @player_hand.cards.count == 2 ? @dealer_hand.display_hidden : @dealer_hand.display
    puts "\n--------------------"
    @player_hand.display
    puts "\n#{@name}:"
    puts "#{@player_bank}$"
    puts "Счет #{@name}a: #{@player_hand.value}"
  end

  def menu
    puts '1. Пропустить'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    puts '4. Покинуть игру'

    choose = gets.to_i
    dealer_step if choose == 1
    player_step if choose == 2
    who_win?    if choose == 3
    exit_game   if choose == 4
  end

  def dealer_step
    @deck.deal_card(@dealer_hand) if @dealer_hand.value < 17
    @player_hand.cards.count == 3 ? who_win? : player_step
  end

  def player_step
    @deck.deal_card(@player_hand)
    @dealer_hand.cards.count == 3 ? who_win? : dealer_step
  end

  def who_win?
    info
    puts "Счет Дилера: #{@dealer_hand.value}"
    draw?
    player_win?
    dealer_win?
  end

  def exit_game
    exit
  end

  def draw?
    if @player_hand.value.eql?(@dealer_hand.value)
      draw_bank
    elsif @player_hand.value > 21 && @dealer_hand.value > 21
      draw_bank
    end
  end

  def draw_bank
    @player_bank += @game_bank / 2
    @dealer_bank += @game_bank / 2
    puts 'Ничья!'
  end

  def player_win?
    if @player_hand.value <= 21 && @dealer_hand.value < @player_hand.value
      player_win_bank
    elsif @dealer_hand.value > 21 && !draw?
      player_win_bank
    end
  end

  def dealer_win?
    if @dealer_hand.value <= 21 && @player_hand.value < @dealer_hand.value
      dealer_win_bank
    elsif @player_hand.value > 21 && !draw?
      dealer_win_bank
    end
  end

  def player_win_bank
    @player_bank += @game_bank
    puts "Победил #{@name}!"
  end

  def dealer_win_bank
    @dealer_bank += @game_bank
    puts 'Победил Дилер!'
  end

  def bet(bet)
    @player_bank -= bet
    @dealer_bank -= bet
    @game_bank   += bet
  end
end
