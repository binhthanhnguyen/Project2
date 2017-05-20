Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'static_pages#home'
  # get 'curriculum_vitaes/new'

  # get 'curriculum_vitaes/show'

  # get 'curriculum_vitaes/edit'

  # get 'sessions/new'


  # get 'static_pages/home'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'

  # get    '/login',   to: 'sessions#new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'
  resources :users do
     resources :curriculum_vitaes
  end

  resources :internship_recruitments

  resources :internship_registrations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
