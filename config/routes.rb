Giftlistr::Application.routes.draw do

  root to: 'pages#index'
  devise_for :users
  devise_for :admins

  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # get '/logout', to: 'sessions#destroy'

  # get '/signup', to: 'users#new'

  resources :users do
    resources :giftlists, shallow: true
  end

  post '/giftlists/add', to: 'giftlists#add'

  # resources :gifts

  resources :gifts do
    collection do
      get 'search'
    end
  end

  resources :tags

  post '/gifts/add_tag', to: 'gifts#add_tag'

end
