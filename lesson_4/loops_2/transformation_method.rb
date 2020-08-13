# Implement a `double_numbers!` method that mutates its argument?

def double_numbers!(array)
  counter = 0

  loop do
    break if counter == array.size

    array[counter] *= 2
    counter += 1
  end
  array
end

numbers = [1, 4, 3, 7, 2, 6]

p double_numbers!(numbers)
p numbers