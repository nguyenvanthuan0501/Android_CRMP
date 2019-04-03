Rails.application.routes.draw do
  resources :crimes
  resources :categories
    resources :users
    post '/login', to: 'users#login'
    get '/', to: 'application#home'
end
