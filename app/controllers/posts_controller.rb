class PostsController < ApplicationController

  get '/characters' do
    "Current list of characters."
  end

  get '/characters/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :new
    end
  end
  
  post '/characters' do
  @character = Character.create(:title => params[:title], :content => params[:content])
  redirect to "/characters/#{@character.id}"
end

  get '/characters/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      post = current_user.posts.find(params[:id])
      "An edit post form #{current_user.id} is editing #{character.id}"
  end
end


end
