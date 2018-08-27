Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :questions do
    member do
      get 'search'
    end
  end
  resources :users
end
