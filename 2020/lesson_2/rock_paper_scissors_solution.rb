VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer)
  if  (player == 'rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper')
    prompt('You won!')
  elsif (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'rock')
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().downcase()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose: #{choice}. The computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Thank you for playing. Good bye!')
