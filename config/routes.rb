Rails.application.routes.draw do
  namespace :api do
    resources :tweets, only: [:index, :create, :show, :destroy]
  end
end
