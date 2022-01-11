Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'blogs/new'
  get 'blogs/index'
  get 'blogs/show'
  get 'blogs/edit'
  get 'blogs/confirm'
  get 'users/new'
  get 'users/show'
  get 'users/index'
  get 'users/edit'
  get 'users/confirm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
