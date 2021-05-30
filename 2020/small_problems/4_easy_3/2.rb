# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

# Example

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

def prompt(msg)
  puts "=> #{msg}"
end

prompt 'Enter the first number:'
first = gets.chomp.to_f

prompt 'Enter the second number:'
second = gets.chomp.to_f

add = first + second
subtract = first - second
multiply = first * second
divide = second.zero? ? 'zero division error' : first / second
remainder = second.zero? ? 'zero division error' : first % second
power = first**second

prompt "#{first} + #{second} = #{add}"
prompt "#{first} - #{second} = #{subtract}"
prompt "#{first} * #{second} = #{multiply}"
prompt "#{first} / #{second} = #{divide}"
prompt "#{first} % #{second} = #{remainder}"
prompt "#{first} ** #{second} = #{power}"

# There are some edge cases to consider in this exercise.
# We have to be careful of not having a second number that is zero.
# What if we wanted to use floats instead of integers? How does this change this problem?
