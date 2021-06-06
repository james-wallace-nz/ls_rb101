# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

def running_total(array)
  running_total = 0
  array.map { |e| running_total += e }
end

def running_total(array)
  new_array = []
  running_total = 0
  array.each_with_object(new_array) { |e| new_array << running_total += e }
  new_array
end

def running_total(array)
  new_array = []
  array.inject(0) do |running_total, e|
    new_array << (running_total + e)
    running_total + e
  end
  new_array
end

# Examples:
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
