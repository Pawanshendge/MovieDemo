Rails.application.routes.draw do
  resources :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'api/popular', to: 'movies#popular'
  get 'api/:id/detail_page', to: 'movies#detail_page'
  get 'api/movies/:id/', to: 'movies#show'
  get 'api/search', to: 'movies#search'
  
  namespace :admin do
    get '/csv/upload_csv', to: 'csv#upload_csv', as: 'upload_csv'
  end
end
