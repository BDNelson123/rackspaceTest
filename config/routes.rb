Rackspace::Application.routes.draw do
  resources :appointments

  devise_for :users, controllers: { registrations: "registrations" }
end
