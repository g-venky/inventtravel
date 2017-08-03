Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :discussions
  # devise_for :users
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch,:update], :as => :finish_signup
   root 'welcome#index'
  get 'hello_world', to: 'hello_world#index'
  get 'creatives/index'
  root 'creatives#index'
  root to: "topics#index"

resources :users 
resources :topics do
  resources :comments
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end