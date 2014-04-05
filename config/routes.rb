Giftlistr::Application.routes.draw do

  root to: 'pages#index'

  devise_for :admins
  devise_for :users, controllers: { registrations: "users/registrations" }
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

  resources :tags
end
