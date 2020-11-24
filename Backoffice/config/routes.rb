Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :comments
  resources :reviews
  resources :wines
  resources :users
  resources :wine_makers
  resources :wine_colors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
