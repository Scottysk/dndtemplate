class SessionsController < ApplicationController

  get '/login' do
    erb :login
  end

  get '/logout' do
    logout!
    redirect '/posts'
  end

  post '/sessions' do
    login(params[:username], params[:password])
    redirect '/posts'
  end

end
