Rails.application.routes.draw do
  resources :surveys, only: %i(index new edit)
  root 'surveys#index'

  namespace :api do
    namespace :v1 do
      resources :surveys, only: %i(index)
    end
  end
end
