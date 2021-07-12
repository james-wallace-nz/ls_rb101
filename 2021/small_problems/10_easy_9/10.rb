# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

# input: nested array
# output: array

def buy_fruit(list)
  result = []
  list.each do |fruit, quantity|
    quantity.times { result << fruit }
  end
  result
end

# Example:
puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]
