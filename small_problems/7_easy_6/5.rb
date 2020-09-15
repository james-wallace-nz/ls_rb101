# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

def reverse(array)
  counter = -1
  new_array = []
  while counter >= -array.size
    new_array << array[counter]
    counter -= 1
  end
  new_array
end

# solution:

def reverse(array)
  new_array = []
  array.reverse_each do |element|
    new_array << element
  end
  new_array
end

# Examples:

puts reverse([1, 2, 3, 4]) == [4, 3, 2, 1]    # => true
puts reverse(%w[a b e d c]) == %w[c d e b a]  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                           # => [1, 3, 2]
p new_list = reverse(list)                 # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

puts '-----'

# An even shorter solution is possible by using either inject or each_with_object. Just for fun, read about these methods in the Enumerable module documentation, and try using one in your reverse method.

def reverse(array)
  array.each_with_object([]) do |element, obj|
    obj.unshift(element)
  end
end

puts reverse([1, 2, 3, 4]) == [4, 3, 2, 1]    # => true
puts reverse(%w[a b e d c]) == %w[c d e b a]  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                           # => [1, 3, 2]
p new_list = reverse(list)                 # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

puts '------'

def reverse(array)
  array.inject([], &:unshift)
end

puts reverse([1, 2, 3, 4]) == [4, 3, 2, 1]    # => true
puts reverse(%w[a b e d c]) == %w[c d e b a]  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                           # => [1, 3, 2]
p new_list = reverse(list)                 # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
