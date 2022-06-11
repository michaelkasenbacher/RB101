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