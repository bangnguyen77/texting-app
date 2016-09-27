Rails.application.routes.draw do
  resources :messages, :only => [:index, :new, :create, :show, :destroy] do
    collection do
      post 'reply'
    end
  end

  resources :contacts

  root 'contacts#index'
end
