puts '---1---'

# 1. 

# How would you order this array of number strings by descending numeric value?

puts 'sort!'

arr = ['10', '11', '9', '7', '8']
p arr

arr.sort! do |a, b|
  b.to_i <=> a.to_i
end
p arr

puts "\nsort_by!"

arr = ['10', '11', '9', '7', '8']
p arr

arr.sort_by! do |a|
  a.to_i
end.reverse!
p arr


puts '---2---'

# 2.

# How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

pp(books.sort_by do |book|
  book[:published].to_i
end)

# Since all the values in question are four characters in length, in this case we can simply compare the strings without having to convert them to integers.


puts '---3---'

# 3.

# For each of these collection objects demonstrate how you would reference the letter 'g'.


arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
puts arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
puts arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
puts arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
puts hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
puts hsh2[:third].keys[0]
# or
puts hsh2[:third].key(0)


puts '---4---'

# 4.

# For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1


arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2


puts '---5---'

# 5.

# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family.

# input: hash
# output: integer - sum of ages for male keys

# map - transform to array of ages or 0s. Then sum
# reduce - sum if meets criteria

total_male_age = 0
total_male_age = munsters.map do |person, details|
                  if details['gender'] == 'male'
                    details['age']
                  else
                    0
                  end
                end.sum
p total_male_age
# 444

total_male_age = 0
total_male_age = munsters.reduce(0) do |sum, (person, details)|
  if details['gender'] == 'male'
    sum + details['age']
  else
    sum
  end
end
p total_male_age
# 444

total_male_age = 0
munsters.each_value do |details|
  total_male_age += details['age'] if details['gender'] == 'male'
end
p total_male_age
# 444

# puts '---6---'

# 6.

# One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# ...like this:

# (Name) is a (age)-year-old (male or female).

munsters.each do |person, details|
  puts "#{person} is a #{details['age']}-year-old #{details['gender']}."
end
# Herman is a 32-year-old male.
# Lily is a 30-year-old female.
# Grandpa is a 402-year-old male.
# Eddie is a 10-year-old male.
# Marilyn is a 23-year-old female.


puts '---7---'

# 7.

# Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2       # arr[0] = arr[0] + 2
arr[1][0] -= a
# a   => 2
# b   => [3, 8]
# arr => [4, [3, 8]]

# The local variable `a` is initialized and assigned to the integer `2`.
# The local variable `b` is initialized and assigned to an array containing the integers, `5` and `8` as elements
# The local variable `arr` is initialized and assigned to an array containing the local variables `a` and `b` as elements. `arr` will be [2, [5, 8]] with each element referencing the same object as local variables `a` and `b`.
# On line `5`, Ruby's syntatic sugar is used to reference an element in an array, increment that value and reassign that element to the new value. This is the same as the `Array#[]` method being invoked on `arr` with the integer `0` passed in as an argument. This references the element at index 0 and returns the integer `2`, which is the same object referenced by `a`.
# The `Integer#+` method is then called on `2` with the integer `2` passed in as an argument. This returns the integer `4`.
# The `Array#[]=` method is then invoked on `arr` with the integer `4` passed in as an argument. This reassigns the element at index 0 to `4`.
# `arr` is now equal to `[4, [5, 8]]`. The element at index 0 is now referencing a different object than the local variable `a`.

# On line 6, element reference syntatic sugar is again used to return the element at index 0 from the array at index 1 in `arr`. This returns the integer `5`. The syntatic sugar `-=` is called to decrement `5` by the value of `a` (`2`) and re-assign this value to the element at index 0 of the array at index 1 in `arr`. This returns the integer `3` and `arr` is now `[4, [3, 8]]`.
# Line 6 destructively mutated the array at index 1 in `arr`. This is the same object that `b` references, so `b` is also now pointing to the array object `[3, 8]`, while `a` is unmodified with the value `2`.


puts '---8---'

