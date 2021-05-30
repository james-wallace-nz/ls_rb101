# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

def multiply_all_pairs(array_one, array_two)
  permutations = []
  outer_index = 0
  loop do
    inner_index = 0
    loop do
      permutations << array_one[outer_index] * array_two[inner_index]
      inner_index += 1
      break if inner_index == array_two.size
    end
    outer_index += 1
    break if outer_index == array_one.size
  end
  permutations.sort
end

def multiply_all_pairs(arr_1, arr_2)
  # permutations = []
  # arr_1.product(arr_2) do |e_1, e_2|
  #   permutations << e_1 * e_2
  # end
  # permutations.sort
end

# solution:

def multiply_all_pairs(arr_1, arr_2)
  arr_1.product(arr_2).map { |num1, num2| num1 * num2 }.sort
end

# Examples:

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
