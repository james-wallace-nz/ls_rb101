# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].


# Code

def flip_switch(switch)
  switch == 0 ? 1 : 0
end

def on_lights(switches)
  on_lights = []
  switches.each_with_index do |light, index|
    if light == 1
      on_lights << (index + 1)
    end
  end
  on_lights
end

def lights(n)
  switches = [0] * n
  1.upto(n) do |multiple|
    switches.each_with_index do |switch, index|
      if (index + 1) % multiple == 0
        switches[index] = flip_switch(switch)
      end
    end
  end
  on_lights(switches)
end


# Problem

# Bank of light switches size 1 to n
# Lights are either on or off, all start off
# Frist, toggle every multiple of 1
# then toggle every multiple of 2
# then toggle every multiple of 3, etc.
# repeat n times

# Inputs: integer for number of switches, greater than 0
# Output: array of lights that are on, value equals 1


# Examples

p lights(5) == [1, 4]     # [1, 0, 0, 1, 0]
p lights(10) == [1, 4, 9] # [1, 0, 0, 1, 0, 0, 0, 0, 1, 0]

# Data Structures
# array holds lights as on or off (1 or 0)


# Alogrithm

# - create array of n x zeros
# - loop n times with index 'multiple'
#   - inside loop, iterate through all switches
#   - if switch (index + 1) is a multiple of current loop idx
#     - flip switch from 1 to 0 or 0 to 1
# - return array of switches that are on