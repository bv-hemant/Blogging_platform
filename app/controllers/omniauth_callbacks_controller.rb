class   OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    puts request.env["omniauth.auth"]
    @admin = AdminUser.from_omniauth request.env["omniauth.auth"]
    if  @admin && @admin.persisted?
      flash[:notice] = "Signed in!"
      sign_in_and_redirect @admin
    else
      flash[:notice] = "We couldn't sign you in "
      redirect_to new_admin_session_url
    end
  end
  def action_missing(provider)
  end
end
