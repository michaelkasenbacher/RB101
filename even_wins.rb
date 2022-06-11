# A game of chance to be played against the computer. Whoever wins 5 times is the overall winner. 

# Questions:
# 1) if I comment "+= 1" in who_wins? and uncomment keep_score I get strange results: 
# instead of puts "the number is ... " and "x wins" once, I get puts 3 times but only the last time
# registers in score. 

# 2) can this be done without the use of instance variables? The reason why I used instance variables was
# that I got this error message otherwise: "undefined local variable for main:Object (NameError)" 

def get_numbers
  puts "Enter a number (1-100) to play."
  @player_number = gets.to_i
  @computer_number = (1..100).to_a
end

def who_wins?
  sum = @player_number + @computer_number.sample
  if sum.even?
    puts "The number is #{sum}"
    puts "Player wins!"
    @player_wins += 1
  else
    puts "The number is #{sum}"
    puts "Computer wins!"
    @computer_wins += 1
  end
end

# def keep_score
#   @player_wins += 1 if who_wins? == @player_wins
#   @computer_wins += 1 if who_wins? == @computer_wins
# end

def score
  puts "You have won #{@player_wins} times and computer has won #{@computer_wins} times."
end

def overall_winner
  if @player_wins == 5
    puts "You are the overall winner!"
  elsif @computer_wins == 5
    puts "Computer is the overall winner!"
  end
end

loop do
  @player_wins = 0
  @computer_wins = 0

  loop do
    get_numbers
    who_wins?
    # keep_score
    score
    overall_winner
    if @player_wins == 5
      puts "Congratulations!"
      break
    elsif @computer_wins == 5
      puts "Sorry you lost."
      break
    end
  end

  puts "Do you want to play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end