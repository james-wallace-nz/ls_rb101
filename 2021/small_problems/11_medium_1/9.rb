# In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow and require massive quantities of memory and/or stack space.

# Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result, the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

# Rewrite your recursive fibonacci method so that it computes its results without recursion.

# input: n
# output: fibonacci number
# algo:
# create starting fib array of [1, 1]
# iterate from 3 to n
#   shift fib array and add to array element
#   push result to fib array
# end iteration
# return last element in fib array


def fibonacci(n)
  fib = [1, 1]
  3.upto(n) do |num|
    new_fib = fib[0] + fib[1]
    fib.shift
    fib.push(new_fib)
  end
  fib.last
end

def fibonacci(n)
  first, last = [1, 1]
  3.upto(n) do
    first, last = last, first + last
  end
  last
end

# Examples:

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
# puts fibonacci(100_001) # => 4202692702.....8285979669707537501
