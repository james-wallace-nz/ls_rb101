arr1 = ['a', 'b', 'c']
arr2 = arr1.dup
arr2[1].upcase!
p arr1 # => ['a', 'B', 'c']
p arr2 # => ['a', 'B', 'c']

p arr1.object_id
p arr2.object_id

arr1 = ['abc', 'def']
arr2 = arr1.clone
arr2[0].reverse!
p arr1 # => ['cba', 'def']
p arr2 # => ['cba', 'def']

p arr1.object_id
p arr2.object_id

p '---'

a = 'a'
b = a.dup

p a.object_id
p b.object_id

p '---'

arr1 = ['a', 'b', 'c']
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end
p arr1 # => ['a', 'b', 'c']
p arr2 # => ['A', 'B', 'C']


arr1 = ['a', 'b', 'c']
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase!
end
p arr1 # => ['A', 'B', 'C']
p arr2 # => ['A', 'B', 'C']


arr1 = ['a', 'b', 'c']
arr2 = arr1.dup
arr2.map do |char|
  char.upcase!
end
p arr1 # => ['A', 'B', 'C']
p arr2 # => ['A', 'B', 'C']

# upcase returns a new string object, the upcase version of the string caller. Therefore, `arr2` array is the same, but the elements it contains are new elements. As such, the elements in `arr1` are unchanged.

# We call the destrucive method `Array#map!` on `arr2`. This method modifies the array replacing each element of `arr2` with a new value. Since we are changing the array but not the elements within it, `arr1` is left unchanged.


arr1 = ['a', 'b', 'c']
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end
p arr1 # => ['A', 'B', 'C']
p arr2 # => ['A', 'B', 'C']

# Both `arr1` and `arr2` are changed. We call the destructive `String#upcase!` method on each element of `arr2`. Every element of `arr2` is a reference to the object referenced by the corresponding element in `arr1`. Thus, when `#upcase!` mutates the element in `arr2`, `arr1` is also affected. We change the array elements, not the array.

