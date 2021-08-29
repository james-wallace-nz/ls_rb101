# String#upcase! is a destructive method, so why does this code print HEY you instead of HEY YOU? Modify the code so that it produces the expected output.

def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

# On `line 2`, the `each` method is called on the new Array returned by the `chars` method call. This new array contains a new String object for each character in the `name` String.

# In the block passed to the `each` method as an argument, the `upcase!` method is called on each element in the new Array in turn. This doesn't affect the `name` local variable.

# On `line 4`, the unchanged `name` local variable is concatenated to 'HEY' and printed out.

def shout_out_to(name)
  name = name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name.join
end

shout_out_to('you') # expected: 'HEY YOU'
