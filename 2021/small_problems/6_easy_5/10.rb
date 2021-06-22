# Write a method that will take a short line of text, and print it within a box.

def print_in_box(string)
  width = string.size + 2
  horizontal = '+' + '-' * width + '+'
  middle = '|' + ' ' * width + '|'
  text = '|' + ' ' + string +' ' + '|'
  p horizontal
  p middle
  p text
  p middle
  p horizontal
end

# Example:
print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# You may assume that the input will always fit in your terminal window.

