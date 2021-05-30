# The method below counts from 0 to 4. Modify the block so that it prints the current number and stops iterating when the current number equals 2.

5.times do |index|
  puts index
  break if index == 2
end

# Without running this code, how many values will be printed?

5.times do |index|
  puts index
  break if index == 4
end

# 5 values 0..4

# Now, consider this code:

5.times do |index|
  puts index
  break if index < 7
end

# How many values will be printed this time?

# 1 values 0