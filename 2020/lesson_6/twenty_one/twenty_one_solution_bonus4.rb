require 'pry'

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards, total)
  total > 21
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards, player_total, dealer_total, score)
  if player_total > 21
    score[1] += 1
    :player_busted
  elsif dealer_total > 21
    score[0] += 1
    :dealer_busted
  elsif dealer_total < player_total
    score[0] += 1
    :player
  elsif dealer_total > player_total
    score[1] += 1
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards, player_total, dealer_total, score)
  result = detect_result(dealer_cards, player_cards, player_total, dealer_total, score)
  puts "=============="
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def display_score(score)
  prompt "Dealer has a score of: #{score[1]}"
  prompt "Player has a score of: #{score[0]}"
  puts "=============="
end

def game_result(player_cards, dealer_cards, player_total, dealer_total, score)
  display_result(player_cards, dealer_cards, player_total, dealer_total, score)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "=============="
  display_score(score)
end

def end_game_score?(score)
  score.any?(5)
end

def play_again?(score)
  !end_game_score?(score)
  # puts "-------------"
  # prompt "Do you want to play again? (y or n)"
  # answer = gets.chomp
  # answer.downcase.start_with?('y')
end

score = [0, 0]
prompt "Welcome to Twenty-One!"

loop do
  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)
  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, " \
          "for a total of #{player_total}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      player_total = total(player_cards)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's' || busted?(player_cards, player_total)
  end

  if busted?(player_cards, player_total)
    game_result(player_cards, dealer_cards, player_total, dealer_total, score)
    play_again?(score) ? next : break
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if dealer_total >= 17
    prompt "Dealer hits!"
    dealer_cards << deck.pop
    dealer_total = total(dealer_cards)
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards, dealer_total)
    prompt "Dealer total is now: #{dealer_total}"
    game_result(player_cards, dealer_cards, player_total, dealer_total, score)
    end_game?(score)
    play_again?(score) ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  game_result(player_cards, dealer_cards, player_total, dealer_total, score)

  break unless play_again?(score)
end

prompt "Thank you for playing Twenty-One! Good bye!"
