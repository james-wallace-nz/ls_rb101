# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

# input: string
# output: substrings in an array
# substring is each sequence of characters starting from first character
# # algo:
# 1. create a new array
# 2. increment through string characters
# 3. slice from index 0 to current iteration index and add that to new array
# 4. return new array

def leading_substrings(string)
  substrings = []
  1.upto(string.size) do |idx|
    substrings << string[0, idx]
  end
  substrings
end

def leading_substrings(string)
  substrings = []
  0.upto(string.size - 1) do |idx|
    substrings << string[0..idx]
  end
  substrings
end

# Examples:
puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']