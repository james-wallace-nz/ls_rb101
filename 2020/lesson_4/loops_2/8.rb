# Using next, modify the code below so that it only prints even numbers.

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# Why did next have to be placed after the incrementation of number and before #puts

# we need to increment number before skipping to avoid an infinite loop if next is executed for an odd number before incrementing to the next number.