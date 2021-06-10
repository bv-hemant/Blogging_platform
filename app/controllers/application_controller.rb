class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if current_user
      Current.user =current_user
    end
  end

  def log_in
    flash[:alert] = "Please Login First"
    redirect_to new_user_session_path 
  end 
end
