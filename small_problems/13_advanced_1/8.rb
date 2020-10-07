# Sort an array of passed in values using merge sort. You can assume that this array may contain only one type of data. And that data may be either all numbers or all strings.

# Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays, then recombining those nested sub-arrays in sorted order. It is best shown by example. For instance, let's merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]

# We then work our way back to a flat array by merging each pair of nested sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]

# input: array of strings or numbers
# output: sorted array of original input array elements

# algorithm:
# recursively break down into smallest nested arrays
# return to next level up by recursively comparing each adjacent nested array - use merge from ex7



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

def merge_sort(array)
  return array if array.size == 1
  size = array.size
  middle = size / 2

  left = array.slice(0...middle)
  right = array.slice(middle..-1)
  left = merge_sort(left)
  right = merge_sort(right)
  merge(left, right)
end

# Examples:

# p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]

# p merge_sort([5, 3]) == [3, 5]

# p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]

# p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

puts '---'

# Every recursive algorithm can be reworked as a non-recursive algorithm. Can you write a method that performs a non-recursive merge sort?

# input: array
# output: sorted array

# break down into smallest nested arrays
#   loop through each even element in array and split even + next odd into new array.
#   loop middle times

# return to next level up by comparing each adjacent nested array - use merge from ex7

def merge_sort(array)
  result = array.map { |e| [e] }

  result
end

p merge_sort([9, 5, 7, 1]) # == [1, 5, 7, 9]

p merge_sort([5, 3]) # == [3, 5]

p merge_sort([6, 2, 7, 1, 4]) # == [1, 2, 4, 6, 7]

p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) # == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) # == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]