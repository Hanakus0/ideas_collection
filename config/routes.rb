Rails.application.routes.draw do
  # admin resources
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

  root "posts#index"
  resources :users
  resources :posts
end
