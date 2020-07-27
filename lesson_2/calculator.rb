# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

def request_num(order)
  print "What is the #{order} number?: "
  gets.chomp
end

def request_operation
  puts "What operation do you want to perform? \n  1) Add \n  2) Subtract \n  3) Multiply \n  4) Divide"
  gets.chomp
end

num_one = request_num('first')
num_two = request_num('second')
operation = request_operation

case operation
when '1'
  result = num_one.to_i + num_two.to_i
  operation_text = 'plus'
when '2'
  result = num_one.to_i - num_two.to_i
  operation_text = 'minus'
when '3'
  result = num_one.to_i * num_two.to_i
  operation_text = 'times'
when '4'
  result = num_one.to_i / num_two.to_f
  operation_text = 'divided by'
end

puts "#{num_one} #{operation_text} #{num_two} equals #{result}"
