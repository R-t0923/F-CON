Rails.application.routes.draw do
  
  # devise_for :admins, controllers: {
  #   sessions:      'admins/sessions'
  # }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'about' => 'homes#about', as: 'about'
  
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    get 'favorites' => 'teammate_favorites#index'
    # resources :teammate_favorites, only: [:index]
    resources :group_users, only: [:index]
  end
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    get 'post_index' => 'groups#post_index'
    get 'menber_index' => 'groups#menber_index'
    resources :matchmakes, only: [:new, :create, :edit, :update, :destroy] 
    resources :teammate_recruitments, only: [:new, :create, :edit, :update, :destroy] 
    resource :group_users, only: [:create, :destroy]
  end
  resources :teammate_recruitments, only: [:index, :show] do
    resources :teammate_comments, only: [:create, :destroy]
    resource :teammate_favorites, only: [:create, :destroy]
  end
  resources :matchmakes, only: [:index, :show] do
    resources :matchmake_comments, only: [:create, :destroy]
    resource :matchmake_favorites, only: [:create, :destroy]
  end
  

end
