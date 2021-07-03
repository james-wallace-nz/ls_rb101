# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

# result = 0
# iterate through elements
# for each iteration iterate through elements to that point and sum
# add to result

def sum_of_sums(array)
  sum = 0
  array.each_with_index do |e, idx|
    sum += array.slice(0, idx + 1).reduce(&:+)
  end
  sum
end

def sum_of_sums(array)
  sum_total = 0
  accumulator = 0
  array.each do |e|
    accumulator += e
    sum_total += accumulator
  end
  sum_total
end

# Examples:
puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35
