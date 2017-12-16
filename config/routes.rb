Rails.application.routes.draw do
  resources :messages do
    collection do
      post '/visualized/:message_id', to: 'messages#visualized', as: :visualized
    end
  end
  devise_for :users

  root 'messages#index'
end
