# Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

# inputs:
# array - joining elements creates a name
# hash - title and occupation
# outputs return greeting containing full anme and title and occupation

def greetings(names, job)
  full_name = names.join(' ')
  "Hello, #{full_name}! Nice to have a #{job[:title]} #{job[:occupation]} around."
end

# Example:
puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == "Hello, John Q Doe! Nice to have a Master Plumber around."
