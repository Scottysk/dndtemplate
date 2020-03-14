class PostsController < ApplicationController

  get '/characters' do
    if !logged_in?
    redirect "/login"
    else
    @user = current_user
    @characters = @user.characters
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
  @user = current_user
  @character = Character.create(name: params[:name], gender: params[:gender], race: params[:race], archetype: params[:archetype], user_id: @user.id)
  redirect to "/characters"
end

  get '/characters/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      @character = Character.find_by_id(params[:id])
        erb :edit
      end
    end
  
  patch '/characters/:id' do 
    @character = Character.find(params[:id])
      if params[:name].empty?
        redirect '/characters/#{params[:id]}/edit'
      end
      @character.update(name: params[:name], gender: params[:gender], race: params[:race], archetype: params[:archetype])
      @character.save
        redirect '/characters'
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
