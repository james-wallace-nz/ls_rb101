# ask for 2 numbers
# ask for operation - add, subtract, multiply, divide
# display result

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(operator)
  case operator
  when '1' then 'Adding'
  when '2' then 'Subtracting'
  when '3' then 'Multiplying'
  when '4' then 'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  first = ''
  second = ''
  operator = ''

  loop do
    prompt('What is your first number?')
    first = Kernel.gets().chomp()
    break if valid_number?(first)
    prompt ("Invalid number")
  end

  loop do
    prompt('What is your second number?')
    second = Kernel.gets().chomp()
    break if valid_number?(second)
    prompt ("Invalid number")
  end

  # prompt("What is your operation \n 1) add \n 2) subtract \n 3) multiply \n 4) divide)?")

  # Heredoc
  operator_prompt = <<-MSG
    What is your operation
      1) add
      2) subtract
      3) multiply
      4) divide
  MSG

  prompt(operator_prompt)

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers....")

  result = case operator
  when '1'   then "#{first.to_i + second.to_i}"
  when '2'   then "#{first.to_i - second.to_i}"
  when '3'   then "#{first.to_i * second.to_i}"
  when '4'   then "#{first.to_f / second.to_f}"
  else          'Invalid operation'
  end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Goodbye')