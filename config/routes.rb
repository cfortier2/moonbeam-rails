Rails.application.routes.draw do
  root 'home#index'

  # Catch-all redirect
  get '*path', to: 'home#index'
end
