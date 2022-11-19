# What is the type of action being performed (method call, block, conditional, etc..)?
# What is the object that action is being performed on?
# What is the side-effect of that action (e.g. output or destructive action)?
# What is the return value of that action?
# Is the return value used by whatever instigated the action?


# 1.

[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

# The Array#each method is invoked on the multi-dimensional array [[1, 2], [3, 4]].
#each iterates over each inner-array and passes that element to the block and assings it to the local variable 'arr'. Inside the block, the Array#first method is invoked on the element, which returns the element at index 0 in the array. Kernel#puts is invoked with this integer passed in as an argument, which outputs the string representation of the integer and returns nil. As the last evaluated expression in the block, nil is the return value of the block. However, #each doesn't use the block return value.
# The #each method returns the original nested-array


# 2.

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

# The Array#map method is invoked on a nested array [[1, 2], [3, 4]]. #map iterates over each element in the outer array and passes it to the block in turn. Each elment is assigned to the block local variable `arr`.
# Inside the block, Array#first is called on `arr`, which returns the element at index 0, which is integer 1 and 3.
# The Kernel#puts method is invoked with the return value of #first passed in as an argument. This outputs the string representation of the integer 1 and 3 and returns nil.
# As the last evaluated expression in the block, the block returns `nil` for each inner array.
# #map uses the block return value to return a new array with the block return values. #map returns the new array [nil, nil]


# 3.

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]

# Array#map invoked on nested array.
# Each inner-array is passed to the block and assigned to the local variable `arr`.
# Array#first called on the sub-arrays. Returns the element at index 0. This is passed as an argument to #puts, which outputs the string representation of the integer and returns nil.
#first is called again on the sub-array. As the last evaluated expression in the block, the return value of #first is the block return value.
#map uses the block return values to return a new array containing these return values, which is [1, 3]


# 4.

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# 18
# 7
# 12
# => [[18, 7], [3, 12]]

#each called on nested array. Returns original collection, which is assigned to the local variable `my_arr`.
# each sub-array passed to the block and assigned to local variable `arr`.
# Inside the block, #each is invoked on the sub-array, with each element passed to the block in turn and assigned to the local variable `num`.
# Inside the inner block, an if conditional uses comparison to determine if the elment is greater than integer 5. If so, #puts is invoked with num passed in as an argument. This outputs the integer and returns `nil`.
# The block returns nil if the conditional is false, and nil if the conditional is true, because the last evaluated expression in the true branch is #puts, which returns nil
# The outer block return value is the return value of the inner #each method, which is the sub-array it is called on.


# 5.

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# => [[2, 4], [6, 8]]

#map called on nested array, passes sub-array to block and assigns to local variable `arr`.
#map is called on `arr` and passes each element to the block and assigns to local variable `num`
# * method invoked on `num` with integer `2` passed in as an argument. This returns the value of num multiplied by 2, which is the return value of the block
# The inner #map method uses the block return value to return a new array with elements transformed into the block return value. This is [2, 4] and [6, 8].
# The return value of the inner #map method is the return value of the outer block. The outer #map uses the block return value to return a new array with elements transformed into the block return values. This is [[2, 4], [6, 8]].


# 6.

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => 'cat' }]

# Array#select invoked on array of hash. Each hash element is passed to the block and assigned to the local variable `hash` in turn.
# Inside the outer block, the Enumerable#all? method is invoked on hash with the keys and corrsponding values being passed to the block and assigned to `key` and `value` in turn.
# Inside the inner block, the string#[] method is invoked on the value, which returns the character at index 0.
# The symbol#to_s method is inoked on key, which returns the string representation of the symbol.
# Comparison is used to compare the eqauality of the first character of value and string representation of key. This returns boolean true or false.
# The inner block returns the return value of the last evaluated expression, which is the return value of the conditional. #all? uses the return value of the blocks to determine if all elements in the hash returned true or not. If all are true, #all? returns true, otherwise false.
# The return value of #all? is the last evaluated expression in the outer block, which makes its return value the return value of the outer block.
#select uses the return values of the outer block to return a new array of hashes that had `true` block return value.

# What would happen if, instead of using all?, we used any?. Why would this affect the return value of select?

# Using #any? in the outer block would return true for both hash elements. #any? will return true if any of the block return value of any of the key-value pairs returns a truthy value. This is the case for both hashes, as the key-value pair `a: 'ant'` will have a truthy block return true. Therefore, select returns a new array with the same elements as the collection it is called on.

p ([{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.any? do |key, value|
    value[0] == key.to_s
  end
end)
# => [{ a: 'ant', b: 'elephant' }, { c: 'cat' }]


# 7.

arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [['1', '8', '9'], ['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15']]

# methods:
# sort_by
# map
# to_i

# blocks:
# sort_by
# map

# to_i returns string representation to map, which returns an array of integers
# map returns array of integers to select, which uses them to sort the sub_arrays
# sort_by returns a new array of sub_arrays sorted by numeric value.



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
# => [[27], ['apple']]

# methods:
# map
# select
# to_s
# to_i
# >
# <
# ==
# size

# blocks:
# map
# select


# 9.

[
  [[1], [2], [3], [4]],
  [['a'], ['b'], ['c']]
].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# element1: [[1], [2], [3], [4]]
# element2: [1], [2], [3], [4]
# element3: 1, 2, 3, 4
# [1] []
# ['a'], []

# =>  [
#       [[1], [2], [3], [4]],
#       [['a'], ['b'], ['c']]
#     ]

# methods:
# map
# each
# partition
# size
# >

# blocks:
# map
# each
# partition


# 10.

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.to_i == el
      el + 1
    else
      el.map do |n|
        n + 1
      end
    end
  end
end

# arr: [[1, 2], [3, 4]] [5, 6]
# el: [1, 2] [3, 4] 5 6
# n: 1 2 3 4

# inner map: [2, 3] [4, 5] 6 7
# outer map: [[[2, 3], [4, 5]], [6, 7]]

# methods:
# map
# map
# to_s
# to_i
# map
# +
# ==

# blocks:
# map
# map
# map
