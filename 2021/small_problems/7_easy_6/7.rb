# Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

def halvsies(array)
  first = []
  second = []
  count = 0
  while count < array.size
    if count <= (array.size - 1) / 2
      first << array[count]
    else
      second << array[count]
    end
    count += 1
  end
  [first, second]
end

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first = array.slice(0, middle)
  second = array.slice(middle, array.size - middle)
  [first, second]
end

# Examples:
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
