# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

# input: string
# output: string
# data structure: array
# algorithm:
# 1. split string into sentence based on sentence ending characters (. ! ?)
# 2. split sentence into words based on spaces
# 3. set largest_count variable to 0 and largest_sentence variable to ''
# 4. iterate through sentences saving to largest_count and largest_sentence if current is > existing values
# 5. Return largest_count and largest_sentence

# Example text:

# Four score and seven years ago our fathers brought forth
# on this continent a new nation, conceived in liberty, and
# dedicated to the proposition that all men are created
# equal.

# Now we are engaged in a great civil war, testing whether
# that nation, or any nation so conceived and so dedicated,
# can long endure. We are met on a great battlefield of that
# war. We have come to dedicate a portion of that field, as
# a final resting place for those who here gave their lives
# that that nation might live. It is altogether fitting and
# proper that we should do this.

# But, in a larger sense, we can not dedicate, we can not
# consecrate, we can not hallow this ground. The brave
# men, living and dead, who struggled here, have
# consecrated it, far above our poor power to add or
# detract. The world will little note, nor long remember
# what we say here, but it can never forget what they
# did here. It is for us the living, rather, to be dedicated
# here to the unfinished work which they who fought
# here have thus far so nobly advanced. It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.

# The longest sentence in the above text is the last sentence; it is 86 words long. (Note that each -- counts as a word.)

# def largest(string)
#   largest_count = 0
#   largest_sentence = ''
#   sentences = string.split(/\.|\?|\!/)
#   sentences.each do |sentence|
#     size = sentence.split.size
#     if size > largest_count
#       largest_count = size
#       largest_sentence = sentence
#     end
#   end
#   "#{largest_count} words: #{largest_sentence}"
# end

def largest(string)
  sentences = string.split(/\.|\?|\!/)
  largest_sentence = sentences.max_by { |sentence| sentence.split.size }
  largest_sentence = largest_sentence.strip
  largest_count = largest_sentence.split.size
  "#{largest_count} words: #{largest_sentence}"
end

text = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

puts largest(text)

puts '----'

book = ''
File.open("pg84.txt", mode = 'r') do |file|
  book = file.read
end

puts largest(book)

puts '----'

# You may have noticed that our solution fails to print the period at the end of the sentence. Can you write a solution that keeps the period printed at the end of each sentence?

def largest(string)
  sentences = string.split(/\.|\?|\!/)
  largest_sentence = sentences.max_by { |sentence| sentence.split.size }
  largest_sentence = largest_sentence.strip
  largest_count = largest_sentence.split.size
  index = string.index(largest_sentence)
  largest_sentence = string[index, largest_sentence.size + 1]
  "#{largest_count} words: #{largest_sentence}"
end

text = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

puts largest(text)

puts '----'

puts largest(book)

puts '----'

# What about finding the longest paragraph or longest word? How would we go about solving that problem?

def largest_word(string)
  words = string.split
  largest_word = words.max_by { |word| word.size }
  largest = largest_word.size
  "#{largest} characters: #{largest_word}"
end

puts largest_word(text)

puts '----'

puts largest_word(book)
