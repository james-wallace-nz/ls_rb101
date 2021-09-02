# We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! do |word|
    negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')

# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# The array is being mutated on the `each` iteration.

puts '---'

def neutralize_loop(sentence)
  words = sentence.split(' ')
  i = 0

  loop do
    break if i == words.length

    if negative?(words[i])
      words.delete_at(i)
    else
      i += 1
    end
  end

  words.join
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
