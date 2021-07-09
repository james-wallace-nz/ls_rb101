# Write a method that takes a string, and returns a new string in which every character is doubled.

# iterate through string add character twice to new string

def repeater(string)
  new_string = []
  (0...string.size).each do |index|
    new_string << string[index] << string[index]
  end
  new_string.join
end

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

# Examples:
puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
