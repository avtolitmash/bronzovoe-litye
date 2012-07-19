Bronza::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root to: 'articles#index'
  
  resources :articles do
    resources :comments
  end

end
