# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# def oddities(array)
#   new_array = []
#   # array.each_with_index do |e, idx|
#   #   new_array << e if idx.even?
#   # end
#   index = 0
#   while index < array.size
#     new_array << array[index]
#     index += 2
#   end
#   new_array
# end

def oddities(array)
  count = -1
  array.select do |e|
    count += 1
    count.even?
  end
end

# Examples:
puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