# 8.

# Using the each method, write some code to output all of the vowels from the strings.

VOWELS = %w(a e i o u)

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, array|
  array.each do |string|
    string.chars.each do |char|
      puts char if VOWELS.include?(char.downcase)
    end
  end
end
# e
# u
# i
# o
# o
# u
# e
# o
# e
# e
# a
# o


puts '---9---'

# 9.

# Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted = arr.map do |sub_array|
  sub_array.sort do |a, b|
    b <=> a
  end
end
p sorted
# => [["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]


puts '---10---'

# 10.

# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

incremented = array.map do |hash|
  hash.map do |k, v|
    [k, v += 1]
  end.to_h
end
p incremented

incremented = array.map do |hash|
  new = {}
  hash.each do |k, v|
    new[k] = v + 1
  end
  new
end
p incremented

incremented = []
array.each_with_object(incremented) do |hash, obj|
                                      new = {}
                                      hash.each do |k, v|
                                        new[k] = v + 1
                                      end
                                      obj << new
                                    end
p incremented


puts '---11---'

# 11.

# Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

multiples = arr.map do |sub_array|
                      sub_array.select do |el|
                        el % 3 == 0
                      end
                    end
p multiples

# input: [[2], [3, 5, 7], [9], [11, 13, 15]]
# output:  [[], [3], [9], [15]]

multiples = arr.map do |sub_array|
                      sub_array.reject do |el|
                        el % 3 != 0
                      end
                    end
p multiples


puts '---12---'

# 12.

# Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

new_hash = {}
arr.each_with_object(new_hash) do |sub_array, hash|
  hash[sub_array[0]] = sub_array[1]
end
p new_hash
# => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}


puts '---13---'

# 13.

# Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# The sorted array should look like this:

# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# algo:
# sort the following modified array => [[1, 7], [1, 9], [1, 3]]

# select = return only elements that meet criteria
# sort_by = return new array sorted by criteria in block

sorted = arr.sort_by do |sub_array|
                       sub_array.select do |int|
                         int.odd?
                      end
                     end
p sorted


puts '---14---'

# 14.

# Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# input: hsh
# output: array containing colours of fruits (capitalized) and sizes of vegetables (uppercase)

# The return value should look like this:

# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# if :type == 'fruit' => :colors.capitalize
# else :size.upcase

colors_and_sizes = hsh.map do |_, details|
                             if details[:type] == 'fruit'
                               details[:colors].map do |color|
                                 color.capitalize
                               end
                             else
                               details[:size].upcase
                             end
                           end
p colors_and_sizes
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]


puts '---15---'

# 15.

# Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [
        {a: [1, 2, 3]},
        {b: [2, 4, 6], c: [3, 6], d: [4]},
        {e: [8], f: [6, 10]}
      ]

evens = arr.select do |hash|
  hash.all? do |_, array|
    array.all? do |int|
      int.even?
    end
  end
end
p evens
# => [{e: [8], f: [6, 10]}]


puts '---16---'

# 16.

# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

# input: method call
# output: string containing 8, 4, 4, 4, 12 hexadecimial characters separated by -

# algo:
# hexadecimal is 0-9 and A-F
# Create HEXA constant
# Iterate through uuid sub-array elements
# For each element, iterate int number of times based on digits array integer for same index
# For each iteration, randomly select a value from HEXA constant. Add this to the value in the uuid sub-array
# => ["f65c57f6", "a6aa", "17a8", "faa1", "a67f2dc9fa91"]
# Join uuid elements with "-" and return as last expression

HEXA = ('0'..'9').to_a + ('A'..'F').to_a

def generate_uuid
  uuid = ['', '', '', '', '']
  digits = [8, 4, 4, 4, 12]

  uuid.each_with_index do |sub_str, index|
    digits[index].times do
      sub_str << HEXA.sample
    end
  end
  uuid.join('-')
end
p generate_uuid
