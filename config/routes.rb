Rails.application.routes.draw do
  resources :crimes
  resources :categories
  resources :users
  resources :roles
  post '/login', to: 'users#login'
  get '/', to: 'application#home'
  get '/category/:category_id/crimes', to: 'crimes#get_report_by_category'
end
