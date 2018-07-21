Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :screens do
    collection do
      get "/:id/slideshow" => "screens#slideshow", as: "slideshow"
    end

    resources :images, only: [:create, :destroy]
  end
end
