# ask for 2 numbers
# ask for operation - add, subtract, multiply, divide
# display result

Kernel.puts('What is your first number?')
first = Kernel.gets().chomp().to_f()

Kernel.puts('What is your first number?')
second = Kernel.gets().chomp().to_f()

Kernel.puts('What is your operation (add, subtract, multiply, divide)?')
operation = Kernel.gets().chomp()

case operation
when 'add'        then puts "#{first + second}"
when 'subtract'   then puts "#{first - second}"
when 'multiply'   then puts "#{first * second}"
when 'divide'     then puts "#{first / second}"
else                   puts 'Invalid operation'
end
