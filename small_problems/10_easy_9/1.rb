# Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

def greetings(array, hash)
  "Hello, #{array.join(' ')}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

# Example:

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# This method doesn't actually pass rubocop! What is the best way to shorten the lines in this method so it doesn't exceed the 80 maximum characters to a line?

def greetings(array, hash)
  "Hello, #{array.join(' ')}! Nice to have a #{hash.values.join(' ')} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
