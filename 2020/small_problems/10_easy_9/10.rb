# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

def buy_fruit(shopping_list)
  list = []
  shopping_list.each do |item, quantity|
    quantity.times do
      list << item
    end
  end
  list
end

# Example:

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]

puts '---'

# solution:

def buy_fruit(list)
  list.map { |item, quantity| [item] * quantity }.flatten
end

array = [["apples", 3], ["orange", 1], ["bananas", 2]]
p array
p buy_fruit(array)
p array
