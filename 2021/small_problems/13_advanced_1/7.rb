# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

=begin
PROBLEM

Merge two sorted arrays without using the #sort method
Return a new array


Input: two arrays
Output: new merged array


DATA STRUCTURE

Two Arrays


ALGORITHM

- create variable for new merged array
- create counter variables for each array argument
- create a loop that iterates
  - compare current element at counter for each element
  - add smaller element to new merged array
  - increment counter for array when element from that array is added to new merged array
  break from loop once counter for both is equal to or greater than array size
- return new array

CODE
=end

def merge(array_one, array_two)
  merged = Array.new
  count_one, count_two = 0, 0

  loop do
    current_one = array_one[count_one]
    current_two = array_two[count_two]

    if current_two.nil? || (!current_one.nil? && current_one <= current_two)
      merged << current_one
      count_one += 1
    elsif current_one.nil? || (!current_two.nil? && current_two < current_one)
      merged << current_two
      count_two += 1
    end

    break if count_one >= array_one.size && count_two >= array_two.size
  end

  merged
end


def merge(array_one, array_two)
  merged = Array.new
  index_two = 0

  array_one.each do |value_one|
    while index_two < array_two.size && array_two[index_two] < value_one
      merged << array_two[index_two]
      index_two += 1
    end
    merged << value_one
  end

  merged.concat(array_two[index_two..-1])
end


# Examples:

p merge([1, 5, 9], [2, 6, 8]) # == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) # == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) # == [1, 4, 5]
p merge([1, 4, 5], []) # == [1, 4, 5]
