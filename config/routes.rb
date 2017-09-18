Rails.application.routes.draw do

  get 'users/index'

  devise_for :users
  
  resources :users, only: [:index]
  resources :conversations, only: [:index, :show, :destroy] do
  	member do
	    post :reply
	    post :restore
	    delete :empty_trash
	    post :mark_as_read
	  end
  end
  resources :messages, only: [:new, :create]
  root to: 'conversations#index'
end
