# Create a method that takes two arguments, multiplies them together, and returns the result.

def multiply(one, two)
  one * two
end

# Example:

multiply(5, 3) == 15

# Further Exploration
# For fun: what happens if the first argument is an Array? What do you think is happening here?

multiply([1, 2], 3)

p [1, 2, 3] * 3

# multiplies like a string, creates a new array with the first array elements repeated the second number of times
