require 'sinatra'
require 'sinatra/reloader'

number = rand(0..100)

get '/' do
  way_high = number + 5
  secret_number = number
  guess = params["guess"].to_i
  if guess == 0
    message = "No Guesses"
  elsif guess == secret_number
    secret_message = "The SECRET NUMBER is #{secret_number}"
  elsif guess > secret_number && guess > secret_number+5
    message = "You guessed #{guess} --> WAY too high"
  elsif guess > secret_number && guess < secret_number + 5
    message = "You guessed #{guess} --> Too high"
  elsif guess < secret_number && guess < secret_number - 5
    message = "You guessed #{guess} --> WAY too low"
  elsif guess < secret_number && guess > secret_number - 5
    message = "You guessed #{guess} --> Too low"
  end

  erb :index, :locals => {:number => number, :message => message, :secret_message => secret_message}
end
