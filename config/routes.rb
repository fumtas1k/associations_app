Rails.application.routes.draw do
  resources :users, only: %i[new create show edit update destroy] do
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
