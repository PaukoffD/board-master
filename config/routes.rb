Rails.application.routes.draw do
  resources :categories
 resources :tmpnotices do
    collection do
      post 'indextmp'
      put 'indextmp'
    end
  end
  resources :notices
  resources :cities
  devise_for :users
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'
  
  
   root 'notices#index'
  
  get 'tools', to: 'tools#index'
  get 'parsing', to: 'parsing#index'
  get 'parse_tmp', to: 'parsing#indextmp', :collection => { :update => :put }
 
  get 'load_tmp', to: 'parsing#loadtmp'
end
