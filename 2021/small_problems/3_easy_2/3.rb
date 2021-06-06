# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# Example:
# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percent = gets.chomp.to_f / 100

tip = (bill * tip_percent).round(2)
total = bill + tip
format_tip = sprintf("%.2f", tip)
format_total = sprintf("%.2f", total)

puts "The tip is $#{format_tip}"
puts "The total is $#{format_total}"
