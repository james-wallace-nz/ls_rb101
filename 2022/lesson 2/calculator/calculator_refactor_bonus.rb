# ask for 2 numbers
# ask for operation - add, subtract, multiply, divide
# display result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# pp MESSAGES

languages = MESSAGES['languages'].map { |k, v| v }

chosen_lang = ''
loop do
  puts "Which language do you want to use?"
  languages.each { |language| puts language }
  chosen_lang = gets.chomp
  break if languages.include?(chosen_lang)
  puts "Invalid languages"
end

lang = MESSAGES['languages'].select { |k, v| v == chosen_lang }.keys.first

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  /\d/.match(num) && /^-?\d*\.?\d*$/.match(num)
  # begin
  #   Integer(num)
  # rescue ArgumentError
  #   false
  # end
  # /^-?\d+$/.match(num)
  # num.to_i.to_s == num
end

def operation_to_message(operator, lang)
  operation = case operator
              when '1' then MESSAGES[lang]['adding']
              when '2' then MESSAGES[lang]['subtracting']
              when '3' then MESSAGES[lang]['multiplying']
              when '4' then MESSAGES[lang]['dividing']
              end
  operation
end

prompt(MESSAGES[lang]['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES[lang]['valid_name'])
  else
    break
  end
end

prompt(MESSAGES[lang]['welcome_name'] + name + '!')

loop do
  first = ''
  second = ''
  operator = ''

  loop do
    prompt(MESSAGES[lang]['first_number'])
    first = Kernel.gets().chomp()
    break if valid_number?(first)
    prompt (MESSAGES[lang]['invalid_number'])
  end

  loop do
    prompt(MESSAGES[lang]['second_number'])
    second = Kernel.gets().chomp()
    break if valid_number?(second)
    prompt (MESSAGES[lang]['invalid_number'])
  end

  # prompt("What is your operation \n 1) add \n 2) subtract \n 3) multiply \n 4) divide)?")

  # Heredoc
  operator_prompt = MESSAGES[lang]['operator_prompt']

  prompt(operator_prompt)

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES[lang]['invalid_operator'])
    end
  end

  prompt(MESSAGES[lang][operation_to_message(operator, lang) + 'calculating'])

  result = case operator
  when '1'   then "#{first.to_f + second.to_f}"
  when '2'   then "#{first.to_f - second.to_f}"
  when '3'   then "#{first.to_f * second.to_f}"
  when '4'   then "#{first.to_f / second.to_f}"
  else          'Invalid operation'
  end

  prompt(MESSAGES[lang]['result'] + result)

  prompt(MESSAGES[lang]['repeat'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES[lang]['goodbye'])