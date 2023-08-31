Rails.application.routes.draw do
  devise_for :logins
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments , :likes
    end
  end  
end
