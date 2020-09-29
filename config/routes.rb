Rails.application.routes.draw do
  root 'urls#new'
  resources :urls, only: %i[index show new create]
end
