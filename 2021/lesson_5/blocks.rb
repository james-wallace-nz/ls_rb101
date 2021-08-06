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
# 1
# 3
# => [1, 3]

# On line `1` the `Array#map` method is called on the nested array `[[1, 2], [3, 4]]`. Each sub-array is passed to the block in turn and assigned to the local variable `arr`, the block parameter.
# On line `2`, the `Array#first` method is called on the sub-array. This returns the element at index 0, which is the integer `1` and `3`, respectively.
# On line `2`, the `puts` method is called with the return value from the `first` method as anb argument. This outputs the string representation of the integer and returns `nil`.
# On line `3`, the `Array#first` method is called on the sub-array again. This returns the element at index 0, which is the integer `1` and `3`, respectively. As the last evaluated expression in the block, the block returns the integer `1` and `3`.
# The `Array#map` method performs transformation. It returns a new array containing the block return value from each element in the calling array. In this case, the new array returned by `map` is `[1, 3]`.

# Line    Action                Object           Side Effect        Return Value            Return Value Used?
# 1      `method call(`map`)    Outer array      No                 New array `[1, 3]       No, but shown on line 7
# 1-4     block execution       Each sub-array   No                 `1` and `3`             Yes, for `map` new array elements
# 2       method call (`first`) Each sub-array   No                 Index 0 element (1, 3)  Yes, by `puts`
# 2       method call (`puts`)  Integers (1, 3)  Output string rep  `nil`                   No
# 3       method call (`first`) Each sub-array   No                 Index 0 element (1, 3)  Yes, determines block return value


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

# On line `1`, the local variable `my_arr` is initialized and assigned to the return value of the `Array#each` method.
# On line `1`, the `Array#each` method is called on the nested array `[[18, 7], [3, 12]]`. Each sub-array is passed to the block and assigned to the local variable `arr`, the block parameter.
# On line `2`, the `Array#each` method is called on the current sub-array. Each integer element in the sub-array is passed to the block and assigned to the local variable `num`, which is the block parameter.
# On line `3`, an `if` statement is executed with the condition `num > 5`.
# If the condition evaluates to `true` then the `puts` method is called with `num` passed in as an argument. For the integers `18`, `7` and `12`, the condition evaluates to `true` because they are greater than the integer `5`. `puts` outputs the integers `18`, `7` and `12` and returns `nil` in each case.
# If the condition evaluates to `false` nothing is executed and the `if` statement returns `nil`. For the integer `3` the condition returns `false` because `3` is less than the integer `5`. Nothing is output and `nil` is returned by the `if` statement.
# As the last evaluated expressions, the `nil` return values from the `puts` method or `if` statement will be the block return value. These return values are not used by the inner `each` method.
# The inner `each` method returns the original calling sub-array, which will be the return value of the outer block.
# The outer `each` method does not use the block return values and returns the original calling array

# Line    Action                Object           Side Effect        Return Value            Return Value Used?
# 1       L variable assignment Outer array      No                 Outer arrray
# 1      `method call(`each`)   Outer array      No                 Calling array           Yes, assigned to `my_arr`.
# 1 - 7   outer block execution Each sub-array   No                 Each sub-array          No
# 2       method call (`each`)  Each sub-array   No                 Calling sub-array       Yes, determines outer block return value
# 2 - 6   inner block execution Each element     No                 `nil`                   No
# 3       method call (`>`)     Each element     No                 Boolean                 Yes, evaluated by `if` statement
# 3       `if` stmt executed    Boolean          No                 `nil`                   Yes, determines inner block return value
# 4       method call (`puts`)  Each element     Output string rep  `nil`                   Yes, determines inner block return value


# 5.

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# => [[2, 4], [6, 8]]

# On line `1` the `Array#map` method is called on the nested array `[[1, 2], [3, 4]]`. Each sub-array is passed in turn to the block and assigned to the local variable `arr`.
# On line `2`, the `map` method is called on the current sub-array. Each integer element is passed in turn to the block and assigned to the local variable `num`.
# On line `3`, the `Integer#*` method is called on each integer with the integer `2` passed in as an argument. This returns the value of the integer multiplied by 2. As the last evaluated expression in the block, the return value of the `*` method is the return value of the block.
# The `map` method performs transformation and returns a new array containing the block return value from each calling array element. The inner `map` method returns the new arrays `[2, 4]` and `[6, 8]`. These two return arrays are the last evaluated expressions in the outer block, so these are the outer block return values.
# The outer `map` method returns a new array containing the outer block return values. This is `[[2, 4], [6, 8]]`.

# Line    Action                Object           Side Effect        Return Value            Return Value Used?
# 1      `method call(`map`)    Original array   No                 New array               No
# 1 - 5   outer block execution Each sub-array   No                 New sub-array           Yes, by outer `map`
# 2       method call (`map`)   Each sub-array   No                 New sub-array           Yes, determines outer block return value
# 2 - 4   inner block execution Each int element No                 Doubled integer         Yes, by inner `map`
# 3       method call `*` 2arg  Each int element No                 Doubled integer         Yes, determines inner block return value


