Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'articles/search' => 'articles#search'
  end
  resources :articles
  resources :users
end
