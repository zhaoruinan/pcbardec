Rails.application.routes.draw do
  mount UeditorRails::Engine => '/ueditor'
  devise_for :users
  resources :decrecords
  resources :decpcbars
  resources :posts
  root to: "posts#index"
  post '/upload', to: 'posts#upload', as: 'upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
