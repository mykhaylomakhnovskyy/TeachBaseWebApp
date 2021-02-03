Rails.application.routes.draw do
  devise_for :users

  resources :tickets, only: %i[create show new index destroy]

  resource :search do
    patch :buy_ticket
    post :find_train
    get :show_ticket
  end

  get '/admin' => "railway_stations#index", :as => :admin_root

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end
    resources :railway_stations do
      patch :update_position, on: :member
    end
    resources :tickets, only: %i[index show destroy edit]
    resources :routes
  end

  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'searches#show'
end
