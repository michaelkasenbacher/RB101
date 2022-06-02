# palindromes PEDAC

input
	string

output
	all substrings which are palindromes

rules to follow
	
explicit requirements
	case sensitive
	

implicit requirements
	2 chars lengths
	empty strings return empty strings
	returned string not same string 

algorithm / pseudocode

1. substrings method
	
    # overview
  string to new array
	with all chars that have 2 chars minimum length 

	loop
	while [0..1] to [0..-1] to [-2..-1]


    # more detail
def substrings(string)

	result = []
	starting_index = 0

	while starting_index is lower/equal to string_length
		minimum_length = 2
		while minimum_length is lower/equal to string_length minus starting_index
		substring = string_slice (from starting_index to minimum_length)
		result << substring
		minimum_length +=1
		end
		starting_index +=1
	end
	result
	end



2. palindrome_select
	palindromes []
	compare each chars to chars.reverse
	if same then add chars to palindromes []


# SELECT FRUIT
def select_fruit(food)
  food.select {|key, value| value == "Fruit"}
end


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# DOUBLE MY NUMBERS
def double_numbers(numbers)
  numbers.map! {|num| num * 2}
end

p my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers # => [2, 8, 6, 14, 4, 12]

# DOUBLE NUMBER IF INDEX IS ODD
def double_numbers(numbers)
  numbers.map!.with_index {|num, idx| p (num * 2) if idx.odd?}
end

p my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers

# GENERAL SELECT

def select_fruit(produce, selection)
  produce.select {|key, value| value == selection}
end


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce, "Fruit")
p select_fruit(produce, "Meat")

# MULTIPLY

def multiply(numbers, multiplier)
  numbers.map {|num| num * multiplier}
end


my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

# COUNT CHARACTER
def select_letter(question, letter)
  p question.count(letter)
end

question = 'How many times does a particular character appear in this sentence?'
select_letter(question, 'a') 
select_letter(question, 't')
select_letter(question, 'z')

# practice problem 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstone_with_index = flintstones.map.with_index {|name, index| [name, index]}
p flintstone_with_index.to_h

# practice problem 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sum

# practice problem 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.delete_if {|key, value| value > 100}

# practice problem 4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.min_by {|key, value| value }

# practice problem 5

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

p flintstones.find_index {|name| name.start_with?("Be")}

# practice problem 6

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

p flintstones.map {|name| name.slice(0,3)}

# practice problem 7

statement = "The Flintstones Rock"
statement_array = statement.chars
statement_tally = statement_array.tally

# practice problem 9

words = "the flintstones rock"

array = words.split
words = array.map! {|word| word.capitalize}
  .join(" ")

p words

# practice problem 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
munsters.map {|name, details| details["age_group"] = "kid"}

munsters.map do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters