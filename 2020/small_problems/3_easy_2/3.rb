# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

print 'What is the bill? '
bill = gets.chomp.to_i

print 'What is the tip percentage? '
tip = gets.chomp.to_f

tip_amount = (bill * tip / 100).round(2)
total = (bill + tip_amount).round(2)

puts "The tip is $#{sprintf("%0.2f", tip_amount)}"
puts "The total is $#{sprintf("%0.2f", total)}"
