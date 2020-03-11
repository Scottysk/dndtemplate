class UsersController < ApplicationController
  get '/signup' do
    erb :'views/users'
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
