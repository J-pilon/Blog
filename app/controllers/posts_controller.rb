class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    if @post.invalid?
      render "new"
    else
      render "show"
    end

  end

  def show
    @post
  end
end