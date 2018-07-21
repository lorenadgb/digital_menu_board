Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :screens do
    resources :images, only: [:create, :destroy]
  end
end
