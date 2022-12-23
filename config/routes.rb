Rails.application.routes.draw do
  
  root 'publics#home'

  devise_for :admin_users, controllers: {
        sessions: 'admin_users/sessions',
        passwords: 'admin_users/passwords',
        registrations: 'admin_users/registrations'
      }

  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
