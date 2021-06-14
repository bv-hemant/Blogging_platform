Rails.application.routes.draw do
  devise_config = ActiveAdmin::Devise.config
  devise_config[:controllers][:omniauth_callbacks] = 'omniauth_callbacks'
  devise_for :admin_users, devise_config

  ActiveAdmin.routes(self)
  devise_for :users
  root "blogs#all_blogs"

  #resources :users do 
  resources :blogs 
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
