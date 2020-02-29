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
  root 'homes#top'
  get 'about' => 'homes#about', as: 'about'

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :matchmakes, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
    resources :teammates, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
  end
  resources :teammates, only: [:index, :show] do
    resources :teammate_comments, only: [:create, :destroy]
    resources :teammate_favorites, only: [:create, :destroy]
  end
  resources :matchmakes, only: [:index, :show] do
    resources :matchmake_comments, only: [:create, :destroy]
    resources :matchmake_favorites, only: [:create, :destroy]
  end
end
