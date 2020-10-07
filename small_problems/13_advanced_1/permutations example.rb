require 'pry'
def permutations(array)
  return [array] if array.size == 1

  result = []
  array.each_with_index do |element, index|
    sub_array = array[0...index] + array[(index + 1)..-1]# arr[0...2] => [1,2]
    binding.pry
    sub_permutations = permutations(sub_array)
    sub_permutations.each do |permutation|
      result << [element] + permutation
      binding.pry
    end
  end
    binding.pry
  result
end
p permutations([1,2,3])