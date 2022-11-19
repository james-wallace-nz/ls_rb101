# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(a, b)
  a * b
end

def square(num)
  multiply(num, num)
end

# Example:

puts square(5) == 25
puts square(-8) == 64

# Further Exploration

# What if we wanted to generalize this method to a "power to the n" type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply method?

def power(num, n)
  result = num
  (n - 1).times do |variable|
    result = multiply(result, num)
  end
  result
end

puts power(5, 3) == 125
puts power(2, 3) == 6
