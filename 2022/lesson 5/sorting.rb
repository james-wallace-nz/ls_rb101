p ['arc', 'bat', 'cape', 'ants', 'cap'].sort
# => ['ants', 'arc', 'bat', 'cap', 'cape']

p [['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# => [['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'], ['b', 2]]

p (['cot', 'bed', 'mat]'].sort_by do |word|
  word[1]
end)
# => ['mat', 'bed', 'cot']

people = { Kate: 27, john: 25, Mike: 18 }
p (people.sort_by do |_, age|
  age
end)
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]

p (people.sort_by do |name, _|
  name.capitalize
end)
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]
