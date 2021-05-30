# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# input: integer for number of sides
# outputs: right aligned triangle of *
# algorithm:
# 1. loop through 1 to input
# 2. set stars and spaces to 1 and input - stars
# 3. print right justified stars
# 4. increment stars and decrement spaces

def triangle(input)
  count = 1
  stars = '*'
  until count > input
    puts stars.rjust(input)
    stars += '*'
    count += 1
  end
end

def triangle(input)
  stars = 1
  spaces = input - stars
  input.times do
    puts (' '* spaces) + ('*' * stars)
    stars += 1
    spaces -= 1
  end
end

# Examples:

# triangle(5)

#     *
#    **
#   ***
#  ****
# *****

# triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

# Try modifying your solution so it prints the triangle upside down from its current orientation.

def triangle(input)
  stars = input
  spaces = 0
  input.times do
    puts (' '* spaces) + ('*' * stars)
    stars -= 1
    spaces += 1
  end
  puts
end

triangle(9)

# *********
#  ********
#   *******
#    ******
#     *****
#      ****
#       ***
#        **
#         *


# Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.

def triangle(num, direction = 'bottom', alignment = 'right')
  if direction == 'bottom'
    stars = 1
    spaces = num - 1
  elsif direction == 'top'
    stars = num
    spaces = 0
  end

  num.times do
    if direction == 'bottom'
      if alignment == 'right'
        puts (' '* spaces) + ('*' * stars)
      elsif alignment == 'left'
        puts ('*' * stars) + (' '* spaces)
      end
      stars += 1
      spaces -= 1
    elsif direction == 'top'
      if alignment == 'right'
        puts (' '* spaces) + ('*' * stars)
      elsif alignment == 'left'
        puts ('*' * stars) + (' '* spaces)
      end
      stars -= 1
      spaces += 1
    end
  end
  puts
end

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

# counts stars up

# spaces left

triangle(9, 'bottom', 'right')

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

# spaces right

triangle(9, 'bottom', 'left')

# *
# **
# ***
# ****
# *****
# ******
# *******
# ********
# *********

# counts stars down

# spaces left

triangle(9, 'top', 'right')

# *********
#  ********
#   *******
#    ******
#     *****
#      ****
#       ***
#        **
#         *

# spaces right

triangle(9, 'top', 'left')

# *********
# ********
# *******
# ******
# *****
# ****
# ***
# **
# *
