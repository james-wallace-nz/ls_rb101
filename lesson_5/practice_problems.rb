# 1

# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

# 1. use sort_by with b <=> a as a block argument
# 2. transform strings to integers using `to_i`

sorted = arr.sort_by do |a, b|
  b.to_i <=> a.to_i
end


p sorted
# => ["11", "10", "9", "8", "7"]

# The key here is understanding that strings are compared character by character, so '11' will be evaluated to be lesser than '7'. In order to compare the strings as integers, we need to convert them to integers within the block.

# The second part of solving this problem is sorting the array in reverse order. To do this we simply switch the order of b and a in the block.'



# 2

# How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

# sorting Array elements using element value transformed to integer

books = [
          { title: 'One Hundred Years of Solitude',
            author: 'Gabriel Garcia Marquez',
            published: '1967' },
          { title: 'The Great Gatsby',
            author: 'F. Scott Fitzgerald',
            published: '1925' },
          { title: 'War and Peace',
            author: 'Leo Tolstoy',
            published: '1869' },
          { title: 'Ulysses',
            author: 'James Joyce',
            published: '1922' }
        ]

ordered1 = books.sort do |a, b|
  a[:published].to_i <=> b[:published].to_i
end

p ordered1

ordered2 = books.sort_by do |book|
  book[:published]
end

p ordered2
# [
#   { title: 'War and Peace',
#     author: 'Leo Tolstoy',
#     published: '1869' },
#   { title: 'Ulysses',
#     author: 'James Joyce',
#     published: '1922' },
#   { title: 'The Great Gatsby',
#    author: 'F. Scott Fitzgerald',
#    published: '1925' },
#   { title: 'One Hundred Years of Solitude',
#    author: 'Gabriel Garcia Marquez',
#    published: '1967' }
#  ]

# We can use sort_by and access a particular value in each hash by which to sort, as long as those values have a <=> method.

# In this case, all the values for :published are strings so we know that we can compare them. Since all the values in question are four characters in length, in this case we can simply compare the strings without having to convert them to integers.



# 3

# For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = [
          'a',
          'b',
          ['c', ['d', 'e', 'f', 'g']
          ]
       ]
p arr1[2][1][3]
# 'g'


arr2 = [
         {first: ['a', 'b', 'c'], second: ['d', 'e', 'f']},
         {third: ['g', 'h', 'i']}
       ]
p arr2[1][:third][0]
# 'g'


arr3 = [
         ['abc'],
         ['def'],
         {third: ['ghi']}
       ]
p arr3[2][:third][0][0]
# 'g'


hsh1 = {
         'a' => ['d', 'e'],
         'b' => ['f', 'g'],
         'c' => ['h', 'i']
       }
p hsh1['b'][1]
# 'g'


hsh2 = {
         first: {'d' => 3},
         second: {'e' => 2, 'f' => 1},
         third: {'g' => 0}
       }
p hsh2[:third].keys[0]
# or
p hsh2[:third].key(0)
# 'g'



# 4

# For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [
        1,
        [2, 3],
        4
       ]
arr1[1][1] = 4
p arr1


arr2 = [
         { a: 1 },
         { b: 2, c: [7, 6, 5], d: 4 },
         3
       ]
arr2[2] = 4
p arr2


hsh1 = { first: [1, 2, [3]] }
hsh1[:first][2][0] = 4
p hsh1


hsh2 = {
          ['a'] => { a: ['1', :two, 3], b: 4 },
          'b' => 5
       }
hsh2[['a']][:a][2] = 4
p hsh2



# 5

# Given this nested Hash:

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

# figure out the total age of just the male members of the family.

# 1. select members if gender = 'male'
# 2. count age
# 3. return total age

males = munsters.select do |person, details|
  details['gender'] == 'male'
end
p males

total_male_ages = 0

males.each do |person, detail|
  total_male_ages += detail['age']
end

p total_male_ages

# or

# p males.reduce { |total_age, person| person[1]['age'] }
p males.reduce(0) { |sum, (key, value)| sum + value['age'] }


total_male_age = 0
munsters.each_value do |details|
  total_male_age += details['age'] if details['gender'] == 'male'
end
p total_male_age



# 6

# One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}
# ...like this:

# (Name) is a (age)-year-old (male or female).

munsters.each do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end



# 7

# Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]         # [2, [5, 8]]

arr[0] += 2          # [4, [5, 8]]
arr[1][0] -= a       # [4, [3, 8]]
                     # a = 2
                     # b = [3, 8]
p a
p b
p arr

# The value of a didn't change because we are not referencing a at any point. This code arr[0] += 2 was modifying the array, arr not a. In effect we are assigning a new object at that index of the array so that instead of arr[0] containing a it now contains 4 - we can check this by looking at the value of arr:

# arr # => [4, [3, 8]]
# The value of b did change because b is an array and we are modifying that array by assigning a new value at index 0 of that array.



# 8

# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# 1. iterate over the hash
# 2. iterate over the array element
# 3. iterate over the string characters
# 4. if character is a vowel then print

vowels = 'aeiou'
hsh.each_value do |array|
  array.each do |string|
    string.chars.each do |char|
      puts char if vowels.include?(char.downcase)
    end
  end
end



# 9

# Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [
        ['b', 'c', 'a'],
        [2, 1, 3],
        ['blue', 'black', 'green']
      ]

# 1. iterate through each array element - use map to return a new array
# 2. for each sub-array element, sort the elements in descending order


sorted = arr.map do |sub_array|
  sub_array.sort do |a, b|
    b <=> a
  end
end

p sorted



 #10

# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

original_array = [
          { a: 1 },
          { b: 2, c: 3 },
          { d: 4, e: 5, f: 6 }
        ]
p original_array

# 1. iterate through each array element - use map
# 2. iterate through sub-hash keys
# 3. increment key

new_array = original_array.map do |hash|
  incremented_hash = {}
  hash.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end
p new_array
p original_array


newer_array = original_array.each_with_object([]) do |hash, arr|
  incremented_hash = {}
  hash.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
p newer_array
p original_array


 # 11

# Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]


# ::HERE::



 # 12

# Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}



 # 13

# Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# The sorted array should look like this:

[[1, 8, 3], [1, 6, 7], [1, 4, 9]]


 # 14

# Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# The return value should look like this:

[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]


 # 15

# Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

 # 16

# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.



