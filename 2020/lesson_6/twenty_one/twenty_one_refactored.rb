CARD_VALUES = {
  ['2', 'Hearts'] => 2,
  ['3', 'Hearts'] => 3,
  ['4', 'Hearts'] => 4,
  ['5', 'Hearts'] => 5,
  ['6', 'Hearts'] => 6,
  ['7', 'Hearts'] => 7,
  ['8', 'Hearts'] => 8,
  ['9', 'Hearts'] => 9,
  ['10', 'Hearts'] => 10,
  ['Jack', 'Hearts'] => 10,
  ['Queen', 'Hearts'] => 10,
  ['King', 'Hearts'] => 10,
  ['Ace', 'Hearts'] => 11,
  ['2', 'Diamonds'] => 2,
  ['3', 'Diamonds'] => 3,
  ['4', 'Diamonds'] => 4,
  ['5', 'Diamonds'] => 5,
  ['6', 'Diamonds'] => 6,
  ['7', 'Diamonds'] => 7,
  ['8', 'Diamonds'] => 8,
  ['9', 'Diamonds'] => 9,
  ['10', 'Diamonds'] => 10,
  ['Jack', 'Diamonds'] => 10,
  ['Queen', 'Diamonds'] => 10,
  ['King', 'Diamonds'] => 10,
  ['Ace', 'Diamonds'] => 11,
  ['2', 'Clubs'] => 2,
  ['3', 'Clubs'] => 3,
  ['4', 'Clubs'] => 4,
  ['5', 'Clubs'] => 5,
  ['6', 'Clubs'] => 6,
  ['7', 'Clubs'] => 7,
  ['8', 'Clubs'] => 8,
  ['9', 'Clubs'] => 9,
  ['10', 'Clubs'] => 10,
  ['Jack', 'Clubs'] => 10,
  ['Queen', 'Clubs'] => 10,
  ['King', 'Clubs'] => 10,
  ['Ace', 'Clubs'] => 11,
  ['2', 'Spades'] => 2,
  ['3', 'Spades'] => 3,
  ['4', 'Spades'] => 4,
  ['5', 'Spades'] => 5,
  ['6', 'Spades'] => 6,
  ['7', 'Spades'] => 7,
  ['8', 'Spades'] => 8,
  ['9', 'Spades'] => 9,
  ['10', 'Spades'] => 10,
  ['Jack', 'Spades'] => 10,
  ['Queen', 'Spades'] => 10,
  ['King', 'Spades'] => 10,
  ['Ace', 'Spades'] => 11
}
MAX_HAND_VALUE = 21

def prompt(msg)
  puts "\n=> #{msg}"
end

def deal_card(deck)
  card = deck.sample
  deck.delete(card)
  card
end

def display_hands(player, dealer, dealer_cards = nil)
  prompt 'You hold:'
  display_hand(player)
  display_hand_values(player)
  print "\n--------------\n"
  prompt 'Dealer holds:'
  display_dealer(dealer, dealer_cards)
end

def display_dealer(dealer, dealer_cards = nil)
  if dealer_cards == 1
    dealer_card = []
    dealer_card << dealer[0]
    display_hand(dealer_card)
    puts("and a hidden card") if dealer.size >= 2
    display_hand_values(dealer_card, dealer_cards)
  else
    display_hand(dealer)
    display_hand_values(dealer)
  end
end

def display_hand(hand)
  words = hand.map do |card, suit|
    "#{card} of #{suit}"
  end
  words[-1] = "and #{words.last}." if words.size > 1
  puts words.join(",\n")
end

def calculate_hand_value(hand)
  hand_values = 0
  hand.each do |card|
    hand_values += CARD_VALUES[card]
  end
  hand.select { |card, _suit| card == 'Ace' }.count.times do
    hand_values -= 10 if hand_values > 21
  end
  hand_values
end

def display_hand_values(hand, dealer_cards = nil)
  hand_values = calculate_hand_value(hand)
  prepend = if dealer_cards == 1
              'With a known value of'
            else
              'With a value of'
            end
  puts "\n#{prepend} #{hand_values}"
end

def bust?(hand)
  calculate_hand_value(hand) > MAX_HAND_VALUE
end

def who_won(player, dealer)
  player_value = calculate_hand_value(player)
  dealer_value = calculate_hand_value(dealer)
  if player_value > dealer_value
    prompt "You won with a score of #{player_value} " \
            "versus Dealer's #{dealer_value}!"
  elsif dealer_value > player_value
    prompt "Dealer won with a score of #{dealer_value} " \
            "versus your #{player_value}!"
  else
    prompt 'Tie!'
  end
end

system 'clear'
prompt "Welcome to Twenty One!"

loop do
  deck = CARD_VALUES.keys
  player_hand = []
  dealer_hand = []

  2.times do
    player_hand << deal_card(deck)
    dealer_hand << deal_card(deck)
  end

  display_hands(player_hand, dealer_hand, 1)

  answer = nil
  loop do
    prompt "Hit or Stay?"
    answer = gets.chomp.downcase
    break unless answer == 'hit'
    system 'clear'
    player_hand << deal_card(deck)
    display_hands(player_hand, dealer_hand, 1)
    break if bust?(player_hand)
  end

  system 'clear'
  if bust?(player_hand)
    display_hands(player_hand, dealer_hand, 1)
    prompt 'You bust! Dealer wins!'
  else
    loop do
      system 'clear'
      display_hands(player_hand, dealer_hand)
      break if bust?(dealer_hand)
      break if calculate_hand_value(dealer_hand) >= 17
      dealer_hand << deal_card(deck)
      display_hands(player_hand, dealer_hand)
    end
    if bust?(dealer_hand)
      prompt 'Dealer bust! You win!'
    else
      who_won(player_hand, dealer_hand)
    end
  end

  prompt "Want to play again? (y/n)"
  answer = gets.chomp.downcase
  system 'clear'
  break unless answer.start_with?('y')
end

prompt 'Thanks for playing Twenty One!'
