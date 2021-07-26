# Using next, modify the code below so that it only prints even numbers.

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# Further Exploration

# Why did next have to be placed after the incrementation of number and before #puts?

# next must come after incrementation so that number can be allowed to increment to the next value. Otherwise, next will loop indefinitely
# next must come before #puts otherwise the number will be printed without checking if it is odd and next should execute
