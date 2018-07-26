Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  get 'users' => 'users#index'
end
