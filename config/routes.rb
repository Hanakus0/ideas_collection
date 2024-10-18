Rails.application.routes.draw do
  # by devise
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

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
  root "home#index"
  resources :posts
end
