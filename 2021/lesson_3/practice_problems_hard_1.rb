# 1

# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

# returns `nil`
# Local variables initialized within an if block are accessible outside of the if block. They will be initialized to `nil` if the if block doesn't get executed.
# In this case, if false means the greeting = 'hello world' branch is not evaluated


# 2

# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# informal_greeting is assigned to the same object as greetings[:a], which is the string 'hi'.
# The object that informal_greeting references is mutated by the string#<< method call which appends ' there' to 'hi'
# The greetings hash :a key still references the same object as informal_greeting, so will now be 'hi there'
# `puts greetings` will, therefore, output {:a => 'hi there'}

# The `String#<<` method, which modifies the object that called it. This means that the original object wwas changed thereby impacting the value in  `greetings`


# 3

# In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# one is: one
# two is: two
# three is: three


# B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# one is: one
# two is: two
# three is: three


# C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# one is: two
# two is: three
# three is: one



# 4

# Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric string between 0 and 255 as required for IP numbers and asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

# Help Ben fix his code.

def is_an_ip_number?(number)
  number.to_i >= 0 && number.to_i <= 255
end

def dot_separated_ip_address?(input_string)
  result = false
  dot_separated_words = input_string.split('.')
  return result unless dot_separated_words.size == 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    result = true if is_an_ip_number?(word)
  end
  result
end

puts dot_separated_ip_address?('10.4.5.11') == true
puts dot_separated_ip_address?('1.2.3.4.5') == false
puts dot_separated_ip_address?('4.5.5') == false
