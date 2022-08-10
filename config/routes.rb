Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :pets, only: [:show, :index, :create] do
        resources :bookings, only: [:create]
      end
      post 'login', to: 'users#login', as: :login
      get 'profile/:id', to: 'users#profile_page'
      # get "about", to: "pages#about", as: 'newprefix'
    end

  end
end
