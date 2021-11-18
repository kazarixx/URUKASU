Rails.application.routes.draw do
  devise_for :users
  get 'comments/index'
  get 'brands/new'
  get 'brands/index'
  get 'brands/show'
  get 'brands/edit'
  get 'favorites/index'
  get 'members/show'
  get 'members/edit'
  get 'members/confirm'
  get 'homes/top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
