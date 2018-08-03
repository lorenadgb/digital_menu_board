Rails.application.routes.draw do
  devise_for :users

  root to: 'screens#index'

  resources :users
  resources :screens do
    collection do
      get "/:id/slideshow" => "screens#slideshow", as: "slideshow"
    end

    resources :images, only: [:create, :destroy]
  end
end
