# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# input: array of integers
# output: array of running totals
# algorithm:
# 1. iterate through each array element
# 2. for each element calculate a running total
# 3. map running total to array element

def running_total(array)
  running_total = 0
  array.map do |e|
    running_total += e
  end
end

# Examples:

# puts running_total([2, 5, 13]) == [2, 7, 20]
# puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# puts running_total([3]) == [3]
# puts running_total([]) == []

# Try solving this problem using Enumerable#each_with_object or Enumerable#inject (note that Enumerable methods can be applied to Arrays).

def running_total(array)
  running_total = 0
  running_totals = []
  array.each_with_object(running_totals) do |e, obj|
    obj << running_total += e
  end
  running_totals
end

def running_total(array)
  running_totals = []
  array.inject(0) do |running_total, e|
    running_totals << (running_total + e)
    running_total + e
  end
  running_totals
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
