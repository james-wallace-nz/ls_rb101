# Question 1

# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.

puts !ages.select { |name, _| name == 'Spot' }.empty?

# Bonus: What are two other hash methods that would work just as well for this solution?

ages.each { |name, _| puts('Spot is here') if name == 'Spot' }
puts ages.key?('Spot')
puts ages.include?('Spot')
puts ages.member?('Spot')


# Question 2

# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original munsters_description above):

munsters_description.swapcase!
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description.capitalize!
# "The munsters are creepy in a good way."

munsters_description.downcase!
# "the munsters are creepy in a good way."

munsters_description.upcase!
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."



# Question 3

# We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
p ages



# Question 4

# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.match?('Dino')
p advice.include?('Dino')



# Question 5

# Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)



# Question 6

# How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones << 'Dino'
p flintstones



# Question 7

# In the previous practice problem we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones << "Dino"

# We could have used either Array#concat or Array#push to add Dino to the family.

# How can we add multiple items to our array? (Dino and Hoppy)

flintstones.concat(['Dino', 'Happy'])
p flintstones



# Question 8

# Shorten the following sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

# As a bonus, what happens if you use the String#slice method instead?

puts advice.slice!(0..38)
puts advice

# Question 9

# Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"

puts statement.count('t')



# Question 10

# Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a table of Flintstone family members that was forty characters in width, how could we easily center that title above the table with spaces?

title = "Flintstone Family Members"

puts title.center(40, ' ')
