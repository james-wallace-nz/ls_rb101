# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(word)
  word == word.reverse
end

# Examples:

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

# Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array.

def palindrome_array?(array)
  array == array.reverse
end

puts palindrome_array?([1, 2, 2, 1]) == true
puts palindrome_array?([1, 2, 3, 4]) == false

# Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.

puts '-------'

def palindrome?(obj)
  p obj
  p obj.reverse
  obj == obj.reverse
end

puts palindrome?([1, 2, 2, 1]) == true
puts palindrome?([1, 2, 3, 4]) == false
