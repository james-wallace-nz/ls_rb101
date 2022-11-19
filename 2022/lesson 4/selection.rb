alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do
  current_char = alphabet[counter]

  if current_char == 'g'
    selected_chars << current_char
  end

  counter += 1
  break if counter == alphabet.size
end

puts selected_chars




def select_vowels(str)
  selected_chars = ''
  counter = 0

  loop do
    current_char = str[counter]

    if 'aeiouAEIOU'.include?(current_char)
      selected_chars << current_char
    end

    counter += 1
    break if counter == str.size
  end

  selected_chars
end

puts select_vowels('the quick brown fox')

sentence = 'I wandered lonely as a cloud'
puts select_vowels(sentence)

number_of_vowels = select_vowels('hello world').size
puts number_of_vowels


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  selected_fruit = {}
  counter = 0
  keys = hash.keys
  values = hash.values

  loop do
    break if counter == keys.size

    current_key = keys[counter]
    current_value = values[counter]

    if current_value == 'Fruit'
      selected_fruit[current_key] = current_value
    end

    counter += 1
  end

  selected_fruit
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
