class UsersController < ApplicationController
  get '/signup' do
    erb :users
  end
  
  get '/login' do
    
    erb :login
  end

  get '/logout' do
    logout!
    redirect '/'
  end

  post '/login' do
    	@user = User.find_by(:username => params[:username])
    	@characters = @user.characters
		if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		  erb :characterspage
			else
			  redirect "/login"
			end
		end
		

  post '/users' do
    @user = User.create(username: params[:username], password: params[:password])
    if @user.save
      redirect '/login'
    else
      erb :users
    end
  end
end
