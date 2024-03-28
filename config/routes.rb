Rails.application.routes.draw do
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

  resources :rooms, only: %i[index show] do
    resources :pet_chat_in_rooms, only: [:create]
  end

  resource :mypage, only: %i[show]
  get 'show_my_pet' => "mypages#show_my_pet"
  get 'show_fav_pet' => "mypages#show_fav_pet"
  resource :profile, only: %i[edit update]
  resources :vocabs, only: %i[create]
  resources :favorites, only: %i[create destroy]
  resources :pet_in_rooms, only: %i[create destroy]
end
