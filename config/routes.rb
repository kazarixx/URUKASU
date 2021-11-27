Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'

  resources :brands do
    resources :comments, only: [:destroy, :create, :index, :update]
    resource :favorites, only: [:destroy, :create, :index]
  end
    get 'users/confirm' => 'users#confirm', as: 'users_confirm'
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
