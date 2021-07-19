# 1)

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# 1
# 2
# 2
# 3

# uniq does not mutate the caller so numbers is not modified when puts is invoked

# numbers.uniq returned a new Array object with unique elements but did not modify numbers object.
# The puts method, in addition to calling #to_s on it's argument, writes each element on a new line if passed an array.

# p automatically calls `inspect` on its argument, which gives a different formatting on the output


# 2)

# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# ! will change truthy to false and falsey to true
# ! in a method name indicates that it is destructive - it mutates the caller
# ? in a method name indicates that the method returns boolean - true or false


# what is != and where should you use it?
# != is not equal and should be used in a conditional

# put ! before something, like !user_name
# converts truthy to false and falsey value to true
# returns opposite of boolean equivalent

# put ! after something, like words.uniq!
# indicates the method is destructive, it mutates the caller

# put ? before something
# Ternary operator for ? :

# put ? after something
# indicates that a method returns boolean true or false

# put !! before something, like !!user_name
# converts truthy or falsey to boolean true or false, respectively
# returns boolean equivalent


# 3)

# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')

puts advice


# 4)

# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

puts numbers.delete_at(1)
# deletes element at index '1', which is value 2
puts numbers == [1, 3, 4, 5]
# returns deleted value '2'

numbers = [1, 2, 3, 4, 5]

puts numbers.delete(1)
# deletes element with value '1'
puts numbers == [2, 3, 4, 5]
# returns deleted item '1'


# 5)

# Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

puts (10..100).include?(42)

puts (10..100).cover?(42)


# 6)

# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

famous_words.prepend('Four score and ')
puts famous_words

famous_words = "seven years ago..."
famous_words = 'Four score and ' + famous_words
puts famous_words


# 7)

# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# Make this into an un-nested array.

flintstones.flatten!
p flintstones


# 8)

# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

p flintstones.assoc("Barney")
