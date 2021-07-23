# 1.

# Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

# For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

10.times do |spaces|
  puts ' ' * spaces + 'The Flintstones Rock!'
end


# 2.

# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# 40 + 2 = 42, which is an integer and is being added to the string 'the value of 40 + 2 is '. You cannot add two different types together

puts "the value of 40 + 2 is #{40 + 2}"
puts 'the value of 40 + 2 is ' + (40 + 2).to_s


# 3.

# Alan wrote the following method, which was intended to show all of the factors of the input number:

# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using begin/end/until? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

puts factors(10)


# Bonus a:

# What is the purpose of the number % divisor == 0 ?

# numbers % divisor == 0 is used to find divisors that divide perfectly into number. That is, divisors that have no remainder from the division.


# Bonus b:

# What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?

# The method will return the last evaluated expression. Line 8 ensures that the local variable 'factors' is returned by the method as it is the last evaluated expression in the method definition


# 4.

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

# The 'rolling_buffer1' will mutate 'buffer' because `<<` is destructive, while `rolling_buffer2` will return a new array (as `+` returns a new array) but not modify 'input_array'

# Yes, there is a difference. While both methods have the same return value, in the first implementation, the input argument called buffer will be modified and will end up being changed after rolling_buffer1 returns. That is, the caller will have the input array that they pass in be different once the call returns. In the other implementation, rolling_buffer2 will not alter the caller's input argument.


# 5.

# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

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

# How would you fix this so that it works?

# The `limit` local variable is not visible within the scope of the `Fib` method definition because `fib` is a method and does not have access to any local variables outside of its scope. This throws an 'undefined local variable or method NameError' when the method is called.
# Therefore, we must pass in the value of `limit` as an argument in the method invocation


# 6

# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# local variable `answer` is initialized to the integer 42
# local variable `new_answer` is initialized to the return value of the `mess_with_it` method, which is called with local variable `answer` as an argument
# The `some_number` parameter in the `mess_with_it` method definition references the same object that `answer` references
# the `some_number` local variable is reassigned to the value of some_number + 8, which is the integer 50
# new_answer therefore references the integer 50 while the local variable answer is unmodified.
# on line 9, we call the `p` method and pass in the value of `answer` - 8, which is 42 - 8, which is 34. 34 is output


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

# Did the family's data get ransacked? Why or why not?

# Yes, the `munsters` hash is mutated by the `mess_with_demographics` method call
# within the method call, the value for each family member is iterated over
# On each iteration, the `age` key is reassigned to the value of itself + 42 and the `gender` key is assigned to the string 'other'



# in Ruby, what gets passed to a method isn't the value of the object. Under the hood, Ruby passes the object_id of each argument to the method. The method stores these object_id's internally in locally scoped (private to the method) variables (named per the method definition's parameter list).
# In this case, the program does not reassign demo_hash -- it just uses it as-is. So the actual hash object that is being messed with inside of the method IS the munsters hash


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

# rps(

#   rps(
#     rps("rock", "paper"),       => 'paper'

#     rps("rock", "scissors")     => 'rock'

#     ),                     => 'paper'

#   "rock"

#   ) => 'paper'


# 9

# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?

bar(foo)


# on line 9 the `bar` method is called with the return value of the `foo` method (with no arguments) as its argument
# on line 1, the foo method has one parameter `param` with a default value of `no'
# The `foo` method always returns the string `yes` as that is the only expresssion evaluated within the method definition
# Therefore, `bar` is called with the argument `yes`
# On line 6, the method local variable `param` has the value 'yes'. The conditional evaluates to `false` as `param` is not equal to `no`.
# Therefore, the ternary statement returns 'no', which is the last evaluated expression in the `bar` method call. As such, the `bar('yes')` call returns 'no'

