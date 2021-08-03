Rails.application.routes.draw do
  root to: 'pages#home'

  get 'posts/new', to: 'posts#new'
  post 'posts/new', to: 'posts#preview'
end
