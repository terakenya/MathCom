Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  get 'users' => 'users#index'
  get 'articles' => 'articles#index'
  get '/users/sign_out' => 'devise/sessions#destroy'

  devise_scope :user do
  get '/users/sign_out' => 'sessions#destroy'
end
end


