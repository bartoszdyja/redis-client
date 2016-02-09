Rails.application.routes.draw do
  root to: 'objects#new'
  resources :objects
  delete 'objects/destroy/(:key)', to: 'objects#destroy', as: 'destroy'
end
