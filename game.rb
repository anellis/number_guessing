#This has the changing of rand to an alternate that was requested in hard mode
#I could not figure out how to get the "you're wasting a guess" to work by adjusting a suitable range
def guess
  puts "Guess a random number between 1 and 100."
end

def remaining_guesses(count)
  if 5-count==1
    puts "You have 1 guess remaning"
  else
    puts "You have #{5-count} guesses remaning"
  end
end

previous_guesses=[]
random_number=(1..100).to_a.sample
win=false
incorrect_guesses=0

while (win==false && incorrect_guesses<5)
  remaining_guesses(incorrect_guesses)
  guess
  user_guess=gets.chomp.to_i
  if user_guess<random_number
    puts "You're low. "
    incorrect_guesses +=1
  elsif user_guess==random_number
    puts "Correct. You win!"
    win=true
  else
    puts "You're high. "
    incorrect_guesses +=1
  end

  if previous_guesses.include?(user_guess)
    puts "Are you feeling all right? You already guessed that!"
  end
  previous_guesses<<user_guess
end

if incorrect_guesses==5
  puts "You lose."
end
