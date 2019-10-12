Rails.application.routes.draw do
  resources :cryps
  devise_for :users
  get 'home/index'
  root 'home#index'
  get 'home/about'
  get 'home/lookup'
  post "/home/lookup" => 'home#lookup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
