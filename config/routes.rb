# == Route Map
#
#                        Prefix Verb   URI Pattern                              Controller#Action
#                      ckeditor        /ckeditor                                Ckeditor::Engine
#              new_user_session GET    /users/sign_in(.:format)                 devise/sessions#new
#                  user_session POST   /users/sign_in(.:format)                 devise/sessions#create
#          destroy_user_session GET    /users/sign_out(.:format)                devise/sessions#destroy
#                 user_password POST   /users/password(.:format)                devise/passwords#create
#             new_user_password GET    /users/password/new(.:format)            devise/passwords#new
#            edit_user_password GET    /users/password/edit(.:format)           devise/passwords#edit
#                               PATCH  /users/password(.:format)                devise/passwords#update
#                               PUT    /users/password(.:format)                devise/passwords#update
#      cancel_user_registration GET    /users/cancel(.:format)                  registrations#cancel
#             user_registration POST   /users(.:format)                         registrations#create
#         new_user_registration GET    /users/sign_up(.:format)                 registrations#new
#        edit_user_registration GET    /users/edit(.:format)                    registrations#edit
#                               PATCH  /users(.:format)                         registrations#update
#                               PUT    /users(.:format)                         registrations#update
#                               DELETE /users(.:format)                         registrations#destroy
#                    admin_root GET    /admin(.:format)                         admin/dashboard#index
# batch_action_admin_categories POST   /admin/categories/batch_action(.:format) admin/categories#batch_action
#              admin_categories GET    /admin/categories(.:format)              admin/categories#index
#                               POST   /admin/categories(.:format)              admin/categories#create
#            new_admin_category GET    /admin/categories/new(.:format)          admin/categories#new
#           edit_admin_category GET    /admin/categories/:id/edit(.:format)     admin/categories#edit
#                admin_category GET    /admin/categories/:id(.:format)          admin/categories#show
#                               PATCH  /admin/categories/:id(.:format)          admin/categories#update
#                               PUT    /admin/categories/:id(.:format)          admin/categories#update
#                               DELETE /admin/categories/:id(.:format)          admin/categories#destroy
#               admin_dashboard GET    /admin/dashboard(.:format)               admin/dashboard#index
#         confirmed_admin_order PUT    /admin/orders/:id/confirmed(.:format)    admin/orders#confirmed
#         delivered_admin_order PUT    /admin/orders/:id/delivered(.:format)    admin/orders#delivered
#     batch_action_admin_orders POST   /admin/orders/batch_action(.:format)     admin/orders#batch_action
#                  admin_orders GET    /admin/orders(.:format)                  admin/orders#index
#                               POST   /admin/orders(.:format)                  admin/orders#create
#               new_admin_order GET    /admin/orders/new(.:format)              admin/orders#new
#              edit_admin_order GET    /admin/orders/:id/edit(.:format)         admin/orders#edit
#                   admin_order GET    /admin/orders/:id(.:format)              admin/orders#show
#                               PATCH  /admin/orders/:id(.:format)              admin/orders#update
#                               PUT    /admin/orders/:id(.:format)              admin/orders#update
#                               DELETE /admin/orders/:id(.:format)              admin/orders#destroy
#   batch_action_admin_products POST   /admin/products/batch_action(.:format)   admin/products#batch_action
#                admin_products GET    /admin/products(.:format)                admin/products#index
#                               POST   /admin/products(.:format)                admin/products#create
#             new_admin_product GET    /admin/products/new(.:format)            admin/products#new
#            edit_admin_product GET    /admin/products/:id/edit(.:format)       admin/products#edit
#                 admin_product GET    /admin/products/:id(.:format)            admin/products#show
#                               PATCH  /admin/products/:id(.:format)            admin/products#update
#                               PUT    /admin/products/:id(.:format)            admin/products#update
#                               DELETE /admin/products/:id(.:format)            admin/products#destroy
#          approve_admin_top_up PUT    /admin/top_ups/:id/approve(.:format)     admin/top_ups#approve
#    batch_action_admin_top_ups POST   /admin/top_ups/batch_action(.:format)    admin/top_ups#batch_action
#                 admin_top_ups GET    /admin/top_ups(.:format)                 admin/top_ups#index
#                               POST   /admin/top_ups(.:format)                 admin/top_ups#create
#              new_admin_top_up GET    /admin/top_ups/new(.:format)             admin/top_ups#new
#             edit_admin_top_up GET    /admin/top_ups/:id/edit(.:format)        admin/top_ups#edit
#                  admin_top_up GET    /admin/top_ups/:id(.:format)             admin/top_ups#show
#                               PATCH  /admin/top_ups/:id(.:format)             admin/top_ups#update
#                               PUT    /admin/top_ups/:id(.:format)             admin/top_ups#update
#                               DELETE /admin/top_ups/:id(.:format)             admin/top_ups#destroy
#      batch_action_admin_users POST   /admin/users/batch_action(.:format)      admin/users#batch_action
#                   admin_users GET    /admin/users(.:format)                   admin/users#index
#                               POST   /admin/users(.:format)                   admin/users#create
#                new_admin_user GET    /admin/users/new(.:format)               admin/users#new
#               edit_admin_user GET    /admin/users/:id/edit(.:format)          admin/users#edit
#                    admin_user GET    /admin/users/:id(.:format)               admin/users#show
#                               PATCH  /admin/users/:id(.:format)               admin/users#update
#                               PUT    /admin/users/:id(.:format)               admin/users#update
#                               DELETE /admin/users/:id(.:format)               admin/users#destroy
#                admin_settings GET    /admin/settings(.:format)                admin/settings#index
#                admin_comments GET    /admin/comments(.:format)                admin/comments#index
#                               POST   /admin/comments(.:format)                admin/comments#create
#                 admin_comment GET    /admin/comments/:id(.:format)            admin/comments#show
#   activeadmin_settings_cached        /admin                                   ActiveadminSettingsCached::Engine
#                          root GET    /                                        home#index
#           add_to_cart_product POST   /produk/:id/add_to_cart(.:format)        products#add_to_cart
#                      products GET    /produk(.:format)                        products#index
#                               POST   /produk(.:format)                        products#create
#                   new_product GET    /produk/new(.:format)                    products#new
#                  edit_product GET    /produk/:id/edit(.:format)               products#edit
#                       product GET    /produk/:id(.:format)                    products#show
#                               PATCH  /produk/:id(.:format)                    products#update
#                               PUT    /produk/:id(.:format)                    products#update
#                               DELETE /produk/:id(.:format)                    products#destroy
#                         saldo GET    /saldo(.:format)                         home#topup
#                  tambah_saldo POST   /saldo(.:format)                         home#topup_credit
#              delete_from_cart DELETE /keranjang/:id/buang(.:format)           home#remove_from_cart
#                     keranjang GET    /keranjang(.:format)                     home#cart
#                    addressing POST   /alamat(.:format)                        home#addressing
#                        alamat GET    /alamat(.:format)                        home#address
#                  order_detail GET    /pesanan/:id(.:format)                   users#order
#                       pesanan GET    /pesanan(.:format)                       users#orders
#                      dagangan GET    /dagangan(.:format)                      users#products
#                 dagangan_baru GET    /dagangan/baru(.:format)                 users#new_product
#                       daleman GET    /daleman(.:format)                       home#order
#                         login GET    /login(.:format)                         home#login
#                        daftar GET    /daftar(.:format)                        home#register
#                    konfirmasi GET    /konfirmasi(.:format)                    home#confirmation
#                        finish POST   /konfirmasi(.:format)                    home#finish
#                      provinsi GET    /provinsi(.:format)                      addresses#province
#                          kota GET    /kota(.:format)                          addresses#city
#                          page GET    /pages/*id                               high_voltage/pages#show
#
# Routes for Ckeditor::Engine:
#         pictures GET    /pictures(.:format)             ckeditor/pictures#index
#                  POST   /pictures(.:format)             ckeditor/pictures#create
#          picture DELETE /pictures/:id(.:format)         ckeditor/pictures#destroy
# attachment_files GET    /attachment_files(.:format)     ckeditor/attachment_files#index
#                  POST   /attachment_files(.:format)     ckeditor/attachment_files#create
#  attachment_file DELETE /attachment_files/:id(.:format) ckeditor/attachment_files#destroy
#
# Routes for ActiveadminSettingsCached::Engine:
# settings PATCH /settings(.:format) activeadmin_settings_cached/settings#update
#          PUT   /settings(.:format) activeadmin_settings_cached/settings#update
#

Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: { registrations: 'registrations' }
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

  get 'saldo' => 'users#topup'
  post 'saldo' => 'users#topup_credit', as: 'tambah_saldo'
  delete 'keranjang/:id/buang' => 'home#remove_from_cart', as: 'delete_from_cart'
  get 'keranjang' => 'orders#cart'
  post 'alamat' => 'orders#addressing', as: 'addressing'
  get 'alamat' => 'orders#address'
  get 'pesanan/:id' => 'users#order', as: 'order_detail'
  get 'pesanan' => 'users#orders'
  get 'penjualan' => 'users#sell', as: 'sell'
  get 'dagangan' => 'users#products'
  get 'dagangan/baru' => 'users#new_product', as: 'new_sell'
  get 'dagangan/:id/hapus' => 'users#new_product', as: 'delete_sell'
  get 'daleman' => 'home#order'
  get 'login' => 'home#login'
  get 'daftar' => 'home#register'
  get 'konfirmasi' => 'orders#confirmation'
  post 'konfirmasi' => 'orders#finish', as: 'finish'
  get 'tentang' => 'high_voltage/pages#show', id: 'about'
  get 'aturan' => 'high_voltage/pages#show', id: 'terms_and_condition'
  get 'kontak' => 'home#contact'
  post 'kontak/kirim' => 'home#send_contact', as: 'send_contact'

  # line item
  post 'penjualan/:id/setujui' => 'line_items#approve', as: 'line_items_approve'
  post 'penjualan/:id/batal' => 'line_items#cancel', as: 'line_items_cancel'
  post 'penjualan/:id/kirim' => 'line_items#ship', as: 'line_items_ship'

  # AJAX
  get 'provinsi' => 'addresses#province'
  get 'kota' => 'addresses#city'

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
