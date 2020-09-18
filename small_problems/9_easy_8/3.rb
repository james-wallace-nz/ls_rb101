# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

# input: string

# output: sorted array of substrings

# assumptions:
# string is only one word
# substrings are only from the first character in string

# algorithm:
# 1. set substrings to empty array
# 2. set chars as string split into characters
# 3. iterate through each character in chars array
# 4. create empty holding string
# 5. iterate through index 0 to current element pushing each to holding string
# 6. push holding string to substrings array
# 7. return substrings array


def leading_substrings(string)
  substrings = []
  chars = string.chars
  chars.each_index do |idx|
    substrings << chars[0..idx].join
  end
  substrings
end

# solution:

def leading_substrings(string)
  substrings = []
  0.upto(string.size - 1) do |index|
    substrings << string[0..index]
  end
  substrings
end

# Examples:

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
