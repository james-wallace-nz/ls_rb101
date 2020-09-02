# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

# (1..99).each { |num| puts num if num.odd? }

# count = 1
# until count > 99
#   puts count
#   count += 2
# end

1.upto(99) { |num| puts num if num % 2 == 1 }
