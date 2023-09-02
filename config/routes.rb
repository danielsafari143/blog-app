Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users , path: '/', path_names: { sign_in: 'login', sign_up: 'sign_up', sign_out: 'logout'}

  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments , :likes
    end
  end  
end
