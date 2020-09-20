# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(string)
  new_string = ''
  string.each_char { |char| new_string << char << char }
  new_string
end

# Examples:

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
