class BlogsController < ApplicationController

    before_action :authenticate_admin_user!, except: [:show]
    before_action :find_user
    before_action :admin_forbidden, only: [:index, :new, :create, :edit, :update, :destroy]

    def index
      @blogs = @user.blogs.sorted
      
    end
  
    def new
      @blog = Blog.new
    end

    def show
      @blog = Blog.find(params[:id])
    end

    def create
      @blog = Blog.new(blogs_params)
      if @blog.save
            flash[:notice] = "Successfully created blog."
            redirect_to(:action => 'index')
      else
        render :new
      end
    end

    def edit
      @blog = Blog.find(params[:id])
    end

    def update
      @blog = Blog.find(params[:id])
      if @blog.update(blogs_params)
        flash[:notice] = "Successfully updated blog."
        redirect_to(:action => 'index')
      else
        render :edit
      end
    end

    def destroy
      @blog = Blog.find(params[:id]).destroy
      flash[:notice] = "Successfully destroyed blog."
      redirect_to :action => 'index'
    end

  private 
    def blogs_params
      params.require(:blog).permit(:title, :description, :image, :admin_user_id)
    end

    def find_user
      if current_admin_user
          @user = AdminUser.find(current_admin_user.id)
      end
    end

    def admin_forbidden
      if current_admin_user.role_id == 1
        flash[:error] = "You are not allowed to have access to user\'s blog insights."
        redirect_to root_path
      end
    end
end

