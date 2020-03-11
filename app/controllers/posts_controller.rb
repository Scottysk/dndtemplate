class PostsController < ApplicationController

  get '/posts' do
    "Publically available games lists."
  end

  get '/posts/new' do
    if logged_in?
      redirect '/login'
    else
      "New post here"
    end
  end

  get '/posts/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      post = Post.find(parms[:id])
      if post.user_id == current_user.id
      "Edit post here"
    else 
      redirect '/posts'
    end
  end



end
