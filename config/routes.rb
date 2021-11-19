Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'

  resources :brands do
    resources :comments, only: [:destroy, :create, :index, :update]
    resource :favorites, only: [:destroy, :create, :index]
  end
  resources :members, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
