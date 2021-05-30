# Print the even numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

(1..99).each { |num| puts num if num.even? }

1.upto(99) { |num| puts num if num % 2 == 0
}