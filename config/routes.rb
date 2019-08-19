Rails.application.routes.draw do
  devise_for :patients
  devise_for :doctors
  root 'welcome#index'
  get 'welcome/index'
  # resources :appointments
  # resources :patients
  # resources :doctors
  # resources :clerks

  devise_for :clerks
  namespace :clerk do
    resources :appointments
    resources :doctors
    resources :patients
    resources :clerks
    resources :staffs
    resources :deparments
    resources :wards
    resources :beds
    resources :rooms 
    resources :bills
    resources :departments
    resources :stays do 
      collection do
        get :np
      end
    end
end
 namespace :doctor do
    resources :appointments
  end
  
   namespace :patient do
      resources :appointments
  end

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
