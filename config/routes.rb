Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  get 'users' => 'users#index'
  get 'articles' => 'articles#index'
  get 'articles/new' => 'articles#new'
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  get 'articles/search' => 'articles#search'
  end
end
