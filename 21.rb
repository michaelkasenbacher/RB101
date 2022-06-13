deck = [['Hearts', '2'], ['Hearts', '3'], ['Hearts', '4'], ['Hearts', '5'], ['Hearts', '6'], ['Hearts', '7'], ['Hearts', '8'], ['Hearts', '9'], ['Hearts', '10'], ['Hearts', 'Jack'], ['Hearts', 'Queen'], ['Hearts', 'King'], ['Hearts', 'Ace'],
['Diamonds', '2'], ['Diamonds', '3'], ['Diamonds', '4'], ['Diamonds', '5'], ['Diamonds', '6'], ['Diamonds', '7'], ['Diamonds', '8'], ['Diamonds', '9'], ['Diamonds', '10'], ['Diamonds', 'Jack'], ['Diamonds', 'Queen'], ['Diamonds', 'King'], ['Diamonds', 'Ace'],
['Clubs', '2'], ['Clubs', '3'], ['Clubs', '4'], ['Clubs', '5'], ['Clubs', '6'], ['Clubs', '7'], ['Clubs', '8'], ['Clubs', '9'], ['Clubs', '10'], ['Clubs', 'Jack'], ['Clubs', 'Queen'], ['Clubs', 'King'], ['Clubs', 'Ace'],
['Spades', '2'], ['Spades', '3'], ['Spades', '4'], ['Spades', '5'], ['Spades', '6'], ['Spades', '7'], ['Spades', '8'], ['Spades', '9'], ['Spades', '10'], ['Spades', 'Jack'], ['Spades', 'Queen'], ['Spades', 'King'], ['Spades', 'Ace']]

@current_deck = deck
@player_cards = []
@dealer_cards = []

def prompt(msg)
  puts <<-DISTANCE_MARKER

#{msg}
DISTANCE_MARKER
end


def greeting
  system 'clear'
  prompt "Welcome to Twenty-One!"
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
  prompt "Your cards are #{cards}."
end

def display_dealer_first(cards)
  prompt "The dealer's first card is #{cards.first}."
end

def display_dealer(cards)
  prompt "The dealer's cards are #{cards}."
end

def total(cards)
  # cards = [['Hearts', '3'], ['Spades', 'Queen'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'Ace'
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == 'Ace' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def display_player_total(cards)
  prompt "The value of your cards is #{total(@player_cards)}."
end

def display_dealer_total(cards)
  prompt "The value of the dealer's cards is #{total(@dealer_cards)}."
end

# def display_dealer_first(cards)
#   prompt "The value of the dealer's visible card is #{total(@dealer_cards)}."
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
    prompt "Sorry, you go bust!"
  elsif dealer_over_twenty_one?(@dealer_cards) == true
    prompt "The dealer goes bust! You win!"
  end
end

def counting_winner
  if total(@player_cards) > total(@dealer_cards)
    display_player_total(@player_cards)
    display_dealer_total(@dealer_cards)
    prompt "Congratulations, you win!"
  else
    display_player_total(@player_cards)
    display_dealer_total(@dealer_cards)
    prompt "Sorry, the dealer wins!"
  end
end

def player_turn
  prompt "It's your turn:"
  
  loop do
    prompt "You can hit another card or stay."
    prompt "Press 'h' to hit or 's' to stay."
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
  prompt "It's the dealer's turn"
  
  loop do
    display_dealer(@dealer_cards)

    if total(@dealer_cards) <= 17
      deal_dealer_again(@current_deck)
      prompt "The dealer hits"
      # dealer_over_twenty_one?(@dealer_cards)
      bust?(@dealer_cards)
    elsif total(@dealer_cards).between?(17, 21)
      prompt "The dealer stays"
      display_dealer(@dealer_cards)
      break
    elsif dealer_over_twenty_one?(@dealer_cards) == true
      break  
    end

  end
end

def turn_loop
  loop do
    player_turn
    break if player_over_twenty_one?(@player_cards) == true
    dealer_turn
    break if dealer_over_twenty_one?(@dealer_cards) == true
    counting_winner
    break
  end
end

def game_loop
  loop do
    greeting
    deal_player(@current_deck)
    deal_dealer(@current_deck)
    display_player(@player_cards)
    display_dealer_first(@dealer_cards)
    display_player_total(total(@player_cards))
    turn_loop


    prompt "Do you want to play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end

# Game starts
game_loop