# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# input: number of switches, and number of repititions
# output: array of switches that are on

# for each iteration, toggle switches that are a multiple of that iteration.
# toggle means switch on or off
# Need to track lights that are on and off in two separate arryas

# algorithm:
# 1. create off array containing 1.n lights
# 2. create emptuy on array
# 3. iterate n times
# 4. for each iteration, iterate through off and on arrays and move switches to other array if multiple of n
# 5. return on array

# def switches(n)
#   off = [*1..n]
#   move_to_on = []
#   move_to_off = []
#   on = []

#   n.times do |iteration|
#     off.each do |switch|
#       if switch % (iteration + 1) == 0
#         move_to_on << switch
#       else
#         move_to_off << switch
#       end
#     end

#     on.each do |switch|
#       if switch % (iteration + 1) == 0
#         move_to_off << switch
#       else
#         move_to_on << switch
#       end
#     end

#     off = move_to_off
#     on = move_to_on
#     move_to_off = []
#     move_to_on = []
#   end
#   on.sort
# end

def toggle_switches(lights, iteration)
  lights.each do |light, state|
    if (light % iteration).zero?
      lights[light] = state.zero? ? 1 : 0
    end
  end
end

def lights_with_status(lights, status = 1)
  lights.select do |_light, state|
    status == state
  end
end

def print_status(lights)
  off = lights_with_status(lights, 0).keys
  off[-1] = "and #{off[-1]}"
  off = off.join(', ')
  puts "#{off} are now off"

  on = lights_with_status(lights).keys
  on[-1] = "and #{on[-1]}"
  on = on.join(', ')
  puts "#{on} are now on"
end

def switches(iterations)
  switches = {}
  iterations.times { |num| switches[num + 1] = 0 }

  1.upto(iterations) do |iteration|
    toggle_switches(switches, iteration)
  end

  print_status(switches)
  lights_with_status(switches).keys
end

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# examples:

p switches(5) == [1, 4]
# 1, 2, 3, 4, 5
# 1, 3, 5       2, 4
# 1, 5          2, 3, 4
# 1, 4, 5       2, 3
# 1, 4          2, 3, 5

p switches(10) == [1, 4, 9]
# p switches(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

puts '---'

# There are a few interesting points about this exercise that we can explore:

# Do you notice the pattern in our answer? Every light that is on is a perfect square. Why is that?

# What are some alternatives for solving this exercise? What if we used an Array to represent our 1000 lights instead of a Hash, how would that change our code?

# We could have a method that replicates the output from the description of this problem (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How would we go about writing that code?
