Giftlistr::Application.routes.draw do
  root to: 'users#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'

  resources :users do
    resources :giftlists, shallow: true
  end

  # resources :gifts

  resources :gifts do
    collection do
      get 'search'
    end
  end

  # get '/gifts/search', to: "gifts#search"

end
