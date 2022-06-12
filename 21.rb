deck = [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['H', 'A'],
['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K'], ['D', 'A'],
['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A'],
['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A']]

@current_deck = deck
@player_cards = []
@dealer_cards = []

def greeting
  system 'clear'
  puts "Welcome to Twenty-One"
end

def deal_player(cards)
  @player_cards = @current_deck.sample(2)
  @current_deck -= @player_cards
  return @player_cards
end
  
def deal_dealer(cards)
  @dealer_cards = @current_deck.sample(2)
  @current_deck -= @dealer_cards
  return @dealer_cards
end

def display_player(cards)
  puts "Your cards are #{cards}."
end

def display_dealer_first(cards)
  puts "The dealer's first card is #{cards.first}."
end

def display_dealer(cards)
  puts "The dealer's cards are #{cards}."
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def display_player_total(cards)
  puts "The value of your cards is #{total(@player_cards)}."
end

def display_dealer_total(cards)
  puts "The value of the dealer's cards is #{total(@dealer_cards)}."
end

# def display_dealer_first(cards)
#   puts "The value of the dealer's visible card is #{total(@dealer_cards)}."
# end

def deal_player_again(cards)
  @player_cards += @current_deck.sample(1)
  @current_deck -= @player_cards
  return @player_cards
end
  
def deal_dealer_again(cards)
  @dealer_cards += @current_deck.sample(1)
  @current_deck -= @dealer_cards
  return @dealer_cards
end

def player_over_twenty_one?(cards)
  true if total(@player_cards) > 21
end

def dealer_over_twenty_one?(cards)
  true if total(@dealer_cards) > 21
end

def bust?(cards)
  if player_over_twenty_one?(@player_cards) == true
    puts "Sorry, you go bust!"
  elsif dealer_over_twenty_one?(@dealer_cards) == true
    puts "The dealer goes bust! You win!"
  end
end

def counting_winner
  if total(@player_cards) > total(@dealer_cards)
    display_player_total(@player_cards)
    display_dealer_total(@dealer_cards)
    puts "Congratulations, you win!"
  else
    display_player_total(@player_cards)
    display_dealer_total(@dealer_cards)
    puts "Sorry, the dealer wins!"
  end
end

def player_turn
  puts "It's your turn:"
  
  loop do
    puts "You can hit another card or stay."
    puts "Press h or s."
    answer = gets.chomp

    deal_player_again(@current_deck) if answer.downcase.start_with?('h')
    display_player(@player_cards)
    display_player_total(total(@player_cards))
    player_over_twenty_one?(@player_cards)
    bust?(@player_cards)

    break if player_over_twenty_one?(@player_cards) == true
    break unless answer.downcase.start_with?('h')
  end
end

def dealer_turn
  puts "It's the dealer's turn"
  
  loop do
    display_dealer(@dealer_cards)

    if total(@dealer_cards) <= 17
      deal_dealer_again(@current_deck)
      puts "The dealer hits"
      # dealer_over_twenty_one?(@dealer_cards)
      bust?(@dealer_cards)
    elsif total(@dealer_cards).between?(17, 21)
      puts "The dealer stays"
      display_dealer(@dealer_cards)
      break
    elsif dealer_over_twenty_one?(@dealer_cards) == true
      break  
    end

  end
end

def game_loop
  loop do
    player_turn
    break if player_over_twenty_one?(@player_cards) == true
    dealer_turn
    break if dealer_over_twenty_one?(@dealer_cards) == true
    counting_winner
    break
  end
end

# Game starts
greeting
deal_player(@current_deck)
deal_dealer(@current_deck)
display_player(@player_cards)
display_dealer_first(@dealer_cards)
display_player_total(total(@player_cards))
game_loop