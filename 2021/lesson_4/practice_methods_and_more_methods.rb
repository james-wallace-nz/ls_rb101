# 1.

# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# The `select` method iterates through each element in the `[1, 2, 3]` array that it is called on. `select` passes each element to the block as the `num` block parameter. If the block returns a truthy value then `select` adds the current element to a new array. After iterating through all elements,`select` then returns the new array.
# In this case, the return value of the block is `'hi'`, becuase that is always the last expression to be evaluated in the block. The string `'hi'` is a truthy value, because it is not `false` or `nil`. Therefore, every element in the `[1, 2, 3]` will be selected and the new array returned by `select` will contain all of the same elements `1`, `2`, and `3` from the calling array. `select` will return a new array `[1, 2, 3]`.


# 2.

# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# `count` evaluates the truthiness of the block's return value. `count` iterates through all elements in the calling array. If the block return value or an element is truthy it will increment the count. After iterating through all of the elements `count` will return the count being the number of elements that had a truthy block return value.
# We can read the docs


# 3.

# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

`reject` returns a new array containing elements from the calling array for which the block returned `false` or `nil`. In this case, the block always returns `nil`, because the `puts` method always returns `nil`. Therefore, `reject` will return a new array containing all of the elements from the calling array `[1, 2, 3]`.


  # 4.

# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# When we invoke `each_with_object`, we pass in an object as an argument, which in this case is an empty hash `{}`. `each_with_object` iterates over each element in the calling array. The block parameter `value` references the current element. The block parameter `hash` references the updated object that was passed in as an argument. On each iteration, the hash parameter is assigned a new key-value pair. The key is determined by `value[0]`, which is the first letter of the current string element, `'a'`, `'b'`, and `'c'`. The value assigned to the key is the current `value` element.
# Therefore, `each_with_object` will return the new hash object containing the first letter of each element as keys and each element as values `{'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }`


# 5.

# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# `Hash#shift` destructively removes and returns the first hash key-value pair based on the order they were added to the hash. The return value is an array containing the key and value as elements


# 6.

# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# `pop` destructively removes and returns the last element in the calling array. `size` returns the number of characters in a string. Therefore, chaining the `pop` and `string` method calls on the `['ant', bear', 'catapillar']` array will first remove 'catapillar' from the array and return it. `size` is then called on the returned 'caterpillar' string and it returns 11.


# 7.

# What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# `any?` iterates through each element in the calling array. It will return `true` if any of the block return values are truthy, otherwise it will return `false`. `any?` will stop iterating through elements when it reaches the first element that has a truthy block return value. In this case, the block parameter `num` references the first element, the integer 1. In the block, `puts num` will output `1`. `num.odd?` then returns `true` as the integer `1` is odd. This is the last expression evaluated by the block, so the block return value is `true`.Therefore, `any?` returns `true` and stops iterating through the calling array becuase there is no need to evaluate the remaining elements.


# 8.

# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# `take` returns the number of elements from the calling array specified by its argument, which in this case is 2. Therefore, `arr.take(2)` will return `[1, 2]`
# `take` is not destructive.


# 9.

# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# `map` performs transformation on each element in the calling collection and returns a new array containing the transformed elements. Transformation is determined by the block return value for each element.
# In this case, the block contains an `if` statement, that only returns the block parameter `value` if the `if` statement evalutates to `true`. When the `if` statement evaluates to `false` the `if` statement will return `nil`. Therefore, on the first iteration, the block will return `nil` because the condition `'ant'.size > 3` is `false`. On the second iteration, `'bear'.size > 3` is `true` so the block will return `value`, which is `'bear'`. As such, map will return a new array containing `nil` and `'bear'`, `[nil, 'bear']`.

# When none of the conditions in an `if` statement evaluates as `true`, the `if` statement itself returns `nil`.


# 10.

# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# `map` performs transformation. It will return a new array containing the block return value for each element in the calling array.
# In this case, the block contains an `if` statement which evaluates whether the current element referenced by the block parameter `num` is greater than the integer `1`. If the `if` statement evaluates as `true` then `puts num` outputs `num` and returns `nil`. Otherwise, `num` is returned.
# The `if` branches are the last expressions evaluated by the block, so the return value of the block will be `nil` or `num`.
# Therefore, `map` returns a new array `[1, nil, nil]` because `1` is not greater than `1` and the block will return `1`. The elements `2` and `3` are greater than `1`, so these will be output and their block return values will be `nil`.
