# Question 1

# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# 1
# 2
# 2
# 3
# => nil

# uniq does not mutate the caller so numbers local variable is unchanged with the value [1, 2, 2, 3]



# Question 2

# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# ! indicates that a method is destructive - it will mutate the caller. ! is also used for not as in not equal or to turn true to false or vice versa.
# ? indicates that a method returns a boolean true or false

# what is != and where should you use it?
# != is not equal and you use it in comparison true != true

# put ! before something, like !user_name
# ! before something will return false for a truthy value and true for a falsey value
# turns any object into the opposite of their boolean equivalent

# put ! after something, like words.uniq!
# Indicates that the method mutates the caller

# put ? before something
# Is the ternary operator for if..else

# put ? after something
# Indicates that the method returns a boolean true or false

# put !! before something, like !!user_name
# returns true for a truthy value and false for a falsey value
# turns any object into their boolean equivalent



# Question 3

# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."


advice.gsub!('important', 'urgent')
puts advice



# Question 4

# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
# deletes the value at index 1 in numbers array
# numbers => [1, 3, 4, 5]
p numbers


numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
# deletes the value 1 in numbers arrray
# numbers => [2, 3, 4, 5]
p numbers



# Question 5

# Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

puts (10..100).include?(42)



# Question 6

# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

new = "Four score and " + famous_words
puts new

newer = "Four score and " << famous_words
puts newer



# Question 7

# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:

# ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# Make this into an un-nested array.

p flintstones
p flintstones.flatten!


# Question 8

# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

barney = flintstones.select { |name, _| name == 'Barney' }.to_a.flatten
p barney
