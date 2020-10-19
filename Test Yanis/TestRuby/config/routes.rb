Rails.application.routes.draw do
  resources :books
  get '/books/prix/:prix', to: 'books#prix', as: 'prix'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
