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
      "Edit post here"
    end
  end



end