# 6.

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{c: 'cat'}]

# On line `1`, the `Array#select` method is called on the array `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]`. Each sub-hash is passed to the block in turn and assigned to the local variable `hash`.
# On line `2`, the `Enumerable#all?` method is called on the current hash element. Each key-value pair is passed to the block in turn and assigned to the local variables `key`, and `value`, respectively.
# On line `3`, the `Array#[]` method is called on `value`. This returns the character at index 0 in the `value` string. The return values are `'a'` , `'e'` and `'c'`.
# On line `3`, the `Symbol#to_s` method is called on each `key` symbol. This returns the string representation of that symbol. The return values are `'a'` , `'b'` and `'c'`.
# On line `3`, the `Comparable#==` method is called on the string representing the first element in `value` with the string return value from the `to_s` method passed in as an argument. This returns boolean `true` or `false` based on whether the caller and argument are equal or not based on the `<=>` method return value.
# As `==` is the last evaluated expression in the inner block, the inner block returns boolean.
# The `all?` method uses the block return values to return boolean. If all block return values all evaluate to `true` then `all?` returns `true`. Otherwise, `all?` returns `false`.
# For the first sub-hash, the block returns `true` for the first key-value pair but `false` for the second pair. This is because `'a'` equals `'a'`, but `'b'` is not equal to `'e'`. Therefore, `all?` returns `false`.
# For the second sub-hash, the block returns `true` because `'c'` is equal to `'c'`. In this case, `all?` returns `true`.
# The `select` method performs selection based on the truthiness of the block's return value. It returns a new array containing all elements of the calling array that have a `true` block return value. In this case, only the second array element has a `true` block return value, so `select` will return a new array `[{c: 'cat'}]`.

# Line    Action                Object           Side Effect        Return Value            Return Value Used?
# 1      `method call(`select`) Outer array      No                 New array               No, but shown line 6
# 1 - 5   outer block execution Each sub-hash    No                 Boolean                 Yes, by `select`
# 2       method call (`all?`)  Each k-v pair    No                 Boolean                 Yes, determines outer block return value
# 2 - 4   inner block execution Each k-v pair    No                 Boolean                 Yes, by `all?`
# 3       method call (`[]`)    `value` string   No                 Char at index 0         Yes, by `==`
# 3       method call (`to_s`)  `key` symbol     No                 String rep of sym       Yes, by `==`
# 3       method call (`==`)    strings          No                 Boolean                 Yes, determines inner block return value


# 7.

arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort
# => [['1', '8', '11'],['1', '8', '9'],['2', '12', '15'],['2', '6', '13']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [['1', '8', '9'], ['1', '8', '11'],['2', '6', '13'], ['2', '12', '15']]


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


# 9.

[
  [ [1], [2], [3], [4] ],
  [ ['a'], ['b'], ['c'] ]
].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [ [[1], [2], [3], [4]], [['a'], ['b'], ['c']] ]

# On line `1`, the `Array#map` method is called on the triple nested array. Each sub-array is passed to the block in turn and assigned to the local variable `element1`. `[[1], [2], [3], [4]]` and `[['a'], ['b'], ['c']]`
# On line `2`, the `Array#each` method is called on the current sub-array. Each sub-sub-array element is passed to the block in turn and assigned to the local variable `element2`. `[1]`, `[2]`, `[3]`, `[4]`, ['a']`, `['b']`, `['c']`
# On line `3`, the `Enumerabl#partition` method is called on the current sub-sub-array. Each integer or string element within the current sub-sub-array is passed to the block and assigned to the local variable `element3`.
# On line `4`, the `Integer#size` or `String#size` method is called on the current integer or string value for `element3`. This returns an integer representing either the number of bytes in the machine representation of `int` or the number of characters in the string.
# On line `4`, the `Comparable#>` method is called on the return value of `size`, with the integer `0` passed in as an argument. This returns boolean `true` for all elements as their byte size is greater than `0`.
# As the last evaluated expression within the block, the return value of `>` method is the block return value.

# `partition` uses the block return value to return an array where the first element is an array of all elements in the caller that have a block return value that evaluates to `true`. The second element is an array of all elements in the caller that have a block return value that evaluates to `false`.
# Therefore, `partition` returns the arrays [[1], []], [[2], []], [[3], []], [[4], []], [['a'], []], [['b'], [], [['c'], []]
# These are the block return values for the `each` method. `each` does not use the block return value and returns the original calling sub-arrays
# `map` uses the block return values for transformation and returns a new array containing the same sub-arrays as the original calling array


# 10.

result =  [
            [
              [1, 2],
              [3, 4]
            ],
            [5, 6]
          ].map do |arr|
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
p result
# => [[[2, 3], [4, 5]], [6, 7]]

