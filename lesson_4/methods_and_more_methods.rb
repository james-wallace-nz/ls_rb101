# 1

# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]
# select iterates over the collection and returns a new collection of elements for which the block condition returned true.
# 'hi' is a truthy value and as the last expression of the block, the block will always be truthy for each element
# therefore, the new collection returned by select will include all the elements of the calling collection



# 2

# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# => 2
# count counts the number of elements for which the block returns a truthy value



# 3

# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# [1, 2, 3]

# reject returns a collection of elements for which the block returns false
# puts num in the block returns nil, which is a falsy value
# therefore, all elements in the calling collection will be returned in an array by the reject method



# 4

# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }

# a hash is passed in as the object argument to each_with_object. This will be returned by the method.
# the block parameter 'hash' is the hash passed in as an argument to the each_with_object method.
# the block adds the first letter of the 'value' as a key and the full string 'value' as the value to the hash
# the method returns the new hash



# 5

# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# => [ :a, 'ant']
# shift destructively removes the first key-value pair and returns it as the two-item array [key, value]


# 6

# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# array.pop destructively removes the last element from the array and returns it.
# In this case, caterpillar will be removed from the array and returned as a string.
# String.size will then be called on 'caterpillar' and return 11


# 7

# What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# 1
# => true

# the block will return true or false depending on whether the element is odd
# any? will return true or false depending on whether any of the elements in the calling array result in the block returning true
# any? in this code will return true because at least one element in the array is odd


# seems to stop iterating once the block returns a truthy value?



# 8

# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# => [1, 2]

# take returns the first n elements from enum
# take is not destructive



# 9

# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [nil, 'bear']

# map transforms each element and returns a new collection containing those transformed elements
# 'ant' is less than 3 so the block will return nil
# 'bear' is greater than 3 so the block will return 'bear'



# 10

# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil]

# the block returns the element when the value is less than or equal to 1
# the block returns nil when the element's value is greater than 1, because puts num always returns nil
