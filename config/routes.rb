Rails.application.routes.draw do 
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, only: [:create, :edit, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root "pages#home"

 get "/auth/:provider/callback" => "sessions#create_from_omniauth"

 # get "pages/home", to: "pages#home"

 # get "pages/profile", to: "pages#profile"

 # get "pages/listing", to: "pages#listing"

end
