# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# def oddities(array)
#   array.select.with_index { |e, index| index.even? }
# end

def oddities(array)
  new_array = []
  index = 0
  while index < array.size
    new_array << array[index] if index.even?
    index += 1
  end
  new_array
end

# Examples:

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

# Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.

# Try to solve this exercise in at least 2 additional ways.

def evens(array)
  odd_array = []
  array.each_with_index do |e, index|
    odd_array << e if index.odd?
  end
  odd_array
end

puts evens([2, 3, 4, 5, 6]) == [3, 5]
puts evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts evens(['abc', 'def']) == ['def']
puts evens([123]) == []
puts evens([]) == []