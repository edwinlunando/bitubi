Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  ActiveAdmin.routes(self)
  mount ActiveadminSettingsCached::Engine => '/admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :products, path: 'produk' do
    member do
      post 'add_to_cart'
    end
  end

  get 'saldo' => 'home#topup'
  post 'saldo' => 'home#topup_credit', as: 'tambah_saldo'
  delete 'keranjang/:id/buang' => 'home#remove_from_cart', as: 'delete_from_cart'
  get 'keranjang' => 'home#cart'
  post 'alamat' => 'home#finish', as: 'finish'
  get 'alamat' => 'home#address'
  get 'pesanan' => 'home#orders'
  get 'daleman' => 'home#order'
  get 'login' => 'home#login'
  get 'daftar' => 'home#register'

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
