# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(array)
  first = array.shift
  array.push(first)
end

# solution:

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# Example:

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                   # => true

puts '-----'

# Write a method that rotates a string instead of an array. Do the same thing for integers. You may use rotate_array from inside your new method.

def rotate_int(int)
  digits = int.to_s.chars
  rotate_array(digits).join('').to_i
end

def rotate_string(string)
  chars = string.chars
  rotate_array(chars).join('')
end

p rotate_int(735291) == 352917
p rotate_string('abc') == 'bca'
p rotate_string('a') == 'a'

x = 1234
p rotate_int(x) == 2341   # => true
x == 1234                   # => true
