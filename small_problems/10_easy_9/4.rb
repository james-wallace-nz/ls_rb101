# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

def sequence(num)
  array = []
  1.upto(num) do |int|
    array << int
  end
  array
end

def sequence(num)
  (1..num).to_a
end

# Examples:

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

puts '-----'

# Food for thought: what do you think sequence should return if the argument is not greater than 0. For instance, what should you do if the argument is -1? Can you alter your method to handle this case?

def sequence(num)
  if num.positive?
    (1..num).to_a
  else
    (num..-1).to_a
  end
end

# Examples:

p sequence(-5) == [-5, -4, -3, -2, -1]
p sequence(-3) == [-3, -2, -1]
p sequence(-1) == [-1]
