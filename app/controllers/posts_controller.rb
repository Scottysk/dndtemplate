class PostsController < ApplicationController

  get '/characters' do
    @characters = Characters.all
    :characterspage
  end

  get '/characters/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :new
    end
  end
  
  get '/characters/id' do
    
  end
  
  post '/characters' do
  @character = Character.create(name: params[:name], gender: params[:gender], race: params[:race], archetype: params[:archetype], user_id: params[:user_id])
  redirect to "/characters/#{@character.id}"
end

  get '/characters/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      character = current_user.characters.find(params[:id])
      "An edit post form #{current_user.id} is editing #{character.id}"
  end
end


end
