# Code a solution that doubles the numbers that have odd indices

def double_odd_indices(array)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == array.size

    current_number = array[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]

p double_odd_indices(my_numbers)  # => [1, 8, 3, 14, 2, 12]
p my_numbers                      # => [1, 4, 3, 7, 2, 6]
