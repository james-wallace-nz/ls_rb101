# Write another method that returns true if the string passed as an argument is a palindrome, false otherwise.

# This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters.

# If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

def palindrome?(obj)
  obj == obj.reverse
end

def real_palindrome?(word)
  word_array = word.downcase.split('')
  stripped_array = []
  word_array.each do |char|
    stripped_array << char if /[a-z0-9]/.match(char)
  end
  stripped_word = stripped_array.join
  palindrome?(stripped_word)
end

# Examples:

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
