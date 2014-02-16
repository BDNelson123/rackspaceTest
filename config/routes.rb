Rackspace::Application.routes.draw do
  resources :pets

  resources :appointments

  devise_for :users, controllers: { registrations: "registrations" }
end
