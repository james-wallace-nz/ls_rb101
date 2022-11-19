# Use makes a choice
# Computer makes a choice
# Winner is displayed

VALID_CHOICES = %w(rock paper scissors)

# def test_method
#   prompt('test message')
# end

# test_method - NameError

def prompt(message)
  puts "=> #{message}"
end

# test_method

def win?(first, second)
  first   == 'rock'     && second == 'scissors' ||
    first == 'paper'    && second == 'rock' ||
    first == 'scissors' && second == 'paper'
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif player == computer
    prompt("It's a tie!")
  else
    prompt('Computer won!')
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You choose #{choice}. Computer choose #{computer_choice}.")
  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thankyou for playing RPS")
