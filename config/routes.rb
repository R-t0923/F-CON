Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions'
  }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'homes/top'
  get 'homes/about'

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :matchmakes, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :matchmake_comments, only: [:create, :destroy]
    resources :matchmake_favorites, only: [:create, :destroy]
  end

  resources :teammates, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :teammate_comments, only: [:create, :destroy]
    resources :teammate_favorites, only: [:create, :destroy]
  end
  
end
