class BlogsController < ApplicationController 
  def all_blogs
    @blog = Blog.all
  end

  def index
    if !Current.user.nil?
      @blog = Current.user.blogs.all
    else 
      redirect_to sign_in_path
    end
  end

  def show
    @blog=Blog.where(id: params[:id]).first
    if @blog.nil?
      flash[:alert]="No blogs"
      redirect_to root_path
    end
  end

  def new
    if Current.user
      @blog = Blog.new
    else 
      redirect_to sign_in_path
    end
  end

    def create
      if Current.user
        @blog = Current.user.blogs.new(blog_params)

        if @blog.save
          redirect_to @blog
        else
          render :new
        end
      else
        redirect_to sign_in_path
      end
    end

    def edit
      if Current.user
        blog = Current.user.blogs.where(id: params[:id]).first
        if @blog.nil?
          redirect_to root_path
        end
      else
        redirect_to sign_in_path  
      end
    end

    def update
      if Current.user
        @blog = Current.user.blogs.where(id: params[:id]).first
          if !@blog.nil? && @blog.update(blog_params)
            redirect_to @blog
          else
            render :edit
          end
      else
        redirect_to sign_in_path
      end
    end

    def destroy
      if Current.user
        @blog = Current.user.blogs.where(id: params[:id]).first

          if !@blog.nil? && @blog.destroy
            redirect_to blogs_path
          elsif @blog
            redirect_to @blog
          else
            redirect_to root_path 
          end
      else
        redirect_to sign_in_path
      end
    end

    private

    def blog_params
      params.require(:blog).permit(:title, :body)
    end
  end
