Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'articles/search' => 'articles#search'
  end
  resources :articles
  resources :questions
  resources :users
end
