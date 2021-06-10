class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      user=User.where(id: session[:user_id]).first
      if user
        Current.user = user
      end
    end
  end
end
