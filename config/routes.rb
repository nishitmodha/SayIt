Rails.application.routes.draw do
  root 'rooms#index'
  devise_for :users, controllers: { registrations: "registrations" }
  resources :rooms do
    resources :messages
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
