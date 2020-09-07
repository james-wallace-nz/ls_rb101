# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# input: integer
# output: integer - sum of multiples of 3 or 5

# algorithm:
# interate from 1 to number
# if multiple of 3 or 5 add to array
# summ all elements in array
# return sum

def multiples(int)
  multiples = []
  1.upto(int) do |number|
    multiples << number if (number % 3).zero? || (number % 5).zero?
  end
  multiples
end

def multisum(int)
  multiples = multiples(int)
  multiples.reduce(:+)
end

# Examples

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
