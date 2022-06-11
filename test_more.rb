# deck1 = {
#   :hearts => {:two => 2, :three => 3, :four => 4, :five => 5, :six => 6, :seven => 7, :eight => 8, :nine => 9, :ten => 10, :jack => 10, :queen => 10, :king => 10, :ace => [1, 11]},
#   :diamonds => {:two => 2, :three => 3, :four => 4, :five => 5, :six => 6, :seven => 7, :eight => 8, :nine => 9, :ten => 10, :jack => 10, :queen => 10, :king => 10, :ace => [1, 11]},
#   :clubs => {:two => 2, :three => 3, :four => 4, :five => 5, :six => 6, :seven => 7, :eight => 8, :nine => 9, :ten => 10, :jack => 10, :queen => 10, :king => 10, :ace => [1, 11]},
#   :spades => {:two => 2, :three => 3, :four => 4, :five => 5, :six => 6, :seven => 7, :eight => 8, :nine => 9, :ten => 10, :jack => 10, :queen => 10, :king => 10, :ace => [1, 11]}
# }

# deck2 = {
#   :hearts_two => 2, :hearts_three => 3, :hearts_four => 4, :hearts_five => 5, :hearts_six => 6, :hearts_seven => 7, :hearts_eight => 8, :hearts_nine => 9, :hearts_ten => 10, :hearts_jack => 10, :hearts_queen => 10, :hearts_king => 10, :hearts_ace => [1, 11],
#   :diamonds_two => 2, :diamonds_three => 3, :diamonds_four => 4, :diamonds_five => 5, :diamonds_six => 6, :diamonds_seven => 7, :diamonds_eight => 8, :diamonds_nine => 9, :diamonds_ten => 10, :diamonds_jack => 10, :diamonds_queen => 10, :diamonds_king => 10, :diamonds_ace => [1, 11],
#   :clubs_two => 2, :clubs_three => 3, :clubs_four => 4, :clubs_five => 5, :clubs_six => 6, :clubs_seven => 7, :clubs_eight => 8, :clubs_nine => 9, :clubs_ten => 10, :clubs_jack => 10, :clubs_queen => 10, :clubs_king => 10, :clubs_ace => [1, 11],
#   :spades_two => 2, :spades_three => 3, :spades_four => 4, :spades_five => 5, :spades_six => 6, :spades_seven => 7, :spades_eight => 8, :spades_nine => 9, :spades_ten => 10, :spades_jack => 10, :spades_queen => 10, :spades_king => 10, :spades_ace => [1, 11]
# }

# deck_arr = [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5']]
# hand1 = ['H', '2']
# hand2 = [['H', '2'], ['H', '5']]

# # p deck_arr.delete(hand1)
# # p deck_arr

# p deck_arr.difference(hand2)
# p deck_arr

# deck = {:hearts_two => 2, :hearts_three => 3, :hearts_four => 4}
# hand = {:hearts_two => 2, :hearts_three => 3}

# p deck.difference(hand)
# p deck

# arr1 = [[1,1], [2,2], [3,3]]
# arr2 = [[1,1], [2,2]]

# p arr1.difference(arr2)
# p arr1

@dealer_cards = [[1,2], [3,4,]]

p @dealer_cards.first
p @dealer_cards[0]
