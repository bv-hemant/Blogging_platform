class BlogsController < ApplicationController 
    def index
        #@user = User.find_by(id:params[:user_id])
        if(session[:user_id])
            @user = User.find_by(id:session[:user_id])
            @blog = @user.blogs.all
        end
    end

    def show
        @blog=Blog.find_by(id: params[:id])
    end

    def new
      @blog = Blog.new
    end

    def create
        if(session[:user_id])
            @user = User.find_by(id:session[:user_id])
            @blog = @user.blogs.new(blog_params)

            if @blog.save
                redirect_to @blog
            end
      #redirect_to user_blogs_path
        else
          render :new
        end
    end

    def edit
        if(session[:user_id])
            @user = User.find_by(id:session[:user_id])
            @blog = @user.blogs.find_by(id:params[:id])
    end
    #@blog = Blog.find(params[:id])
    
  end
    
    def update
        @user = User.find_by(id:session[:user_id])
        @blog = @user.blogs.find_by(id:params[:id])

        if !@blog.nil? && @blog.update(blog_params)
            redirect_to @blog
        #redirect_to user_blog_path
        else
            render :edit
        end
    end

    def destroy
        @user = User.find_by(id:session[:user_id])
        @blog = @user.blogs.find_by(id:params[:id])
        if !@blog.nil?
            @blog.destroy
            redirect_to blogs_path
        else
            redirect_to Blog.find_by(id: params[:id])
        end
    end

    private

    def blog_params
        params.require(:blog).permit(:title, :body)
    end
    
    def get_blog(id)
        @blog = Blog.find(id)
    end
end