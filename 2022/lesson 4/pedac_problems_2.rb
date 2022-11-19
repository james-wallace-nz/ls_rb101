# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# - what is a substring
#   - each combination of strings from first to last character
#   - at least 2 characters long
# - what is a palindrome
#   - word same forward and reverse
#   - case sensitive
#  - will input always be string

# Input: string
# Output: array of palindrome substrings
# Rules:
#   Explicit:
#     - every substring palindrome
#     - palindromes are case senstive
#   Implicit:
#     - empty array if empty string
#     - empty array if no palindromes


# DATA STRUCTURES

# Array

# ALGORITHM

# SET palindromes to empty array
# SET substrings array based on return value of substrings method invocation
  # for starting index from 0 to second to last index position
    # for each substring length 2 until no substrings of that length
      # extract substring of indicated length starting at indicated indx position
    # end of inner loop
  # end of outer loop
# LOOP through all sub-strings in string parameter
#   IF sub-string is equal to sub-string reversed then append to palindromes array
# RETURN palindromes array

# SET result to empty array
# SET starting_index to 0
# LOOP iterate over starting_index from 0 to length of string - 2
#   SET num_chars = 2 for length of substring
#   LOOP iterate over num_chars from 2 to string.length - starting_index
#     extract substring of length num_chars from string starting at starting_index
#     append substring to result array
#     INCREMENT num_chars by 1
#   END loop
#   INCREMENT starting_index by 1
# END loop
# RETURN result array

# CODE:

# def substrings(string)
#   result = []
#   starting_index = 0

#   starting_index.upto(string.length - 2) do |start|
#     num_chars = 2
#     num_chars.upto(string.length - start) do |length|
#       sub_string = string[start, length]
#       puts sub_string
#       result << sub_string
#     end
#   end
#   result
# end

def substrings(string)
  substrings = []
  start_index = 0
  loop do
    break if start_index > string.length - 2
    length = 2

    loop do
      break if length > string.length - start_index
      sub_string = string[start_index, length]
      # puts sub_string
      substrings << sub_string
      length += 1
    end

    start_index += 1
  end

  substrings
end

# p substrings('halo')

def is_palindrome?(string)
  string == string.reverse
end

def palindrome_substrings(string)
  palindromes = []
  substrings = substrings(string)
  substrings.each do |sub_string|
    palindromes << sub_string if is_palindrome?(sub_string)
  end
  palindromes
end

# EXAMPLES:

puts palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
puts palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
puts palindrome_substrings("palindrome") == []
puts palindrome_substrings("") == []