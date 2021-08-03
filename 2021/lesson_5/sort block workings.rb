[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end

# [2, 5, 3, 4, 1]
# 2 <=> 5 block => -1       outputs: a is 2 and b is 5
# 5 <=> 3 block =>  1       outputs: a is 5 and b is 3

# [2, 3, 5, 4, 1]
# 2 <=> 3 block => -1       outputs: a is 2 and b is 3
# 5 <=> 4 block =>  1       outputs: a is 5 and b is 4

# [2, 3, 4, 5, 1]
# 3 <=> 4 block => -1       outputs: a is 3 and b is 4
# 5 <=> 1 block => 1        outputs: a is 5 and b is 1

# [2, 3, 4, 1, 5]
# 4 <=> 1 block => 1        outputs: a is 4 and b is 1

# [2, 3, 1, 4, 5]
# 3 <=> 1 block => 1        outputs: a is 3 and b is 1

# [2, 1, 3, 4, 5]
# 2 <=> 1 block => 1        outputs: a is 2 and b is 1

# `sort` => [1, 2, 3, 4, 5]


['arc', 'bat', 'cape', 'ants', 'cap'].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end

# 'arc' <=> 'bat' => -1           outputs: a is arc and b is bat
# 'bat' <=> 'cape' => -1          outputs: a is bat and b is cape
# 'cape' <=> 'ants' => 1          outputs: a is cape and b is ants

# ['arc', 'bat', 'ants', 'cape', 'cap']
# 'bat' <=> 'ants' => 1           outputs: a is bat and b is ants

# ['arc', 'ants', 'bat', 'cape', 'cap']
# 'arc' <=> 'ants' => 1           outputs: a is arc and b is ants

# ['ants', 'arc', 'bat', 'cape', 'cap']
# 'cape' <=> 'cap' => 1           outputs: a is cape and b is cap
# because 'cape' is longer than 'cap'

# ['ants', 'arc', 'bat', 'cap', 'cape']
# 'bat' <=> 'cap' => -1           outputs: a is bat and b is cap

# `sort` => ['ants', 'arc', 'bat', 'cap', 'cape']


[
  ['a', 'cat', 'b', 'c'],
  ['b', 2],
  ['a', 'car', 'd', 3],
  ['a', 'car', 'd']
].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end

# ['a', 'cat', 'b', 'c'] <=> ['b', 2] => -1
# outputs: a is ["a", "cat", "b", "c"] and b is ["b", 2]

# ['b', 2] <=> ['a', 'car', 'd', 3] => 1
# outputs: a is ["b", 2] and b is ["a", "car", "d", 3]

# [
#   ['a', 'cat', 'b', 'c'],
#   ['a', 'car', 'd', 3],
#   ['b', 2],
#   ['a', 'car', 'd']
# ]
# ['a', 'cat', 'b', 'c'] <=> ['a', 'car', 'd', 3] => 1
# outputs: a is ["a", "cat", "b", "c"] and b is ["a", "car", "d", 3]

# [
#   ['a', 'car', 'd', 3],
#   ['a', 'cat', 'b', 'c'],
#   ['b', 2],
#   ['a', 'car', 'd']
# ]
# ['b', 2] <=> ['a', 'car', 'd'] 1
# outputs: a is ["b", 2] and b is ["a", "car", "d"]

# [
#   ['a', 'car', 'd', 3],
#   ['a', 'cat', 'b', 'c'],
#   ['a', 'car', 'd'],
#   ['b', 2]
# ]
# ['a', 'cat', 'b', 'c'] <=> ['a', 'car', 'd'] => 1
# outputs: a is ["a", "cat", "b", "c"] and b is ["a", "car", "d"]

# [
#   ['a', 'car', 'd', 3],
#   ['a', 'car', 'd'],
#   ['a', 'cat', 'b', 'c'],
#   ['b', 2]
# ]
# ['a', 'car', 'd', 3] <=> ['a', 'car', 'd'] => 1
# outputs: a is ["a", "car", "d", 3] and b is ["a", "car", "d"]


# => [
#      ['a', 'car', 'd'],
#      ['a', 'car', 'd', 3],
#      ['a', 'cat', 'b', 'c'],
#      ['b', 2]
#    ]
