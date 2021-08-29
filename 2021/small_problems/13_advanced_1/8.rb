# Sort an array of passed in values using merge sort. You can assume that this array may contain only one type of data. And that data may be either all numbers or all strings.

# Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays, then recombining those nested sub-arrays in sorted order. It is best shown by example. For instance, let's merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]

# We then work our way back to a flat array by merging each pair of nested sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]


=begin
PROBLEM
Sort an array of numbers or strings
Merge sort is recursive - it breaks down the array elements into nested sub-arrays then recombines them in sorted order

Input: Array of integers/floats or strings
Output: new sorted array of integers or strings


DATA STRUCTURE

Array
Numbers - Integers or Floats
Strings


ALGORITHIM

High-level:
- iterate through array and break down into sub-arrays until each element is in its own sub-array
- iterate through pairs of element sub-arrays and recombine in sorted order using `merge` from exercise 7
- return sorted array

Detail:

1) Break array argument into element sub-arrays recursively
  if array.size == 1 then return array
  array_two variable equal to first half of array
  array_two variable equal to second half of array

  reassign array_one to return value of merge_sort(array_one)
  reassign array_two to return value of merge_sort(array_two)


2) recombine each consecutive pair using merge
  - return merge(array_one, array_two)


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

def merge_sort(array)
  return array if array.size == 1

  array_one = array[0...array.size / 2]
  array_two = array[array.size / 2..-1]

  array_one = merge_sort(array_one)
  array_two = merge_sort(array_two)

  return merge(array_one, array_two)
end

# Examples:

# [[6, 2], [7, 1, 4]]
# [ [ [6], [2] ], [ [7], [1, 4] ] ]
# [ [ [6], [2] ], [ [7], [ [1], [4] ] ] ]

# [ [2, 6], [ [7], [1, 4] ] ]
# [ [2, 6], [ 1, 4, 7 ] ]
# [ 1, 2, 4, 6, 7 ]



p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
