require 'pry'

deck = [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['H', 'A'],
['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K'], ['D', 'A'],
['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A'],
['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A']]

@current_deck = deck
@player_cards = []
@dealer_cards = []

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

def display_cards(p_cards, d_cards)
  puts "Your cards are #{p_cards}"
  puts "The dealers card is #{d_cards.first}"
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

# def display_dealer(cards)
#   puts "The value of the dealer's visible card is #{total(@dealer_cards)}."
# end

def deal_player_again(cards)
  @player_cards << @current_deck.sample(1)
  @current_deck -= @player_cards
  return @player_cards
end
  
def deal_dealer_again(cards)
  @dealer_cards << @current_deck.sample(1)
  @current_deck -= @dealer_cards
  return @dealer_cards
end

def player_turn
  puts "It's your turn:"
  
  loop do
    puts "You can hit another card or stay."
    puts "Press h or s."
    answer = gets.chomp

    deal_player_again(@current_deck) if answer.downcase.start_with?('h')
    display_cards(@player_cards, @dealer_cards)
    display_player_total(total(@player_cards))

    break unless answer.downcase.start_with?('h')
  end
end

puts "Welcome to Twenty-One"
deal_player(@current_deck)
deal_dealer(@current_deck)
display_cards(@player_cards, @dealer_cards)
display_player_total(total(@player_cards))
# display_dealer(total(@dealer_cards))
player_turn
