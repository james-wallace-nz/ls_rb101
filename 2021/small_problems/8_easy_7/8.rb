# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

def multiply_list(array_one, array_two)
  new_array = []
  array_one.each_with_index do |e, index|
    new_array << e * array_two[index]
  end
  new_array
end

def multiply_list(one, two)
  one.zip(two).map { |subarray| subarray[0] * subarray[1] }
end

# Examples:
p multiply_list([3, 5, 7], [9, 10, 11]) #  == [27, 50, 77]
