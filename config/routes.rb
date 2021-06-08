Rails.application.routes.draw do
  root "registrations#index" 
  get "sign_in", to: "registrations#sighnin" 
  post "sign_in", to: "registrations#validateuser"
  get "sign_up", to: "registrations#new" 
  post "sign_up", to: "registrations#create" 
#resources :users do 
  resources :blogs 
#end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
