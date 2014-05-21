Giftlistr::Application.routes.draw do

  root to: 'pages#index'

  devise_for :admins, controllers: { registrations: "admins/registrations" }

  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users, only: [:index, :show]

  resources :recipients do
    resources :giftlists, shallow: true
  end

  resources :gifts do
    collection do
      get 'search'
    end
  end

  resources :tags

  post '/giftlists/add', to: 'giftlists#add'
  post '/gifts/add_tag', to: 'gifts#add_tag'
end
