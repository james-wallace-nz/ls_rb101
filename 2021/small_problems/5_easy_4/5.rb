# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

def multisum(n)
  range = (1..n).to_a
  multiples = range.select { |e| e % 3 == 0 || e % 5 == 0 }
  multiples.sum
end

def multiple?(num, divisor)
  (num % divisor).zero?
end

def multisum(n)
  sum = 0
  1.upto(n) do |e|
    sum += e if (multiple?(e, 3) || multiple?(e, 5))
  end
  sum
end

# Examples
puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
