class PostsController < ApplicationController

  def new
  end

  def preview
    @title = params[:title]
    @body = params[:body]
  end
end