Rails.application.routes.draw do
  resources :decrecords
  resources :decpcbars
  root "decpcbars#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
