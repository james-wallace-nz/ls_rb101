# Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

def halvsies(array)
  mid_index = array.size.odd? ? (array.size) / 2 : array.size / 2 - 1
  first_half, second_half = array[0..mid_index], array[(mid_index + 1)...array.size]
end

def halvsies(array)
  mid_index = array.size.odd? ? (array.size) / 2 : array.size / 2 - 1
  first = []
  second = []
  index = 0
  while index < array.size
    if index <= mid_index
      first << array[index]
    else
      second << array[index]
    end
    index += 1
  end
  [first, second]
end

# solution:

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)

  # first_half = array.slice(0...middle)
  # second_half = array.slice(middle..(array.size - 1))

  [first_half, second_half]
end

# Examples:

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]


# Can you explain why our solution divides array.size by 2.0 instead of just 2?

# Dividing by 2 is integer division, which will always round down to an integer. For odd numbers we need to round up, so dividing by a float retains the decimals

# This is but one way to solve this problem. What solution did you end up with? Was it similar or entirely different?
