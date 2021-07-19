# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# Example:
puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

# Write a method that rotates a string instead of an array. Do the same thing for integers. You may use rotate_array from inside your new method.

def rotate_string(str)
  chars = str.chars
  rotated = rotate_array(chars)
  rotated.join
end

def rotate_integer(int)
  rotated = rotate_string(int.to_s)
  rotated.to_i
end

y = 'string'
puts rotate_string(y) == 'trings'   # => true
y == 'string'                 # => true



z = 253
puts rotate_integer(z) == 532   # => true
z == 253
