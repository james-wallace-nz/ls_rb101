# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

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

# Another Example

# Download the book at http://www.gutenberg.org/cache/epub/84/pg84.txt, and run your program on this file.

# The longest sentence in this book is 157 words long.

# PROBLEM:

# Return the longest sentence from a string saved in a text file.

# Input: txt file containing string of words separated by `.`, `?`, `!`
# Output: longest sentence in the string and number of words in that string.
#         Longest sentence has the highest number of words in the sentence.
#         A word is characters separated by spaces. Word includes characters that are not spaces or sentence ending characters.

# What happens if more than one longest sentence?

# Example:

constitution = "Four score and seven years ago our fathers brought forth
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

# Algorithm:
# - Import text file and save to variable
#    - import text file
#    - read text file
#    - assign to variable `sentences`
# - initialize `longest_sentence` to empty Array containing an empty String and `0`: `['', 0]`
# - split string into `sentences` variable by splitting at `'`, `?` or `!`
# - iterate over `sentences` and for each sentence count words in sentence
#   - split `current_sentence` by `' '` and assign to `words` variable
#   - count resulting `words` array size and assign to `word_count` variable
# - if `word_count` is greater than `longest_sentence`, then reassign `longest_sentence` first element to `current_sentence` and second element to `word_count`
# - return longest_sentence with a `.`. Then '\n This has #{second element} words.`'

def import_file(filename)
  File.read(filename)
end

def longest_sentence(filename)
  text = import_file(filename)
  longest_sentence = ['', 0]
  sentences = text.split(/[.?!]/).map(&:strip)
  sentences.each do |sentence|
    words = sentence.split
    word_count = words.size
    if word_count > longest_sentence[1]
      longest_sentence[0] = sentence
      longest_sentence[1] = word_count
    end
  end
  puts "The longest sentence is: \n'#{longest_sentence[0]}'. \n\nThis sentence contains #{longest_sentence[1]} words."
end

# longest_sentence('this is. a question? of great importanance!')

longest_sentence('constitution.txt')

# import_file('constitution.txt')