# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# input: string
# output: true/false

# def balanced?(string)
#   brackets = string.delete('^()').chars
#   p brackets
#   return true if brackets.size.zero?
#   return false if string.count('(') != string.count(')')
#   left = 0
#   right = 0
#   brackets.each_with_index do |bracket, index|
#     increment = index.even? ? 0 : 1
#     if bracket == '('
#       left += increment
#     else
#       right += increment
#     end
#   end
#   # left < right
#   "#{left}, #{right}: #{left < right}"
# end

def balanced?(string)
  brackets = string.delete('^()')
  return true if brackets.size.zero?
  return false if brackets.count('(') != brackets.count(')')

  balanced = 0
  brackets.chars.each do |bracket|
    balanced += bracket == '(' ? 1 : -1
    return false if balanced.negative?
  end
  true
end

# solution:

def balanced?(string)
  parens = 0
  string.chars.each do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens.negative?
  end
  parens.zero?
end

# Examples:

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# Note that balanced pairs must each start with a (, not a ).

puts '-----'

# There are a few other characters that should be matching as well. Square brackets and curly brackets normally come in pairs. Quotation marks(single and double) also typically come in pairs and should be balanced. Can you expand this method to take into account those characters?

def balanced?(string)
  curly_brackets = 0
  square_brackets = 0
  single_quote = 0
  double_quote = 0
  string.chars.each do |char|
    curly_brackets += 1 if char == '('
    curly_brackets -= 1 if char == ')'
    break if curly_brackets.negative?

    square_brackets += 1 if char == '['
    square_brackets -= 1 if char == ']'
    break if square_brackets.negative?

    single_quote += 1 if char == '\''
    double_quote += 1 if char == '"'
  end
  curly_brackets.zero? && square_brackets.zero? && single_quote.even? && double_quote.even?
end

p balanced?('What \'is\' this?') == true
p balanced?('What "is this?') == false
p balanced?('What [is this?') == false
p balanced?('""What"" \'is this\'?') == true
p balanced?('""What"" \'is this\'\'?') == false
p balanced?('Hey!') == true
p balanced?(']Hey![') == false
p balanced?('What [[is]]] up[') == false
