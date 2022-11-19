# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

# (1..99).each do |idx|
#     next if idx.even?
#   puts idx
# end

# count = 1
# while count <= 99
#   puts count
#   count += 2
# end

1.upto(99) do |idx|
  next if idx.even?
  puts idx
end
