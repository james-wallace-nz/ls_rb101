# Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1.

# def decrease(counter)
#   counter -= 1
# end

# counter = 10

# 10.times do
#   puts counter
#   decrease(counter)
# end

# puts 'LAUNCH!'

# The counter variable is outside of the method definition and the method cannot mutate an integer

counter = 10

10.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'

# the counter parameter in the decrease method is different to the counter variable initialised on line 7
# The return value of the decrease method is not used anywhere

puts '---'

# We specify 10 two times, which looks a bit redundant. It should be possible to specify it only once. Can you refactor the code accordingly?

counter = 10

counter.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'
