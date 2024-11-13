Rails.application.routes.draw do
  get "pages/home"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  # Ajout du scope devise pour le magic link
  devise_scope :user do
    get 'magic_link', to: 'users/sessions#magic_link'
  end
  
  root 'pages#home'
end
