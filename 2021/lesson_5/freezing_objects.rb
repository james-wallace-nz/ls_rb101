arr1 = ['a', 'b', 'c'].freeze
arr2 = arr1.clone
# puts arr2 << 'd'
# => can't modify frozen Array (FrozenError)

arr1 = ['a', 'b', 'c'].freeze
arr2 = arr1.dup
arr2 << 'd'
p arr2 # => ['a', 'b', 'c', 'd']
p arr1 # => ['a', 'b', 'c']

str = 'abc'.freeze
# str << 'd'
# RuntimeError: can't modify frozen string


puts 5.frozen? #=> true

arr = [[1], [2], [3]].freeze
arr[2] << 4
p arr # => [[1], [2], [3, 4]]
