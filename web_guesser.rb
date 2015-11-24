require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(0..100)

get '/' do
  message = check_guess(params["guess"])
  background_color = check_background_color(message)
  erb :index, :locals =>  { :message => message,
                          :secret_message => message,
                          :background_color => background_color
                          }
end

def check_guess(guess)
  if guess == nil
    message = "No Guesses"
  elsif guess.to_i == SECRET_NUMBER
    message = "You Got It! The SECRET NUMBER is #{SECRET_NUMBER}"
  elsif guess.to_i > SECRET_NUMBER && guess.to_i > SECRET_NUMBER+5
    message = "You guessed #{guess} --> WAY too high"
  elsif guess.to_i > SECRET_NUMBER && guess.to_i < SECRET_NUMBER + 5
    message = "You guessed #{guess} --> Too high"
  elsif guess.to_i < SECRET_NUMBER && guess.to_i < SECRET_NUMBER - 5
    message = "You guessed #{guess} --> WAY too low"
  elsif guess.to_i < SECRET_NUMBER && guess.to_i > SECRET_NUMBER - 5
    message = "You guessed #{guess} --> Too low"
  end
end

def check_background_color(message)
  if message.include?("No")
    "black"
  elsif message.include?("WAY")
    "#FF0000"
  elsif message.include?("Got")
    "blue"
  elsif message.include?("Too")
    "pink"
  end
end
