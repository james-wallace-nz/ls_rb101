require 'yaml'

LANGUAGE = 'es'
MESSAGES = YAML.load_file('calculator_prompts.yml')

def prompt(message)
  Kernel.puts "=> #{message}"
end

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def valid_number?(num)
  number?(num)
end

def number?(num)
  /\d/.match(num) && /^-?\d*\.?\d*$/.match(num)
end

def operation_to_message(operator)
  case operator
  when '1' then messages('add')
  when '2' then messages('subtract')
  when '3' then messages('multiply')
  when '4' then messages('divide')
  end
end

prompt("#{messages('welcome', LANGUAGE)}")

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("#{messages('valid_name', LANGUAGE)}")
  else
    break
  end
end

prompt("#{messages('greeting')} #{name}!")

loop do
  number1 = ''
  loop do
    prompt("#{messages('first_num')}")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("#{messages('invalid_num')}")
    end
  end

  number2 = ''
  loop do
    prompt("#{messages('second_num')}")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("#{messages('invalid_num')}")
    end
  end

  operator_prompt = <<-MSG
    #{messages('operation')}
    #{messages('op_1')}
    #{messages('op_2')}
    #{messages('op_3')}
    #{messages('op_4')}
   MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("#{messages('choose')}")
    end
  end

  prompt("#{operation_to_message(operator)} #{messages('action')}")

  result =  case operator
            when '1' then number1.to_f + number2.to_f
            when '2' then number1.to_f - number2.to_f
            when '3' then number1.to_f * number2.to_f
            when '4'
              if number2.to_f == 0
                "#{messages('div_zero')}"
              else
                number1.to_f / number2.to_f
              end
            end

  prompt("#{messages('result')} #{result}")

  prompt("#{messages('repeat')}")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("#{messages('thanks', LANGUAGE)}")


# 4. Extracting messages in the program to a configuration file.

# There are lots of messages sprinkled throughout the program. Could we move them into some configuration file and access by key? This would allow us to manage the messages much easier, and we could even internationalize the messages.


# 5. Your calculator program is a hit, and it's being used all over the world! Problem is, not everyone speaks English. You need to now internationalize the messages in your calculator. You've already done the hard work of extracting all the messages to a configuration file. Now, all you have to do is send that configuration file to translators and call the right translation in your code.
