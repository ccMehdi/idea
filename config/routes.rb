Rails.application.routes.draw do

  root "ideas#index"
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :ideas do
    resources :likes, only: [:create, :destroy]
    resources :joins, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    delete :destroy, on: :collection
  end

  resources :comments, only: [] do

  end

end
