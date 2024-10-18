Rails.application.routes.draw do
  devise_for :users
  get "home/index"
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

  # general routes
  devise_for :users # deviseを使用するURLに「users」を含む
  root "home#index"
  resources :users
  resources :posts
end
