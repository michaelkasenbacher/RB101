Medium 1

def indent_10_times(string)
  10.times {puts string.insert(0, "\t")}
end

indent_10_times("The Flintstones Rock!")

Medium 2

puts "the value of 40 + 2 is " + (40 + 2).to_s

Medium 3

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

puts factors(16)

Medium 5

def fib(first_num, second_num)
  limit = 15
  
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"