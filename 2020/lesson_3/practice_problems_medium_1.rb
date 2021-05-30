# 1

# Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

# For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

10.times { |number| puts "#{' ' * number} The Flintstones Rock!"}



# 2

# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# No implicit conversion of integer to string. Either interpolate the addition or explicitly convert to string

puts "the value of 40 + 2 is " + (40 + 2).to_s

puts "the value of 40 + 2 is #{(40 + 2)}"



# 3

# Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor <= 0
  factors
end

# factors(0)

# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using begin/end/until? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

def factors(number)
  divisor = number
  factors = []
  until divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(-1)

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(-1)

# Bonus 1
# What is the purpose of the number % divisor == 0 ?

# If a number is evenly divisible by the divisor then it has no remainder. Modulo returns the remainder, which will be 0


# Bonus 2
# What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?

# The last line of the method 'factors' ensures that the factors variable containing an array of the number's factors is returned by the method



# 4

# Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# 'buffer << mutatates' the existing buffer variable in main
# 'buffer = input_array + [new element]' assigns to a new buffer variable that is local to the method definition. The second method will have to re-assign its return to the main buffer variable to keep track of the buffer value

buffer = [1, 2, 3, 4, 5]

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

rolling_buffer1(buffer, 5, 6)
p buffer
# => [2, 3, 4, 5, 6]


buffer = [1, 2, 3, 4, 5]

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

buffer = rolling_buffer2(buffer, 5, 6)
p buffer
# => [2, 3, 4, 5, 6]



# 5

# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

# limit = 15

# def fib(first_num, second_num)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1)
# puts "result is #{result}"

# limit is a local variable in main, and it is not visible to the scope of fib method definition because it is not passed in as an argument


# How would you fix this so that it works?

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"


# 6

# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# answer is not mutated or re-assigned by the method call so remains at 42. p 42 - 8 = 34


# 7

# One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)
p munsters

# Did the family's data get ransacked? Why or why not?

# yes, demo_has.values returns an array of the values in munsters. Each family_member element is a hash of age and gender keys. family_memebr[age] and family_member[gender] keys are re-assigned += 42 and to 'other'. This mutates the original hash

# Solution:
# Remember that in Ruby, what gets passed in the parameter list is not what it appears. Under the hood, Ruby passes the object id of each item rather than the value of the parameter. The method internally stores these object id's in locally scoped (private to the method) variables (named per the method definition's parameter list).

# So Spot's demo_hash starts off pointing to the munsters hash. His program could wind up replacing that with some other object id and then the family's data would be safe.

# In this case, the program does not reassign demo_hash -- it just uses it as-is. So the actual hash object that is being messed with inside of the method IS the munsters hash.


# 8

# Method calls can take expressions as arguments. Suppose we define a method called rps as follows, which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares whatever hand was used in the tie as the result of that tie.

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# What is the result of the following call?

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")


rps(
  rps(
    rps("rock", "paper"),         # => 'paper'
    rps("rock", "scissors")),     # => 'rock'
  "rock")

rps(
  rps(
    'paper',
    'rock'),                     # => 'paper'
  "rock")

rps(
  'paper',
  "rock")                         # => 'paper'


# 9

# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?

puts bar(foo)

# foo()
# = foo('no')
# => 'yes'

# bar('yes')
# = 'yes' == 'no' ? 'yes' : 'no'
# => 'no'
