# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

a = "hello world"
p a.object_id
p spin_me(a).object_id # "olleh dlrow"

# the returned string will be a new object not the original string passed in as an argument
# str.split creates an array object which is iterated over with #each.
# #join is then called on the array returned by #each, which creates a new string object
# this new string object is returned by the method.
