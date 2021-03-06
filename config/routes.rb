Rails.application.routes.draw do
  resources :surveys, only: %i(index new edit show)
  root 'surveys#index'

  namespace :api do
    namespace :v1 do
      resources :surveys, only: %i(index create update show)
    end
  end
end
