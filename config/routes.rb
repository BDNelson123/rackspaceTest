Rackspace::Application.routes.draw do
  resources :pets
  resources :appointments
  resources :members

  devise_for :users, controllers: { registrations: "registrations" }
end
