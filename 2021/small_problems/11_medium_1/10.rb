# In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

# def fibonacci(n)
#   first, last_ = [1, 1]
#   3.upto(n) do
#     first, last = last, first + last
#   end
#   last
# end

# def fibonacci_last(n)
#   fibonacci(n).to_s[-1].to_i
# end

def fibonacci_last(n)
  last_2 = [1, 1]
  3.upto(n) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end
  last_2.last
end


# Examples:

puts fibonacci_last(3)         # -> 2
puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# puts fibonacci_last(123456789) # -> 4


# last_2 = [1, 1]
# [1, 2 % 10]
# = 2

# 3     1, 2
# 4     2, 3
# 5     3, 5
# 6     5, 8
# 7     8, 3
# 8     3, 1
# 9     1, 4
# 10    4, 5
# 11    5, 9
# 12    9, 4
# 13    4, 3
# 14    3, 7
# 15    7, 0
