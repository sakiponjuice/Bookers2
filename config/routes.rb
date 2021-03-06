Rails.application.routes.draw do
  get 'chats/show'
  devise_for :users, :controllers => {
    :registrations => "users/registrations"
  }
  root to: 'home#top'
  get 'home/about' => 'home#about'
  get 'js/index' => 'js#index'
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  resources :users, only: :show
  get 'users/:id/follower' => 'users#follower', as: 'user_follower'
  get 'users/:id/followed' => 'users#followed', as: 'user_followed'
  get 'search/search' => 'search#search', as: 'search'
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
