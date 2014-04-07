NHL::Application.routes.draw do
  
  devise_for :users

  resources :clients do
    collection { post :importpd }
    resources :addresses
    resources :email_addresses
    resources :phone_numbers
  end
  resources :contacts do
    collection { post :importpd }
    resources :addresses
    resources :email_addresses
    resources :phone_numbers
  end
  resources :insurance_carriers do
    resources :insurance_companies
  end
  resources :notes
  resources :pip_matters do
    collection { get :download }
	resources :messages
	resources :notes
	resources :pip_demands
	resources :pip_checks
    resources :tasks
  end
  resources :medical_providers
  resources :tasks do
    collection { post :createpartial }
    patch :updatepartial
  end
  resources :templates
  resources :users do
    resources :addresses
    resources :email_addresses
    resources :phone_numbers
  end
  
  get "home/home"
  #Used as a test to create folders.
  #get "home/create_folder"
  
  get "login/main"
  
  get "my_assignments", :controller => 'tasks'
  
  get "calendar", :controller => 'calendars'
  
  post ":controller/:action/:id"
  get ":controller/:action/:id"
  
  root "login#main"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
