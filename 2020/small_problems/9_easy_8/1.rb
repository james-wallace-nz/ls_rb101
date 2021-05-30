# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

# input: array of integers
# output: sum of sums
# algorithm:
# 1. set results to empty array
# 2. iterate through each element in input array
# 3. sum elements from index 0 to current index and add to results array
# 4. sum all elements in results array and return

def sum_of_sums(array)
  results = []
  outer_index = 0
  loop do
    sum = 0
    inner_index = 0
    loop do
      sum += array[inner_index]
      inner_index += 1
      break if inner_index > outer_index
    end
    results << sum
    outer_index += 1
    break if outer_index == array.size
  end
  results.inject(&:+)
end

def sum_of_sums(array)
  results = [0]
  index = 0
  loop do
    results << array[index] + results[-1]
    index += 1
    break if index == array.size
  end
  results.inject(&:+)
end

# Examples:

p sum_of_sums([3, 5, 2]) == 21 # == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == 36 # == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

puts '-----'

# solution:

def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0
  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end

p sum_of_sums([3, 5, 2]) == 21


# 0
# 0

# 3
# => 3
# => 3

# 5
# => 8
# => 11

# 2
# => 10
# => 21

puts '-----'

def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end

p sum_of_sums([3, 5, 2]) == 21
