Needsapp2::Application.routes.draw do

  root :to => "needs#index"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"


  resources :users
  resources :slots
  resources :sessions
  resources :categories do
    member do
      get :needs
    end
  end
  resources :needs do
    collection do
      get :search
    end
  end

end
