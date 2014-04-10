Giftlistr::Application.routes.draw do

  root to: 'pages#index'

  devise_for :admins
  devise_for :users, controllers: { registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [:index, :show] do
    resources :giftlists, shallow: true
  end
  post '/giftlists/add', to: 'giftlists#add'

  resources :gifts do
    collection do
      get 'search'
    end
  end
  post '/gifts/add_tag', to: 'gifts#add_tag'

  get '/users/:id/friends', to: 'gifts#get_friends'

  resources :tags
end
