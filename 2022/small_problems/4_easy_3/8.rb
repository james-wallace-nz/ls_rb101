# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(str)
  str == str.reverse
end

# Examples:

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

puts '---'

def palindrome_array?(array)
  array == array.reverse
end

# Examples:

puts palindrome_array?(['m', 'a', 'd', 'a', 'm']) == true
puts palindrome_array?(['M', 'a', 'd', 'a', 'm']) == false          # (case matters)
puts palindrome_array?(['m', 'a', 'd', 'a', 'm', ' ', 'i', "'", 'm', ' ', 'a', 'd', 'a', 'm']) == false # (all characters matter)
puts palindrome_array?([3, 5, 6, 6, 5, 3]) == true

puts '---'

def palindromic?(collection)
  collection == collection.reverse
end

# Examples:

puts palindromic?('madam') == true
puts palindromic?('Madam') == false          # (case matters)
puts palindromic?("madam i'm adam") == false # (all characters matter)
puts palindromic?('356653') == true


puts palindromic?(['m', 'a', 'd', 'a', 'm']) == true
puts palindromic?(['M', 'a', 'd', 'a', 'm']) == false          # (case matters)
puts palindromic?(['m', 'a', 'd', 'a', 'm', ' ', 'i', "'", 'm', ' ', 'a', 'd', 'a', 'm']) == false # (all characters matter)
puts palindromic?([3, 5, 6, 6, 5, 3]) == true
