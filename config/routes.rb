Rails.application.routes.draw do
  get 'rooms/index'
  get 'rooms/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "staticpages#top"
  get 'staticpages/top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :birds, shallow: true do
    resources :pets, only: %i[create destroy]
  end

  resources :pets, only: %i[new show] do
    get 'speak', on: :member
  end

  resource :profile, only: %i[show edit update]
  resources :words, only: %i[create]
  resources :rooms, only: %i[index show]
  resources :favorites, only: %i[create destroy]
  resources :pet_in_rooms, only: %i[create destroy]
end
