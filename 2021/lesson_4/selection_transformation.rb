produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  selected_fruit = {}
  keys = hash.keys
  count = 0

  loop do
    break if count == keys.size
    current_key = keys[count]
    current_value = hash[current_key]

    if current_value == 'Fruit'
      selected_fruit[current_key] = current_value
    end

    count += 1
  end

  selected_fruit
end

p select_fruit(produce)


puts '------'


my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(array)
  count = 0

  loop do
    break if count == array.size
    array[count] = array[count] * 2
    count += 1
  end

  array
end

p my_numbers
p double_numbers!(my_numbers)
p my_numbers


puts '------'


my_numbers = [1, 4, 3, 7, 2, 6]

def double_odd_indices(array)
  doubled_numbers = []
  count = 0

  loop do
    break if count == array.size

    if count.odd?
      doubled_numbers << array[count] * 2
    else
      doubled_numbers << array[count]
    end

    count += 1
  end

  doubled_numbers
end

p double_odd_indices(my_numbers)  # => [2, 4, 6, 14, 2, 6]
p my_numbers


puts '------'


my_numbers = [1, 4, 3, 7, 2, 6]

def multiply(array, multiplier)
  multiplied = []
  count = 0

  loop do
    break if count == array.size
    multiplied << array[count] * multiplier
    count += 1
  end

  multiplied
end

p multiply(my_numbers, 3)


puts '-------'


question = 'How many times does a particular character appear in this sentence?'

def select_letter(string, letter)
  selected_letters = ''
  count = 0

  loop do
    break if count == string.size
    selected_letters << string[count] if string[count] == letter
    count += 1
  end

  selected_letters
end

puts select_letter(question, 'a') == "aaaaaaaa"
puts select_letter(question, 't') == "ttttt"
puts select_letter(question, 'z') == ""

puts select_letter(question, 'a').size == 8
puts select_letter(question, 't').size == 5
puts select_letter(question, 'z').size == 0

