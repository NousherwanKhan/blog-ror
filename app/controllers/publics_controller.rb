class PublicsController < ApplicationController

  def home
    @blogs = Blog.all
  end
  
end
