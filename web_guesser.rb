require 'sinatra'
require 'sinatra/reloader'

num = rand(0..100)

get '/' do
  "THE SECRET NUMBER IS #{num}"
end
