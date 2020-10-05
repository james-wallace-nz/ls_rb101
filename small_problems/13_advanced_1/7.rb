# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

# input: two sorted arrays
# output: one sorted array

# number of elements in each array
# current element index in each array
# compare value of current element in each array
# add smaller or both to result array
# increment up one or both

def merge(arr_one, arr_two)
  size_one = arr_one.size
  size_two = arr_two.size
  current_one = 0
  current_two = 0
  result = []

  until current_one == size_one && current_two == size_two
    value_one = arr_one[current_one]
    value_two = arr_two[current_two]

    if current_one == size_one
      result << value_two
      current_two += 1
    elsif current_two == size_two
      result << value_one
      current_one += 1
    elsif value_one < value_two
      result << value_one
      current_one += 1
    elsif value_two < value_one
      result << value_two
      current_two += 1
    else
      result << value_one << value_two
      current_one += 1
      current_two += 1
    end
  end

  result
end

# solution:

def merge(array1, array2)
  index2 = 0
  result = []
  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
      end
    result << value
  end

  result.concat(array2[index2..-1])
end

# Examples:

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

# 0..2
# 0..1
# a = 0
# b = 0

# a[0] <=> b[0]
# 1 <=> 2
# 1

# a = 1
# a[1] <=> b[0]
# 1 <=> 2
# 1

# a = 2
# a[2] <=> b[0]
# 3 <=> 2

# [1, 1, 2, 5, 9]
#       [2, 2, 2, 11]

# a < b   a += 1
# b < a   b += 1
# a == b  a,b += 1
