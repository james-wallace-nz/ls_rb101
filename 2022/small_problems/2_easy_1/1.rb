# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

def repeat(string, positive_integer)
  positive_integer.times { puts "#{string}" }
end

repeat('Hello', 3)
