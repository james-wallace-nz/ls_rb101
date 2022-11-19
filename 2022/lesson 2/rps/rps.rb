# Use makes a choice
# Computer makes a choice
# Winner is displayed

VALID_CHOICES = ['rock', 'paper', 'scissors']

# def test_method
#   prompt('test message')
# end

# test_method - NameError

def prompt(message)
  puts "=> #{message}"
end

# test_method

def display_results(player, computer)
  if  player == 'rock' && computer == 'scissors' ||
      player == 'paper' && computer == 'rock' ||
      player == 'scissors' && computer == 'paper'
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

  prompt("You choose #{player}. Computer choose #{computer}.")
  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thankyou for playing RPS")
