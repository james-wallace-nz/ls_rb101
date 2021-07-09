# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise:

# input: string
# output: array containing all substrings ordered by starting character
# algo:
# 1. create a substring array
# 2. iterate through characters in the string starting at 0 and ending at string.size - 1
# 3. iterate through string from 0 to string.size - 1
# 3. slice from 0 to current index and add to substrings array
# 4. return substring array

def substrings(string)
  substrings = []

  0.upto(string.size - 1) do |starting_index|
    substring = string[starting_index..-1]
    0.upto(substring.size - 1) do |index|
      substrings << substring[0..index]
    end
  end

  substrings
end

# Examples:
puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
