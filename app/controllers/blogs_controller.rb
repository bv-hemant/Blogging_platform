class BlogsController < ApplicationController 
  def index
    #@user = User.find_by(id:params[:user_id])
    if(session[:user_id])
      @user = User.where(id: session[:user_id])
      if @user
        @blog = @user.first.blogs.all
      end
    end
  end

  def show
    blogs=Blog.where(id: params[:id])
    if blogs
      @blog=blogs.first
    else
      flash[:alert]="No blogs"
      render :index 
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    if session[:user_id]
      @user = User.where(id: session[:user_id])
      if @user
        @blog = @user.first.blogs.new(blog_params)
      end

      if @blog.save
        redirect_to @blog
      else
        render :new
      end
    end
  end

    def edit
      if session[:user_id]
        @user = User.where(id: session[:user_id])
        if @user
          blog = @user.first.blogs.where(id: params[:id])
          if blog
            @blog = blog.first
          end
        end
      end
    end

    def update
      @user = User.where(id: session[:user_id])
      if @user 
        blog = @user.first.blogs.where(id: params[:id])
        if blog
          @blog=blog.first
        end
      end
      if !@blog.nil? && @blog.update(blog_params)
        redirect_to @blog
      else
        render :edit
      end
    end

    def destroy
      @user = User.where(id: session[:user_id])
      if @user
        blog = @user.first.blogs.where(id: params[:id])
        if blog
          @blog=blog.first
        end
        if !@blog.nil?
          @blog.destroy
          redirect_to blogs_path
        else
          redirect_to Blog.find_by(id: params[:id])
        end
      end
    end

    private

    def blog_params
      params.require(:blog).permit(:title, :body)
    end
  end
