# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

def multiply_list(array_one, array_two)
  results = []
  index = 0
  loop do
    results << array_one[index] * array_two[index]
    index += 1
    break if index == array_one.size
  end
  results
end

def multiply_list(array_one, array_two)
  results = []
  array_one.each_with_index do |num, idx|
    results << num * array_two[idx]
  end
  results
end

# Examples:

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

puts '------'

# The Array#zip method can be used to produce an extremely compact solution to this method. Read the documentation for zip, and see if you can come up with a one line solution (not counting the def and end lines).

def multiply_list(list_one, list_two)
  list_one.zip(list_two).map { |nested_array| nested_array[0] * nested_array[1] }
  list_one.zip(list_two).map { |nested_array| nested_array.inject(&:*) }
end


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
