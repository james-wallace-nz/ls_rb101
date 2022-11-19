arr = [['a', ['b']], {b: 'bear', c: 'cat'}, 'cab']

# arr[0] => ['a', ['b']]
# arr[0][1][0] => 'b'
# arr[1] => {b: 'bear', c: 'cat' }
# arr[1][:b] => 'bear'
# arr[1][:b][0] => 'b'
# arr[2][2] => 'b'

a = [1, 3]
b = [2]
arr = [a, b]
p arr # => [[1, 3], [2]]

a[1] = 5
p arr # => [[1, 5], [2]]

arr[0][1]= 8
p arr # => [[1, 8], [2]]
p a # => [1, 8]

# Shallow Copy

# Sometimes you'll find yourself in need of copying an entire collection, mostly when we want to save the original collection before performing some major modifications. Ruby provides two methods that let us copy an object, including collections: dup and clone. Both of these methods create a shallow copy of an object. This means that only the object that the method is called on is copied. If the object contains other objects - like a nested array - then those objects will be shared, not copied. This has major impact to nested collections.

# dup allows objects within the copied object to be modified.

arr1 = ['a', 'b', 'c']
arr2 = arr1.dup
arr2[1].upcase!

p arr2 # => ['a', 'B', 'c']
p arr1 # => ['a', 'B', 'c']

# clone works the same way.

arr1 = ['abc', 'def']
arr2 = arr1.clone
arr2[0].reverse!

p arr2 # => ['cba', 'def']
p arr1 # => ['cba', 'def']

# the reason this happens is because the destructive methods (String#upcase! and String#reverse!) were called on the object within the array rather than the array itself. Since, as we've already covered, those objects are shared, even if you mutate that object by referencing it from within a particular array or other collection it is the object you are affecting rather than the collection.

arr1 = ['a', 'b', 'c']
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

p arr1 # => ['a', 'b', 'c']
p arr2 # => ['A', 'B', 'C']

# map! modifies arr2 replacing each element with a new value. We are changing the array not the elements within it so arr1 is left unchanged.

arr1 = ['a', 'b', 'c']
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

p arr1 # => ['A', 'B', 'C']
p arr2 # => ['A', 'B', 'C']

# We call the destructive method String#upcase! on each element of arr2. Every arr2 element is a reference to the object referenced by the corresponding element in arr1. Thus, upcase! mutates the element in arr2 and arr1 is also affected. We change the Array elements not the array.

# The main difference between dup and clone is that clone preserves the frozen state of the object.

arr1 = ['a', 'b', 'c'].freeze
arr2 = arr1.clone
arr2 << 'd'
# => RuntimeError: can't modify frozen Array

# dup doesn't preserve the frozen state of the object.

arr1 = ['a', 'b', 'c'].freeze
arr2 = arr1.dup
arr2 << 'd'

p arr2 # => ['a', 'b', 'c', 'd']
p arr1 # => ['a', 'b', 'c']

# In Ruby, objects can be frozen in order to prevent them from being modified.

str = 'abc'.freeze
str << 'd'
# => RuntimeError: can't modify frozen string

# immutable objects are already frozen

puts 5.frozen?
# => true

# freeze only freezes the object it's called on
# The nested objects can still be modified after calling freeze

arr = [[1], [2], [3]].freeze
arr2[2] << 4
p arr # => [[1], [2], [3, 4]]

arr = ['a', 'b', 'c'].freeze
arr[2] << 'd'
p arr # => ['a', 'b', 'c', 'd']
