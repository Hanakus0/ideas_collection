Rails.application.routes.draw do
  root "home#index"

  # by devise
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # admin routes
  namespace :admin do
    get '/', to: 'admins#index'
    resources :users
    resources :bookmarks
    resources :comment_likes
    resources :comments
    resources :follows
    resources :post_genres
    resources :post_likes
    resources :post_records
    resources :post_tags
    resources :posts
    resources :quote_relations
    resources :tags
  end

  # not devise user routes
  namespace :users do
    resources :profiles, only: %i(show edit update), param: :screen_name
  end
  # table: posts
  # resources :posts, param: :post_uid
  resources :posts
end
