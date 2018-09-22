require 'sinatra'
require 'sinatra/reloader'

num = Random.rand(100)

get '/' do
    "The secret number is " + num.to_s
end