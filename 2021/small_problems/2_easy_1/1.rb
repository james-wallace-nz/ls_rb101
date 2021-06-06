# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example:
# repeat('Hello', 3)


# Output:
# Hello
# Hello
# Hello

def repeat(string, integer)
  integer.times { puts string }
end

def repeat(string, integer)
  count = 0
  loop do
    puts string
    count += 1
    break if count == integer
  end
end

repeat('Hello', 3)
