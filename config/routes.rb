Rails.application.routes.draw do
  devise_for :admins
  resources :categories
 resources :tmpnotices do
    collection do
      post 'indextmp'
      put 'indextmp'
    end
  end
  resources :notices do
   collection do
      post 'indextmp'
      put 'indextmp'
    end
  end
  
  
  resources :cities
  devise_for :users
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'
  
  
   root 'notices#index'
  
  get 'tools', to: 'tools#index'
  get 'moderate', to: 'notices#moderation'
  get 'parsing', to: 'parsing#index'
  get 'parse_tmp', to: 'parsing#indextmp', :collection => { :update => :put }
  get 'rules', to: 'notices#rules'
  get 'load_tmp', to: 'parsing#loadtmp'
  get 'listcat', to: 'categories#listcat'
  
end
