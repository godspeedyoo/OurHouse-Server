Rails.application.routes.draw do
  get 'ping' => 'ping#ping'
  get 'secured/ping' => 'secured_ping#ping'


  resources :venmo, only: [:index, :create]


  resources :users do
    resources :houses do
      resources :payments
      resources :messages
      resources :messages_users
    end
  end
end
