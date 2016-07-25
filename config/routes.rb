Rails.application.routes.draw do
  apipie
  ActiveAdmin.routes(self)

  root to: 'home#index'
  devise_for :users, controllers: { confirmations: "confirmations" }

  resources :users do
    post 'upload_photo', on: :collection
  end

  resources :shows do
    get 'payment', on: :member
  end
  resources :pictures do
    post 'destroy', on: :member, as: 'destroy'
  end

  namespace :api do
    namespace :v1 do
      resources :users, :defaults => { :format => 'json' } do
        get 'search', on: :collection
      end
      resources :shows, :defaults => { :format => 'json' } do
        post 'toggle_active', on: :member
        get 'arts', on: :collection
        get 'search', on: :collection
      end
      resources :pictures, :defaults => { :format => 'json' }
      resources :bookings, :defaults => { :format => 'json' } do
        post 'change_status', on: :member
      end
      resources :arts
      resources :showcases
      resources :user_availabilities, path: :availabilities, only: [:index, :show, :create, :destroy]
    end
  end

  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/profile', to: 'dashboard#profile', as: 'profile_dashboard'
  get '/dashboard/messages', to: 'dashboard#messages', as: 'messages_dashboard'
  get '/dashboard/shows', to: 'dashboard#shows', as: 'shows_dashboard'
  get '/dashboard/performances', to: 'dashboard#performances', as: 'performances_dashboard'
  get '/dashboard/account', to: 'dashboard#account', as: 'account_dashboard'
  patch '/dashboard/update', to: 'dashboard#update', as: 'update_dashboard'
  get '/dashboard/bookings', to: 'dashboard#bookings', as: 'bookings_dashboard'
  post '/contact', to: 'home#contact', as: 'home_contact'
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
