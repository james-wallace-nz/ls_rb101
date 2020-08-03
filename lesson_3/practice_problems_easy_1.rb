# 1

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
1
2
2
3

# uniq does not mutate the callers, numbers. It returns a new array object.



# 2

# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

  # ! is used at the end of a method name to indicate that the method mutates the callers
  # ! is also not, it returns the inverse a boolean - true for falsy objects and false for truthy objects

  # ? is used at the end of a method name to indicate that the method returns a boolean true or false
  # ? is alsu used in ternary conditional expressions / ternary operator for if..else


# what is != and where should you use it?
  # != is not equal and it is used in conditional expressions


# put ! before something, like !user_name
  # !obj returns the inverse of that object's truthy/falsy value.


# put ! after something, like words.uniq!
  # ! in a method name indicates that the method mutates the caller

# put ? before something
  # in a ternary operator the ? before an expression means the expression will be executed if the conditional is true

# put ? after something
  # in a ternary operator, the ? after something means that the something is a conditional expression that will evaluate to true or false

# put !! before something, like !!user_name
  # !! returns that objects boolean true or false value



# 3


advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')
puts advice



# 4

# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]
# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
# deletes at index 1, which is value 2
p numbers

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
# deletes the value 1, which is at index 0
p numbers



# 5

# Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

puts (10..100).include?(42)



# 6

# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

famous_words = 'Four score and ' + famous_words
puts famous_words


famous_words = "seven years ago..."
famous_words.prepend('Four score and ')
puts famous_words

famous_words = "seven years ago..."
famous_words = 'Four score and ' << famous_words
puts famous_words



# 7

# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# Make this into an un-nested array.

flintstones.flatten!
p flintstones



# 8

# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

flintstones.keep_if { |name, value| name == 'Barney' }
flintstones = flintstones.to_a.flatten!
p flintstones

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.assoc('Barney')
