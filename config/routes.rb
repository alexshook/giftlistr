Giftlistr::Application.routes.draw do
  root to: 'users#index'

  resources :users do
    resources :giftlists, shallow: true
  end

  resources :gifts

end
