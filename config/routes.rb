Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "blogs#all_blogs" 
  #get "sign_in", to: "registrations#sighnin" 
  #post "sign_in", to: "registrations#validateuser"
  # get "sign_up", to: "registrations#new" 
  # post "sign_up", to: "registrations#create" 
  # delete "sign_out", to: "registrations#destroy"

  #resources :users do 
  resources :blogs 
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
