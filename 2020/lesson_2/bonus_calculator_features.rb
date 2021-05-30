messages = []

def prompt(message)
  Kernel.puts "=> #{message}"
end

def save_messages(array)
  file = open('ENG-prompts.txt')
  file.readlines.each { |line| array.push(line.chomp) }
  file.close
end

save_messages(messages)

# Validate Integers
# def valid_number?(num)
#   # my attempt /\d*/.match(num)
#   # Solution
#   /^-?\d+$/.match(num)
# end

# Validate Decimals

# def valid_number?(num)
#   num.to_f.to_s == num
#   # or
#   /^-?\d*\.?\d*$/.match(num)
# end

# Solution

def valid_number?(num)
  number?(num)
end

def number?(num)
  # integer?(num) || float?(num)
  /\d/.match(num) && /^-?\d*\.?\d*$/.match(num)
end

# def integer?(num)
#   Integer(num) rescue false
# end

# def float?(num)
#   Float(num) rescue false
# end

def operation_to_message(operator, messages)
  case operator
  when '1' then messages[0]
  when '2' then messages[1]
  when '3' then messages[2]
  when '4' then messages[3]
  end
end

prompt("#{messages[4]}")

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("#{messages[5]}")
  else
    break
  end
end

prompt("#{messages[6]} #{name}!")

loop do
  number1 = ''
  loop do
    prompt("#{messages[7]}")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("#{messages[8]}")
    end
  end

  number2 = ''
  loop do
    prompt("#{messages[9]}")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("#{messages[8]}")
    end
  end

  operator_prompt = <<-MSG
    #{messages[10]}
    #{messages[11]}
    #{messages[12]}
    #{messages[13]}
    #{messages[14]}
   MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("#{messages[15]}")
    end
  end

  prompt("#{operation_to_message(operator, messages)} #{messages[16]}")

  result =  case operator
            when '1' then number1.to_f + number2.to_f
            when '2' then number1.to_f - number2.to_f
            when '3' then number1.to_f * number2.to_f
            when '4'
              if number2.to_f == 0
                "#{messages[17]}"
              else
                number1.to_f / number2.to_f
              end
            end

  prompt("#{messages[18]} #{result}")

  prompt("#{messages[19]}")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("#{messages[20]}")



# 1. Better integer validation

# The current method of validating the input for a number is very weak. It's also not fully accurate, as you cannot enter a 0. Come up with a better way of validating input for integers.

# 1a. num.to_i.to_s = num

# or

# 1b. regex digits 0-9  = /\d/
# 2. if 0 then division error


# 2. Number validation

# Suppose we're building a scientific calculator, and we now need to account for inputs that include decimals. How can we build a validating method, called number?, to verify that only valid numbers -- integers or floats -- are entered?


# 3. Our operation_to_message method is a little dangerous, because we're relying on the case statement being the last expression in the method. What if we needed to add some code after the case statement within the method? What changes would be needed to keep the method working with the rest of the program?

# If there are more lines of code below the case statement then we must save the return value of the case statement into a variable and then return that variable or have that variable as the last line of the method.


# 4. Extracting messages in the program to a configuration file.

# There are lots of messages sprinkled throughout the program. Could we move them into some configuration file and access by key? This would allow us to manage the messages much easier, and we could even internationalize the messages.


# 5. Your calculator program is a hit, and it's being used all over the world! Problem is, not everyone speaks English. You need to now internationalize the messages in your calculator. You've already done the hard work of extracting all the messages to a configuration file. Now, all you have to do is send that configuration file to translators and call the right translation in your code.
