require 'pry'

=begin

================================================================================
*** (Understand the) Problem: ***

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
inputs:
player - hit or stay strings

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
outputs:
win/bust

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Problem Domain:
52 card deck
 - 4 suits (hearts, diamonds, clubs, spades)
 - 13 card types
    - 2, 3, 4, 5, 6, 7, 8, 9, 10  => worth face value
    - jack, queen, king           => worth 10
    - ace                         => worth 1 or 11 hand dependent

players:
- player
- dealer

max hand value 21 otherwise bust

player and dealer dealth 2 cards
player can see two cards and one of dealer's cards

player goes first - decides to hit or stay
  - hit means another card is drawn
  - turn is over when bust or stay
      - bust then dealer wins
dealer goes when player stays
  - dealer hits until hand is at least 17 (>= 17)
  - dealer busts then player wins

if both player and dealer stay then compare hand values.
  - winner has higher value hand

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Implicit Requirements:

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Clarifying Questions:
1. Which dealer card must be displayed? first or highest or random?
  - assume random
2.
3.

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Your Mental Model:
1 deal 2 cards to player and dealer
2 player hits or stays
3 if player doesn't bust then dealer hits or stays
4 if dealer stays then compare values

================================================================================
*** Examples: ***

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Your Examples:

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Your Test Cases:

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Your Edge Cases:

================================================================================
*** Data Structure: ***

card_values = hash { ['2', 'hearts'] => 2, ['ace', 'diamonds'] => [1, 11] }
deck = nested array of card_values keys

player and dealer hand = nested array - [card, suit]
  - player_hand = [ ['2', 'hearts'], ['ace', 'diamonds'], ['jack', 'clubs'] ]

================================================================================
*** Algorithm: ***

1. Initialise deck
  - deck = card_values.keys
2. Deal cards to player and dealer
  - deal card
    - card = deck.sample
    - deck.delete(card)
  - player << card
  - deal card
  - dealer << card
  - repeat again
4. Display cards (2x player, 1x dealer)
4. Player turn:
  - hit or stay
  - deal card
  - calculate ace value and total hand value
  - repeat until bust or stay - break if stay || bust
5. if player bust, dealer wins
6. Dealer turn:
  - break if hand_value >= 17 || bust
  - hit or stay
  - deal card
  - calculate ace value and total hand value
  - loop
7. if dealer bust, player wins
8. compare cards and declare winner
  - determine result
    - player_hand > dealer_hand => player wins
    - dealer wins
  - update scores
  - display result

================================================================================
*** Code: ***
=end

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
  hand_values = [0]
  hand.each do |card|
    unless card[0] == 'Ace'
      card_value = CARD_VALUES[card]
      hand_values[0] += card_value
    end
  end

  hand_values = add_ace_values(hand, hand_values)
end

def add_ace_values(hand, hand_values)
  aces = hand.select { |card| card[0] == 'Ace' }
  if aces.size > 0
    ace_values = aces.map { [1, 11] }
    values = ace_values.pop
    while ace_values.size > 1
      values = values.product(ace_values.pop)
      values.map!(&:sum)
    end
    values = values.uniq
    values.map! { |ace_value| ace_value + hand_values[0] }
    values.select { |ace_value| ace_value <= MAX_HAND_VALUE }
  else
    hand_values
  end
end

def display_hand_values(hand, dealer_cards = nil)
  hand_values = calculate_hand_value(hand)
  if hand_values.size == 1
    prepend = if dealer_cards == 1
                'With a known value of'
              else
                'With a value of'
              end
    puts "\n#{prepend} #{hand_values[0]}"
  else
    prepend = if dealer_cards == 1
                'With known values of'
              else
                'With values of'
              end
    puts "\n#{prepend} #{hand_values.join(' or ')}"
  end
end

def bust?(hand)
  hand_value = calculate_hand_value(hand).min
  hand_value.nil? || hand_value > MAX_HAND_VALUE
end

def who_won(player, dealer)
  player_value = calculate_hand_value(player).max
  dealer_value = calculate_hand_value(dealer).max
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
      break if calculate_hand_value(dealer_hand).max >= 17
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
