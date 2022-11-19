def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}

  loop do
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end

    counter += 1
  end

  selected_produce
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}

p general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}

p general_select(produce, 'Meat')      # => {}

def multiply(array, multiplier)
  transformed_arrray = []
  counter = 0

  loop do
    break if counter == array.size

    transformed_arrray << array[counter] * multiplier

    counter += 1
  end

  transformed_arrray
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == sentence.length

    current_char = sentence[counter]
    selected_chars << current_char if sentence[counter] == character

    counter += 1
  end

  selected_chars
end

question = 'How many times does a particular character appear in this sentence?'
puts select_letter(question, 'a') # => "aaaaaaaa"
puts select_letter(question, 't') # => "ttttt"
puts select_letter(question, 'z') # => ""
puts select_letter(question, 'a').size # => 8
puts select_letter(question, 't').size # => 5
puts select_letter(question, 'z').size # => 0
