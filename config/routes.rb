Rails.application.routes.draw do
  root "blogs#index"
  resources :users do
    collection do
      post :confirm
    end
  end
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: %i[new create destroy]
end
