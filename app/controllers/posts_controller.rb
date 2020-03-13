class PostsController < ApplicationController

  get '/characters' do
    if !logged_in?
    redirect "/login"
    else
    @user = current_user
    @characters = @user.characters.all
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
  @character = Character.create(name: params[:name], gender: params[:gender], race: params[:race], archetype: params[:archetype], :user_id => @user_id)
  redirect to "/characters"
end

  get '/characters/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      character = current_user.character.find(params[:id])
      "An edit post form #{current_user.id} is editing #{character.id}"
  end
end


end
