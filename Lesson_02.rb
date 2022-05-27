# CALCULATOR

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when 1
    "Adding"
  when 2
    "Subtracting"
  when 3
    "Multiplying"
  when 4
    "Dividing"
  end
end

prompt("Welcome to Calculator. Enter your name:")

name = ""
loop do
  name = gets.chomp
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do

  number1 = ""
  loop do
    prompt("What's the first number?")
    number1 = gets.to_f

    if valid_number?(number1)
      break
    else
      prompt("Please enter a valid number")
    end
  end

  number2 = ""
  loop do
    prompt("What's the second number?")
    number2 = gets.to_f

    if valid_number?(number2)
      break
    else
      prompt("Please enter a valid number")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ""
  loop do
    operator = gets.to_i
    if [1, 2, 3, 4].include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end 
  end
  
  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
    when 1
      number1 + number2
    when 2
      number1 - number2
    when 3
      number1 * number2
    when 4
      number1 / number2
    end

  prompt("The result is #{result}")
  
  prompt("Do you want to perform another calculation? Press 'Y' to continue")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')

end

prompt("Thank you for using the calculator. Good bye!")

# LOAN CALCULATOR

puts "Welcome to Loan Calculator"

puts "What is your loan amount in USD?"
loan_amount = gets.to_f

puts "What is your annual interest rate?"
apr = gets.to_f / 100

puts "What's the duration of your loan in years?"
loan_duration_years = gets.to_f

monthly_interest_rate = apr / 12.0
loan_duration_months = loan_duration_years * 12.0

monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

puts "Your montly payment is #{monthly_payment.round(2)} USD. Your loan duration is #{loan_duration_months} months and your monthly interest rate is #{monthly_interest_rate.round(3)}%"

#ROCK, PAPER, & SCISSORS

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
    (player == 'paper' && computer == 'rock') ||
    (player == 'scissors' && computer == 'paper')
    prompt("You won!")
  elsif (player == 'rock' && computer == 'paper') ||
    (player == 'paper' && computer == 'scissors') ||
    (player == 'scissors' && computer == 'rock')
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do

  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice")
      end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing")

# ROCK, PAPER, SCISSORS, LIZARD, SPOCK

VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

def display_results(player, computer)
  if (player == 'rock' && ['scissors', 'lizard'].include?(computer)) ||
    (player == 'paper' && ['rock', 'spock'].include?(computer)) ||
    (player == 'scissors' && ['paper', 'lizard'].include?(computer)) ||
    (player == 'lizard' && ['spock', 'paper'].include?(computer)) ||
    (player == 'spock' && ['rock', 'scissors'].include?(computer))
    prompt("You won!")
    
  elsif (player == 'rock' && ['paper', 'spock'].include?(computer)) ||
    (player == 'paper' && ['scissors', 'lizard'].include?(computer)) ||
    (player == 'scissors' &&['rock', 'spock'].include?(computer)) ||
    (player == 'lizard' && ['scissors', 'rock'].include?(computer)) ||
    (player == 'spock' && ['lizard', 'paper'].include?(computer))
    prompt("Computer won!")
    
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  puts("=> #{message}")
end

loop do

  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice")
      end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  
end

prompt("Thank you for playing")