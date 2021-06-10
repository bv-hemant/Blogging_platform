class RegistrationsController < ApplicationController 

  def index
  end

  def sighnin        
  end

  def validateuser
    user = User.where(email: params[:email]).first

    if user &&  user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to blogs_path
    else
      flash[:alert] = "Invalid Email or Password"
      render :sighnin
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      #redirect_to user_blogs_path @user
      flash[:notice] = "Signed Up Successfully"
      redirect_to blogs_path
    else
      flash[:alert] = "Some Error occured. Please retry!!"
      render :new
    end
  end

  def destroy 
    session[:user_id] = nil
    flash[:notice] = "Signed out Successfully"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password ,:password_confirmation)
  end
end 
