# my solution to https://launchschool.com/lessons/a0f3cd44/assignments/18adce3e

collection = [1,2,3,4,5,1,33]

highest_value = collection[0]

  collection.map do |number|
    highest_value = number if number > highest_value
  end

puts highest_value 

# my solution to https://launchschool.com/lessons/a0f3cd44/assignments/18adce3e

def third_occurrence(string, element)
  index = (0 ... string.length).find_all { |i| string[i] == element }

  if index[2] 
    p index[2]
  else 
    p nil
  end
end

third_occurrence("axbxcdxex", "a")

# my solution to https://launchschool.com/lessons/a0f3cd44/assignments/18adce3e

def merge(arr1, arr2)
  new_array = []
  combined_arrays = arr1+arr2
  counter = 1

while counter <= combined_arrays.size
  if counter.odd?
    new_array << arr1.shift
 else
    new_array << arr2.shift
 end
 counter += 1
end

p new_array
end

merge([1,2,3], [4,5,6])