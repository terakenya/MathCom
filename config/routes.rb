Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  get 'users' => 'users#index'
  get 'articles' => 'articles#index'
  get 'articles/new' => 'articles#new'
end
