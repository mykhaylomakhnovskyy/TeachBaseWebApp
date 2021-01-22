Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes
  resources :carriages
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
