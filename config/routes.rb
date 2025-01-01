Rails.application.routes.draw do
  root 'home#index'

  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  namespace :admins do
    resources :products, only: %i[new create]
  end
end
