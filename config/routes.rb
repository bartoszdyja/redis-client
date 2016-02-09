Rails.application.routes.draw do
  root to: 'objects#new'
  resources :objects
end
