# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# Problem

# return same string
  # - return a new string
# uppercase palindromes

# - what is a palindrome? word reads the same forward and backward
# - uppercase aren't changed
# - empty string is unchanged
# - are all inputs strings?
# - is palindrome case sensitive? yes

# Input: string
# Output: new string
# Rules:
#   Explicit:
#     - every palindrome in string must be converted to uppercase
#     - palindromes are case senstive
#   Implicit:
#     - returned string shouldn't be same string object
#     - empty string should return empty string

# Data Structure

# String

# Algorithm

# SET new_array to empty array
# SET words array to string split into words
# LOOP over words array
#   For each word, check if palindrome
#   IF palindrome, uppercase the word and append to new_array
#   Else append word to new_array
# JOIN new_array elements with space and return

# Code

def is_palindrome?(string)
  string == string.reverse
end

def change_me(string)
  new_array = []
  words = string.split
  words.each do |word|
    if is_palindrome?(word)
      new_array << word.upcase
    else
      new_array << word
    end
  end
  new_array.join(' ')
end

# Examples

puts change_me("We will meet at noon") == "We will meet at NOON"
puts change_me("No palindromes here") == "No palindromes here"
puts change_me("") == ""
puts change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"