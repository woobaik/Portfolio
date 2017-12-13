Rails.application.routes.draw do
  resources :products, except: [:show]
  get 'products/:id', to: 'products#show', as: 'product/show'
  get 'angular-items', to: 'products#angular'



  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
