class PostsController < ApplicationController
  require 'pry'
  get '/' do
    @characters = Character.all
    @character = Character.find_by_id(params[:id])
      erb :welcome
  end

  get '/characters' do
    if !logged_in?
    redirect "/login"
    else
      
    @characters = current_user.characters
    erb :characterspage
  end
end

  get '/characters/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :new
    end
  end
  
  get '/characters/:id' do
    if !logged_in?
      redirect '/login'
    else
      @character = Character.find(params[:id])
      erb :show
    end
  end
  
  post '/characters' do
  @character = current_user.characters.create(params) unless params[:name].empty?
  redirect to "/characters"
  end

  get '/characters/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      @character = Character.find_by_id(params[:id])
      if current_user.id == @character.user_id
        erb :edit
      else 
        redirect '/'
      end
    end
  end
  
  patch '/characters/:id' do 
    @character = Character.find(params[:id])
      if params[:name].empty?
        redirect '/characters/#{params[:id]}/edit'
        
      elsif current_user.id == @character.user_id
      @character.update(name: params[:name], gender: params[:gender], race: params[:race], archetype: params[:archetype], background: params[:background])
      @character.save
        redirect '/characters'
        
      else 
        redirect '/'
    end
  end
  
  delete '/characters/:id/delete' do
    if !logged_in?
      redirect '/login'
    else
      @character = Character.find(params[:id])
      if current_user.id != @character.user_id
        redirect '/characters'
      else
        @character.delete
        redirect '/characters'
    end
  end
end
  


end
