require 'sinatra'

SECRET_NUMBER = Random.rand(100)
@@guess_count = 5
msg = ""
bg_flag = :neutral


def check_guess(num)
    if num == 0
        bg_flag = :neutral
        msg = "Guess between 1 and 99!"
    elsif num - 9 > SECRET_NUMBER
        bg_flag = :wrong
        msg = "WAY too high!"
    elsif num > SECRET_NUMBER
        bg_flag = :close
        msg = "Too high"
    elsif num + 9 < SECRET_NUMBER
        bg_flag = :wrong
        msg = "WAY too low!"
    elsif num < SECRET_NUMBER
        bg_flag = :close
        msg = "Too low"
    elsif num == SECRET_NUMBER
        bg_flag = :correct
        msg = "YOU GOT IT RIGHT!"
    end
    return [bg_flag, msg]
end

get '/' do
    guess = params["guess"].to_i
    message = check_guess(guess)[1]
    bg_flag = check_guess(guess)[0]
    cheat = params["cheat"]
    erb :index, :locals => {
        :num => SECRET_NUMBER,
        :message => message,
        :guess => guess,
        :bg_flag => bg_flag,
        :cheat => cheat
    }
end

get '/num' do
    SECRET_NUMBER.to_s
end