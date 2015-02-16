Rails.application.routes.draw do
  resources :users do
    resources :houses do
      resources :payments
      resources :messages
      resources :messages_users
    end
  end
end
