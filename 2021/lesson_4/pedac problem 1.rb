# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Code

def palindrome?(string)
  string == string.reverse
end

def palindrome_substrings(string)
  palindromes = []
  0.upto(string.size - 2) do |start_char|
    2.upto(string.size - start_char) do |length|

      substring = string[start_char, length]
      palindromes.push(substring) if palindrome?(substring)
    end
  end
  palindromes
end


# Problem

# input: string
# output: array of all palindrome substrings

# Rules:
# explicit:
# - palindrome is a word that is the same forward and backwards
# - substring is a sequence of more than one character from the original string
# - palindrome is case sensitive

# implicit:
# - only strings as inputs
# - no palindromes or empty string returns empty array
# - do not mutate original string


# Test cases:

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
puts palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
puts palindrome_substrings("palindrome") == []
puts palindrome_substrings("") == []


# Data Structures

# array to hold palindromes


# Algorithm

# create empty array called palindromes
# create loop counting 'start_character' up from 0 to second to last character in string
# create loop counting up 'current_character' from 'start_character' to last character in the string
# substring equals start_character to 'current_character'
# check substring is a palindrome
  # if substring equals reverse of substring it is a palindrome
# if palindrome, add to 'palindrome' array
# return palindrome array
