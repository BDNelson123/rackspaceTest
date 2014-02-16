Rackspace::Application.routes.draw do
  devise_scope :user do
    root :to => 'members#index'
  end

  resources :pets
  resources :appointments
  resources :members

  devise_for :users, controllers: { registrations: "registrations" }
end
