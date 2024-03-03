Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
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
  resources :pets, only: %i[new index show edit]
end
