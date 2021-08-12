Rails.application.routes.draw do
  root to: 'pages#home'

  resources :posts, only: [:index, :new, :create, :show]
end
