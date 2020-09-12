# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

puts spin_me("hello world") # "olleh dlrow"

a = "hello world"
puts a.object_id

puts spin_me(a)
puts a

puts spin_me(a).object_id


# No, the split method creates an array with new string elements for each word in the original string.
# reverse! mutates those string elements, but not the words within the original string
# the spin_me method joins the array elements back into one new string, which is returned.
# The original string is not modified and the string returned is a different object to the object passed into the method
