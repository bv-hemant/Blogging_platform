class BlogsController < ApplicationController 
  def all_blogs
    @blogs ||= Blog.all
  end

  def index
    if !Current.user.nil?
      @blogs = Current.user.blogs.all
    else 
      log_in
    end
  end

  def show
    @blog=Blog.where(id: params[:id]).first
    if @blog.nil?
      flash[:alert]="No blog found"
      redirect_to root_path
    end
  end

  def new
    if Current.user
      @blog = Blog.new
    else 
      log_in
    end
  end

  def create
    if Current.user
      @blog = Blog.new(title: params[:blog][:title], body: params[:blog][:body],user_id: Current.user.id)
      if @blog.save
        flash[:notice] = "SuccessFully merged"
        redirect_to @blog
      else
        flash[:alert] = "An error occured while saving Blog."
        render :new
      end
    else
      log_in
    end
  end

  def edit
    if Current.user
      @blog = Current.user.blogs.where(id: params[:id]).first
      if @blog.nil?
        flash[:alert] = "No blog found" 
        redirect_to root_path
      end
    else
      log_in
    end
  end

  def update
    if Current.user
      @blog = Current.user.blogs.where(id: params[:id]).first
      if !@blog.nil? && @blog.update(blog_params)
        flash[:notice] = "Successfully Updated"
        redirect_to @blog
      elsif @blog
        flash[:alert] = "An Error Occured while Updating. Please retry!!"
        render :edit
      else
        flash[:alert] = "No Blog Found"
        redirect_to root_path
      end
    else
      log_in
    end
  end

  def destroy
    if Current.user
      @blog = Current.user.blogs.where(id: params[:id]).first
      if !@blog.nil? && @blog.destroy
        flash[:notice] = "Successfully Deleted"
        redirect_to blogs_path
      elsif @blog
        flash[:alert] = "An error Occured. Please retry !! "
        redirect_to @blog
      else
        flash[:alert] = "No blog found"
        redirect_to root_path 
      end
    else
      log_in
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
