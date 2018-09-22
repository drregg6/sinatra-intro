require 'sinatra'
require 'sinatra/reloader'

num = Random.rand(100)

get '/' do
    erb :index, :locals => { :num => num }
end