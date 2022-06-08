# practice problem 1
arr = ['10', '11', '9', '7', '8']

p arr_int = arr.map {|str| str.to_i}
p arr_int.sort!.reverse!
p arr = arr_int.map {|int| int.to_s}

# practice problem 2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p books.sort_by {|k| k[:published]}

# practice problem 3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

p arr1[2][1][3]
p arr2[1][:third][0]
p arr3[2][:third][0][0]
p hsh1["b"][1]
p hsh2[:third].keys[0]

# practice problem 4

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1]=4
p arr1

arr2[2]=4
p arr2

p hsh1[:first][2][0]=4
p hsh1

p hsh2[['a']][:a][2]=4
p hsh2

# practice problem 5

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0
munsters.each_value do |nested_key|
  total_male_age += nested_key["age"] if nested_key["gender"] == "male"
end

p total_male_age

# practice problem 6

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |key, value|
  puts "#{key} is a #{value["age"]}-year-old #{value["gender"]}."
end

# practice problem 8
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.map do |string|
    string.chars.map do |element|
      puts element if element == "a" || element == "e" || element == "i" || element == "o" || element == "u"
    end
  end
end

# practice problem 9

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = []
arr.map {|elem| new_arr << elem.sort.reverse}
p new_arr

# practice problem 10

array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
array.map do |hsh|
  incremented_hash = {}
  hsh.map do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

# practice problem 11
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
arr.map do |element|
  element.reject! {|num| num % 3 != 0}
end
p arr

# practice problem 12

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = arr.map.with_object({}) do |value, hash|
  hash[value[0]] = value[1]
end

p hsh

# practice problem 13

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

# practice problem 14

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |key, value|
  if value[:type] == "fruit"
    value[:colors].map do |color|
      color.capitalize
    end
  elsif
    value[:type] == "vegetable"
    value[:size].upcase
  end
end


# practice problem 15

arr = [{a: [1, 2, 3]},
{b: [2, 4, 6], c: [3, 6], d: [4]},
{e: [8], f: [6, 10]}]

arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end

# practice problem 16

def uuid
  arr = []
  arr1 = ('a'..'f').to_a + ("0".."9").to_a
  8.times {arr << arr1.sample}
  arr << "-"
  4.times {arr << arr1.sample}
  arr << "-"
  4.times {arr << arr1.sample}
  arr << "-"
  4.times {arr << arr1.sample}
  arr << "-"
  12.times {arr << arr1.sample}
  arr << "-"
  p arr.join("")
end

uuid

def generate_UUID
  characters = []
  (0..9).each {|digit| characters << digit.to_s}
  ('a'..'f').each {|digit| characters << digit}

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times {uuid += characters.sample}
    uuid += '-' unless index >= sections.size - 1
      
    end
  uuid
end

p generate_UUID
