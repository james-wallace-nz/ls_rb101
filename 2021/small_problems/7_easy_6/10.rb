# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

def triangle(n)
  n.times do |row|
    puts "#{' ' * (n - row - 1)}#{'*' * (row + 1)}"
  end
end

def triangle(n)
  spaces = n - 1
  stars = 1
  while stars <= n
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

# Examples:

triangle(5)
#     *
#    **
#   ***
#  ****
# *****

puts '---------'

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
