require 'sinatra'

SECRET_NUMBER = Random.rand(100)

def check_guess(num)
    if num == 0
        "Guess between 1 and 99!"
    elsif num - 9 > SECRET_NUMBER
        "WAY too high!"
    elsif num > SECRET_NUMBER
        "Too high"
    elsif num + 9 < SECRET_NUMBER
        "WAY too low!"
    elsif num < SECRET_NUMBER
        "Too low"
    elsif num == SECRET_NUMBER
        "YOU GOT IT RIGHT!"
    end
end

get '/' do
    guess = params["guess"].to_i
    message = check_guess(guess)
    erb :index, :locals => {
        :num => SECRET_NUMBER,
        :message => message,
        :guess => guess
    }
end

get '/num' do
    SECRET_NUMBER.to_s
end