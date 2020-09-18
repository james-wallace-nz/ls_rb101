# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise:

# input: string
# output: array of all substring combinations
# algorithm:
# 1. outer loop through each character in string
# 2. for each character loop through each character in substring of index 0 to current character

def leading_substrings(string)
  substrings = []
  0.upto(string.size - 1) do |index|
    substrings << string[0..index]
  end
  substrings
end

def substrings(string)
  sub_substrings = []
  0.upto(string.size - 1) do |index|
    # sub_substrings << leading_substrings(string[index..(string.size - 1)])
    sub_substrings.concat(leading_substrings(string[index..-1]))
  end
  # sub_substrings.flatten
  sub_substrings
end

# solution:

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

# Examples:

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
