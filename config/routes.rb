Rails.application.routes.draw do
  resources :messages, except: [:edit, :update, :destroy] do
    delete :archive, on: :member
  end
  devise_for :users

  root 'messages#index'
end
