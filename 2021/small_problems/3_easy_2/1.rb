# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

name = gets.chomp
name = "Teddy" if name == ''
age = rand(180) + 20
puts "#{name} is #{age} years old!"

# Example Output
# Teddy is 69 years old!
