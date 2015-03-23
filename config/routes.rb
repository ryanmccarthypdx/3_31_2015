Rails.application.routes.draw do
  root :to => "sessions#new"

  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :users do
    resources :questions
  end
end
