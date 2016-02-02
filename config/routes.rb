Rails.application.routes.draw do
  #Dynamic Rails Error Pages
  get "/404" => "errors#not_found"
  get "/500" => "errors#internal_server_error"

  get 'errors/not_found'

  get 'errors/internal_server_error'

  get 'index', to: "landing#index"

  resources :users

  get 'login', to: "login#index"
  get 'info', to: "login#info"
  get 'profile', to: "login#profile"
  get 'feed', to: "feed#feed"
  post 'upload', to: "feed#upload"

  post 'info/update', to: "login#update_info"

  get '/auth/:provider/callback', to: "sessions#create"
  delete 'sign_out',  to: "sessions#destroy", as: 'sign_out'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landing#index'

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
