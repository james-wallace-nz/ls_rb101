# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

def interleave(one, two)
  new_array = []
  count = 0
  while count < one.size
    new_array << one[count]
    new_array << two[count]
    count += 1
  end
  new_array
end

def interleave(one, two)
  one.zip(two).flatten
end

# Example:
puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
