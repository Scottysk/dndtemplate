class UsersController < ApplicationController
  get '/signup' do
    erb :'views/users'
  end
  
  get '/login' do
    erb :login
  end

  get '/logout' do
    logout!
    redirect '/'
  end

  post '/sessions' do
    login(params[:username], params[:password])
    redirect '/characters/'
  end

  post '/users' do
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :users
    end
  end
end
