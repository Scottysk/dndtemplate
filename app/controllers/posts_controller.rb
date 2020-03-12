class PostsController < ApplicationController

  get '/posts' do
    "Publically available games lists."
  end

  get '/posts/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :new
    end
  end

  get '/posts/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      post = current_user.posts.find(params[:id])
      "An edit post form #{current_user.id} is editing #{post.id}"
  end
end


end
