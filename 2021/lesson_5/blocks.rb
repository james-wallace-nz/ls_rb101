# 1.

[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]

# The `Array#each` method is called on the nested array `[[1, 2], [3, 4]]`. Each inner array is passed to the block in turn and assigned to the block parameter `arr`, which is a local variable.
# The `Array#first` method is called on `arr`, which returns the element at index 0 of the current array. In this case, integers `1`, and `3`.
# The `puts` method is called with the returned integer as an argument. This then outputs the string representation of the integer. `puts` returns `nil`. Since the last evaluated expression in the block is `nil`, the block returns `nil`.
# The `Array#each` method returns the original calling object, the nested array.


# 2.

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# [nil, nil]


# On line `1`, the `Array#map` method is called on the nested array `[[1, 2], [3, 4]]`. Each sub-array is passed to the block in turn and assigned to the local variable `arr`, which is the block parameter.
# on line `2` the `Array#first` method is called on `arr`. This returns the element at index 0 in the current sub-array. In this case, this is the integers `1` and `3`, respectively.
# The `puts` method is called with the integer return value as an argument. This outputs the string representation of the integer.
# `puts` returns `nil`, which is the last evaluatd expression in the block. Therefore, the block returns `nil`.
# `map` performs transformation based on the return value of the block. It returns a new array with the same number of elements as the calling array. Each element in the new array is the value returned by the block for the respective element in the calling array. In this case, the array `[nil, nil]` will be returned

# Line    Action                Object           Side Effect        Return Value            Return Value Used?
# 1      `method call(`map`)    Outer array      No                 New array `[nil, nil]   No, but shown on line 6
# 1-3     block execution       Each sub-array   No                 `nil`                   Yes, for `map` new array elements
# 2       method call (`first`) Each sub-array   No                 Index 0 element (1, 3)  Yes, by `puts`
# 2       method call (`puts`)  Integers (1, 3)  Output string rep  `nil`                   Yes, determines block return value


# 3.

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end









# 4.

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end


# 5.

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end


# 6.

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end


# 7.

arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]



# 8.

[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item
      item > 13
    else
      item.size < 6
    end
  end
end


# 9.

[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end


# 10.

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1
      el + 1
    else
      el.map do |n|
        n + 1
      end
    end
  end
end

