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

# input: array of elements
# output: sorted array of elements
# algorithm:
# iterate through each pair of elements and merge them
  # if last pair is one sided only take first element


# def merge(new_array, left, mid, right)
#   n1 = mid - left + 1
#   n2 = right - mid
#   left_arr = [] * n1
#   right_arr = [] * n2

#   for i in 0..n1
#     left_arr[i] = new_array[left + 1]
#   end

#   for i in 0..n2
#     right_arr[i] = new_array[mid + i + 1]
#   end

#   p left_arr
#   p right_arr
#   p '---'

#   i, j, k = 0, 0, left

#   while i < n1 && j < n2
#     if left_arr[i] > right_arr[j]
#       new_array[k] = right_arr[j]
#       j += 1
#     else
#       new_array[k] = left_arr[i]
#       i += 1
#     end
#     k += 1
#   end

#   while i < n1
#     new_array[k] = left_arr[i]
#     i += 1
#     k += 1
#   end

#   while j < n2
#     new_array[k] = right_arr[j]
#     j += 1
#     k += 1
#   end

#   new_array
# end

# def merge_sort(array)
#   new_array = array
#   current_size = 1
#   max_index = array.size - 1

#   while current_size < max_index
#     left = 0
#     while left < max_index
#       mid = [left + current_size - 1, max_index].min
#       right = if 2 * current_size + left - 1 > max_index
#                 max_index
#               else
#                 2 * current_size + left - 1
#               end

#       new_array = merge(new_array, left, mid, right)
#       left += current_size * 2
#     end
#     current_size *= 2
#   end
#   new_array
# end

# a = [12, 11, 13, 5, 6, 7]
# p merge_sort(a)

def merge(new_array, temp, frm, mid, to)
  k = frm
  i = frm
  j = mid + 1

  puts "frm: #{frm}, mid: #{mid}, to: #{to}"
  puts "k: #{k}, i: #{i},j: #{j}"

  while i <= mid && j <= to
    p "#{new_array[i]} : #{new_array[j]}"
    if new_array[i] < new_array[j]
      temp[k] = new_array[i]
      i += 1
    else
      temp[k] = new_array[j]
      j += 1
    end
    p temp
    k += 1
  end

  while i < new_array.size && i <= mid
    puts "mop up:  i: #{i}, k: #{k}, #{new_array.size}, #{mid}"
    temp[k] = new_array[i]
    k += 1
    i += 1
  end

  p "temp: #{temp}"

  (frm...(to + 1)).each do |l|
    new_array[l] = temp[l]
  end

  new_array
end

def merge_sort(array)
  low = 0
  high = array.size - 1                                                # 6
  new_array = array.clone
  temp = new_array.clone

  current_size = 1
  while current_size <= high - low                                                # 1 <= (6 - 0)
    puts "current size: #{current_size}\n\n"
    (low...high).step(2 * current_size).each do |i|                               # i in (0...6).step(2)  0, 2, 4 then 0, 4 then 0
      frm = i                                                                     # 0..5                  0, 2, 4 then 0, 4 then 0
      mid = i + current_size - 1                                                  # 0 + 1 - 1 => 0, 2 + 1 - 1 => 2, 4 + 1 - 1 => 4  then 0 + 2 - 1 => 1, 4 + 2 - 1 => 5 0 + 4 - 1 => 3
      to = [i + 2 * current_size - 1, high].min                                   # [0 + 2 * 1 - 1, 6].min = [1, 6].min => 1
      new_array = merge(new_array, temp, frm, mid, to)
      p new_array
      puts "\n\n"
    end
    current_size *= 2                                                             # 1, 2, 4, 6
  end
  new_array
end

a = [5, 7, -9, 3, -4, 2, 8]
p merge_sort(a)
# p a
# https://www.techiedelight.com/iterative-merge-sort-algorithm-bottom-up/

# p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# [9, 5, 7, 1]
# [[9, 5],[7, 1]]

# p merge_sort([5, 3]) == [3, 5]

# p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]

# merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) # == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# 0
# array
# ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']                                    split[0..6]

# 1
# array.each
# [['Sue', 'Pete', 'Alice'], ['Tyler', 'Rachel', 'Kim', 'Bonnie']

# [
  # ['Sue', 'Pete', 'Alice'],                                                                     split[0]
  # ['Tyler', 'Rachel', 'Kim', 'Bonnie']                                                          split[1]
# ]

# 2
# array.each.each
# [[['Sue'], ['Pete', 'Alice']], [['Tyler', 'Rachel'], ['Kim', 'Bonnie']]

# [
#   [                                                                                             spilt[0]
#     ['Sue']                                                                                     [0]
#     ['Pete', 'Alice'],                                                                          [1]
#   ],
#   [                                                                                             spilt[1]
#     ['Tyler', 'Rachel'],                                                                        [0]
#     ['Kim', 'Bonnie']                                                                           [1]
#   ]
# ]

# 3
# [[[['Sue']], [['Pete'], ['Alice']]], [[['Tyler'], ['Rachel']], [['Kim'], ['Bonnie']]]

# [
#   [                                                                                             spilt[0]
#     [                                                                                                   [0]
#       ['Sue']                                                                                              [0]
#     ],
#     [                                                                                                   [1]
#       ['Pete'],                                                                                            [0]
#       ['Alice']                                                                                            [1]
#     ]
#   ],
#   [                                                                                             spilt[1]
#     [                                                                                                   [0]
#       ['Tyler'],                                                                                            [0]
#       ['Rachel']                                                                                            [1]
#     ],
#     [                                                                                                   [1]
#       ['Kim'],                                                                                              [0]
#       ['Bonnie']                                                                                            [1]
#     ]
#   ]
# ]

# p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
