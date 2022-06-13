# 21.rb

# 1)
# How can make this without using instance variables (@)?
# Why is this important?


# 2)
# Question solved, the extra bracket leads to 'nil' which adds 10 points in the total method. 
cards1 = [["C", "K"], ["C", "9"], ["S", "2"]]
cards2 = [["C", "K"], ["C", "9"], [["S", "2"]]]

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

p total(cards1)
p total(cards2)

p cards1.map { |card| card[1] } 
# => ["K", "9", "2"]
p cards2.map { |card| card[1] }
# => ["K", "9", nil]
