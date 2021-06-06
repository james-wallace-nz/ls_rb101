# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(a, b)
  a * b
end

# def square(a)
#   multiply(a, a)
# end

def square(num, power = 2)
  return 1 if power = 0
  count = 1
  result = num
  loop do
    break if count == power
    result = multiply(num, result)
    count += 1
  end
  result
end

# Example:
puts square(5) == 25
puts square(-8) == 64

puts square(5, 3) == 125
