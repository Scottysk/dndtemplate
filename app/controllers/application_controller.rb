require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "autho_demo"
  end

  get "/" do
    erb :welcome
  end

  get '/login' do
    erb :login
  end

  get '/signup' do
    erb :users
  end


  helpers do

    def logged_in?
      !!current_user
    end
    
    def current_user
      @current_user ||= User.find_by(:username => session[:username]) if session[:username]
    end

    def login(username, password)
      user = User.find_by(:username => username)
      if user = user.authenticate(password)
        session[:username] = user.username
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end

  end
end
