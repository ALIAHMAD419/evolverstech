Rails.application.routes.draw do
  devise_for :patients
  devise_for :doctors
  devise_for :clerks

  root 'welcome#index'
  get 'welcome/index'

  namespace :clerk do
    resources :appointments
    resources :doctors
    resources :patients
    resources :clerks
  end
  namespace :doctor do
    resources :appointments
  end
  
  namespace :patient do
    resources :appointments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
