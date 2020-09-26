# A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.

# A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. Operations that require two values pop the topmost item from the stack (that is, the operation removes the most recently pushed value from the stack), perform the operation using the popped value and the register value, and then store the result back in the register.

# Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and then stores the result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, then the stack is transformed to 3, and the register is left with the value 168.

# Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

# You should initialize the register to 0.

# Input: string, register = 0
# Output: if print then print, otherwise modify register and stack

# Data structures:
# operations = string that needs to be broken into integers and operations (strings) by splitting by spaces
# stack = array
# register = int

# Problem:

# stack = array of values
# register = current value (separate to stack)

# operation applies to register
# if operation requires 2 values, pop from stack and perform operation with that and register value
# store result back in register


# mult: stack = 3, 6, 4. register = 7. mult = 7 * 4. register = 28. stack = 3, 6.

# Operations:
# n
# register = n

# PUSH
# stack.push(register)

# ADD
# register = register + stack.pop

# SUB
# register = register - stack.pop

# MULT
# register = register * stack.pop

# DIV
# register = register / stack.pop

# MOD
# register = register % stack.pop

# POP
# register = stack.pop

# PRINT
# print register

# all are integer operations

def minilang(operations)
  stack = []
  register = 0
  operations.split.each do |operation|
    case operation
    when 'PUSH'   then stack.push(register)
    when 'ADD'    then register += stack.pop
    when 'SUB'    then register -= stack.pop
    when 'MULT'   then register *= stack.pop
    when 'DIV'    then register /= stack.pop
    when 'MOD'    then register %= stack.pop
    when 'POP'    then register = stack.pop
    when 'PRINT'  then puts register
    else               register = operation.to_i
    end
  end
  register
end

# Examples:

p minilang('PRINT')
# 0

puts '---'

p minilang('5 PUSH 3 MULT PRINT')
# 15

puts '---'

p minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

puts '---'

p minilang('5 PUSH POP PRINT')
# 5

puts '---'

p minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

puts '---'

p minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

puts '---'

p minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

puts '---'

p minilang('-3 PUSH 5 SUB PRINT')
# 8

puts '---'

p minilang('6 PUSH')
# (nothing printed; no PRINT commands)

puts '---'

# Try writing a minilang program to evaluate and print the result of this expression:

# (3 + (4 * 5) - 7) / (5 % 3)
# The answer should be 8. This is trickier than it sounds! Note that we aren't asking you to modify the #minilang method; we want you to write a Minilang program that can be passed to #minilang and evaluated.

p minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV')

# '3 PUSH'
# 3
# [3]

# '5 MOD'
# 5 % 3
# 2
# []

# 'PUSH'
# 2
# [2]

# '7 PUSH'
# 7
# [2, 7]

# '4 PUSH'
# 4
# [2, 7, 4]

# '5'
# 5
# [2, 7, 4]

# 'MULT'
# 5 * 4
# 20
# [2, 7]

# 'PUSH'
# 20
# [2, 7, 20]

# '3'
# 3
# [2, 7, 20]

# 'ADD'
# 3 + 20
# 23
# [2, 7]

# 'SUB'
# 23 - 7
# 16
# [2]

# 'DIV'
# 16 / 2
# 8
# []

puts '---'

# Add some error handling to your method. In particular, have the method detect empty stack conditions, and invalid tokens in the program, and report those. Ideally, the method should return an error message if an error occurs, and nil if the program runs successfully.

STACK_POP = ['ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP']

def minilang(operations)
  stack = []
  register = 0
  operations.split.each do |operation|
    if STACK_POP.include?(operation.upcase)
      if stack.size.zero?
        return 'stack is empty'
      else
        case operation.upcase
        when 'ADD'    then register += stack.pop
        when 'SUB'    then register -= stack.pop
        when 'MULT'   then register *= stack.pop
        when 'DIV'    then register /= stack.pop
        when 'MOD'    then register %= stack.pop
        when 'POP'    then register = stack.pop
        end
      end
    else
      case operation.upcase
      when 'PUSH'   then stack.push(register)
      when 'PRINT'  then puts register
      else
        if operation.to_i.to_s == operation
          register = operation.to_i
        else
          return 'invalid operation'
        end
      end
    end
  end
  nil
end

p minilang('3 push 5 mod push 7 push 4 push 5 mult push 3 add sub div print')
