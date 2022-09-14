Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/parking', to: 'parkings#create'
  get '/parking/:plate', to: 'parkings#plate_history'
  patch '/parking/:id/pay', to: 'parkings#pay'
  put '/parking/:id/pay', to: 'parkings#pay'
  patch '/parking/:id/out', to: 'parkings#checkout'
  put '/parking/:id/out', to: 'parkings#checkout'
end
