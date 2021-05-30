# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example:

# repeat('Hello', 3)

# Output:

# Hello
# Hello
# Hello

def repeat(phrase, number)
  count = number
  loop do
    puts phrase
    count -= 1
    break if count == 0
  end
end

repeat('Hello', 3)

# or

def repeat(phrase, number)
  number.times { puts phrase }
end

repeat('Hello', 3)
