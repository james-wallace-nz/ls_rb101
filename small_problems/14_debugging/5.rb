# require 'pry'

# We started working on a card game but got stuck. Check out why the code below raises a TypeError.

# Once you get the program to run and produce a sum, you might notice that the sum is off: It's lower than it should be. Why is that?

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

# binding.pry

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
  # binding.pry
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  scores = remaining_cards.map do |card|
    score(card)
  end

  sum += scores.sum
end

puts sum

# remaining_cards.map creates a new array which isn't used. We can set a new variable and use that on line 38

total_sum = 4 * [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].sum
player_sum = player_cards.map { |card| score(card) }.sum
puts(sum == total_sum - player_sum)

# deck hash is initialised with the same cards array for each suit
# need to clone the cards array
