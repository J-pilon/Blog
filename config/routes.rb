Rails.application.routes.draw do
  root to: 'pages#home'

  resources :posts, only: [:new, :create, :show]
end
