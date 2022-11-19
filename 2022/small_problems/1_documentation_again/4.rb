a = [1, 4, 8, 11, 15, 19]

# How would you search this Array to find the first element whose value exceeds 8?

# https://ruby-doc.org/core-2.5.0/Array.html#method-i-bsearch

puts a.bsearch { |e| e > 8 }
