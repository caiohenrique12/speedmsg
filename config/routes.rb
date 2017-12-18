Rails.application.routes.draw do
<<<<<<< HEAD
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
  resources :messages, except: [:index, :edit, :update, :destroy] do
    collection do
      get "inbox"
      get "sent"
      get "archives"
      post "archive"
    end
  end
  devise_for :users

  root 'messages#inbox'
>>>>>>> development
end
