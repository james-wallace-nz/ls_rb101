# 1.

# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]
# The string 'hi' is the last evaluated expression in the block. The string 'hi' evaluates as truthy because it is neither false or nil. Therefore, the block return value for each element of [1, 2, 3] is truthy and every element is selected.size


# 2.

# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# Count uses the truthiness of the block return value to count how many elements meet the criteria specified in the block - count the elements that have a truthy return value.


# 3.

# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3]

# puts num always returns nil, so the block return value for every element is nil, which evaluates as falsy. Reject returns an array containing all of the elements that had a falsy block return value, therefore the array will contain all of the elements in the array that reject is called on.size


# 4.

# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}


# 5.

# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# => [:a, 'ant']
# shift removes the first element added to the hash.

p hash


# 6.

# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# => 11
# the pop method removes and returns the last element from the array. The size method returns the number of elements in the string returned by pop


# 7.

# What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# block returns:
# true
# false
# true

# The last expression in the block is num.odd?, which is true for elements 1 and 3 but false for element 2.
# => true
# At least one of the block return values are true so any will return true


# 8.

# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
p arr.take(2)

# Take method returns the number of elements passed in as an argument
# The method is not destructive.


# 9.

# What is the return value of map in the following code? Why?

new = { a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

p new

# => [nil, 'bear']


# 10.

# What is the return value of the following code? Why?

new_2 = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

p new_2
# => [1, nil, nil]
