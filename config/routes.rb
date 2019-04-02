Rails.application.routes.draw do
  resources :categories
    resources :users
    post '/login', to: 'users#login'
    get '/', to: 'application#home'
end
