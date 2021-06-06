# Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

def palindrome?(a)
  a == a.reverse
end

def palindromic_number?(int)
  palindrome?(int.to_s)
end

# Examples:
puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
