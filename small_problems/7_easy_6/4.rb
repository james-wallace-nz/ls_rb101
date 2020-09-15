# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

# input: array
# output: array with elements reversed (mutated)
# algorithm:
# 1. iterate through array elements
# 2. create holding array [ ] and prepend each element first array
# 3. iterate through array elements again and replace value with same index of holding arrray

def reverse!(array)
  holding_array = []
  array.each do |element|
    holding_array.unshift(element)
  end

  array.each_with_index do |element, index|
    array[index] = holding_array[index]
  end
  array
end

# solution

def reverse!(array)
  left_index = 0
  right_index = -1
  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end
  array
end

# Examples:

list = [1, 2, 3, 4]
result = reverse!(list)
puts result == [4, 3, 2, 1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

puts '-----'

list = %w[a b e d c]
puts reverse!(list) == ['c', 'd', 'e', 'b', 'a']
puts list == ['c', 'd', 'e', 'b', 'a']

puts '-----'

list = ['abc']
puts reverse!(list) == ['abc']
puts list == ['abc']

puts '-----'

list = []
puts reverse!(list) == []
puts list == []
