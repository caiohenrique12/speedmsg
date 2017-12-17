Rails.application.routes.draw do
  resources :messages, except: [:index, :edit, :update, :destroy] do
    collection do
      get "inbox"
      get "sent"
      post "archive"
    end
  end
  devise_for :users

  root 'messages#inbox'
end
