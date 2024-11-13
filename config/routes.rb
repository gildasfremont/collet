Rails.application.routes.draw do
  get "items/index"
  get "items/show"
  get "items/new"
  get "items/create"
  get "items/edit"
  get "items/update"
  get "items/destroy"
  get "pages/home"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  # Ajout du scope devise pour le magic link
  devise_scope :user do
    get 'magic_link', to: 'users/sessions#magic_link'
  end
  
  resources :items
  
  root 'pages#home'
end
