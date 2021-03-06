Rails.application.routes.draw do
  resources :hotlines
  resources :commentmissings
  resources :commentcrimes
  resources :missings
  resources :crimes
  resources :categories
  resources :users
  resources :roles
  resources :complaintcategorys
  resources :complaints
  resources :reportcategories
  resources :reports

  post '/login', to: 'users#login'
  get '/', to: 'application#home'
  get '/category/:category_id/crimes', to: 'crimes#get_report_by_category'

  get '/users/:user_id/crimes', to: 'crimes#get_report_by_user'
  get '/users/:user_id/missings', to: 'missings#get_missing_by_user'
  get '/missing/:missing_id/comments', to: 'commentmissings#get_comment_by_missing'
  get '/crime/:crime_id/comments', to: 'commentcrimes#get_comments_by_crime'
  delete '/crime/:crime_id/comments', to: 'commentcrimes#delete_comment_by_crime'
  get '/hotline/:area', to: 'hotlines#get_hotline_by_area'
  get 'crimes/area/:area', to: 'crimes#get_crimes_by_area'
  delete '/reports/post/:post_id', to: 'reports#destroy_by_post'
  get '/reports/post/:post_id', to: 'reports#get_report_by_post'

end
