# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

def interleave(array_one, array_two)
  new_array = []
  array_one.each_with_index do |e, index|
    # new_array << e
    # new_array << array_two[index]
    new_array << e << array_two[index]
  end
  new_array
end

def interleave(array_one, array_two)
  new_array = []
  index = 0
  while index < array_one.size
    new_array << array_one[index]
    new_array << array_two[index]
    index += 1
  end
  new_array
end

# Example:

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

puts '-------'

# Take a few minutes to read about Array#zip. #zip doesn't do the same thing as interleave, but it is very close, and more flexible.

def interleave(array_one, array_two)
  array_one.zip(array_two).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

puts '-------'

# In fact, interleave can be implemented in terms of zip and one other method from the Array class. See if you can rewrite interleave to use zip.

def interleave(array_one, *arrays)
  new_array = []
  array_one.each_with_index do |e, index|
    new_array << [e]
    arrays.each do |array|
      new_array[index] << array[index]
    end
  end
  new_array
end

a = [4, 5, 6]
b = [7, 8, 9]
p interleave([1, 2, 3], a, b) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p interleave([1, 2], a, b)    == [[1, 4, 7], [2, 5, 8]]
p interleave(a, [1, 2], [8])  == [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
