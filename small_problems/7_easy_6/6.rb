# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

# input: two arrays
# output: one merged array
# algorithm:
# 1. new_array = array_one
# 2. iterate through array_two
# 3. add element to new_array unless new_array include? element
# 4. return new_array

def merge(array_one, array_two)
  new_array = array_one
  array_two.each do |element|
    new_array << element unless new_array.include?(element)
  end
  new_array
end

# solution:

def merge(array_one, array_two)
  array_one | array_two
end

# Example

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
