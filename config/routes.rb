Rails.application.routes.draw do
  devise_for :users
  
  resources :users
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    # ↑resourceが複数形になっていてidを上手く渡せないroute matchエラーが起きていた
  end

  root 'home#top'
  get 'home/about', to: 'home#about'
end