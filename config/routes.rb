Rails.application.routes.draw do
  resources :messages, :only => [:index, :new, :create, :show]

  resources :contacts

  root 'contacts#index'
end
