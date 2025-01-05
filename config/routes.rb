Rails.application.routes.draw do
  root 'products#index'

  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  namespace :admins do
    resources :products, only: %i[index show new create edit update destroy] do
      resource :published, only: %i[create destroy], module: :products
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :products, only: %i[index show] do
    resources :cart_items, only: %i[create update destroy], module: :products
  end
  resource :cart, only: %i[show]
end
