# == Route Map
#
#                        Prefix Verb   URI Pattern                              Controller#Action
#                      ckeditor        /ckeditor                                Ckeditor::Engine
#              new_user_session GET    /admin/login(.:format)                   active_admin/devise/sessions#new
#                  user_session POST   /admin/login(.:format)                   active_admin/devise/sessions#create
#          destroy_user_session GET    /admin/logout(.:format)                  active_admin/devise/sessions#destroy
#                 user_password POST   /admin/password(.:format)                active_admin/devise/passwords#create
#             new_user_password GET    /admin/password/new(.:format)            active_admin/devise/passwords#new
#            edit_user_password GET    /admin/password/edit(.:format)           active_admin/devise/passwords#edit
#                               PATCH  /admin/password(.:format)                active_admin/devise/passwords#update
#                               PUT    /admin/password(.:format)                active_admin/devise/passwords#update
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
# batch_action_admin_line_items POST   /admin/line_items/batch_action(.:format) admin/line_items#batch_action
#              admin_line_items GET    /admin/line_items(.:format)              admin/line_items#index
#                               POST   /admin/line_items(.:format)              admin/line_items#create
#           new_admin_line_item GET    /admin/line_items/new(.:format)          admin/line_items#new
#          edit_admin_line_item GET    /admin/line_items/:id/edit(.:format)     admin/line_items#edit
#               admin_line_item GET    /admin/line_items/:id(.:format)          admin/line_items#show
#                               PATCH  /admin/line_items/:id(.:format)          admin/line_items#update
#                               PUT    /admin/line_items/:id(.:format)          admin/line_items#update
#                               DELETE /admin/line_items/:id(.:format)          admin/line_items#destroy
#          transfer_admin_order PUT    /admin/orders/:id/transfer(.:format)     admin/orders#transfer
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
#         activation_admin_user PUT    /admin/users/:id/activation(.:format)    admin/users#activation
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
#                   vendor_view GET    /vendor/:id(.:format)                    products#vendor
#                         saldo GET    /saldo(.:format)                         users#topup
#                  tambah_saldo POST   /saldo(.:format)                         users#topup_credit
#              delete_from_cart DELETE /keranjang/:id/buang(.:format)           orders#remove_from_cart
#                     keranjang GET    /keranjang(.:format)                     orders#cart
#                    addressing POST   /alamat(.:format)                        orders#addressing
#                        alamat GET    /alamat(.:format)                        orders#address
#                  order_detail GET    /pesanan/:id(.:format)                   users#order
#                       pesanan GET    /pesanan(.:format)                       users#orders
#                       account GET    /akun(.:format)                          users#account
#                account_update POST   /akun/simpan(.:format)                   users#account_edit
#                          sell GET    /penjualan(.:format)                     users#sell
#                     sell_view GET    /penjualan/:id(.:format)                 users#sell_view
#                  sell_receipt PATCH  /penjualan/:id/receipt(.:format)         users#receipt
#                      dagangan GET    /dagangan(.:format)                      users#products
#                   create_sell POST   /dagangan(.:format)                      users#create_product
#                      new_sell GET    /dagangan/baru(.:format)                 users#new_product
#                   delete_sell GET    /dagangan/:id/hapus(.:format)            users#new_product
#                     edit_sell GET    /dagangan/:id/edit(.:format)             users#edit_product
#                   update_sell POST   /dagangan/:id/ubah(.:format)             users#update_product
#                       daleman GET    /daleman(.:format)                       home#order
#                         login GET    /login(.:format)                         home#login
#               create_supplier POST   /daftar/vendor(.:format)                 home#create_supplier
#             register_supplier GET    /daftar/vendor(.:format)                 home#register_supplier
#                        daftar GET    /daftar(.:format)                        home#register
#                    konfirmasi GET    /konfirmasi(.:format)                    orders#confirmation
#                        finish POST   /konfirmasi(.:format)                    orders#finish
#                       tentang GET    /tentang(.:format)                       high_voltage/pages#show {:id=>"about"}
#                           faq GET    /faq(.:format)                           high_voltage/pages#show {:id=>"faq"}
#                        aturan GET    /aturan(.:format)                        high_voltage/pages#show {:id=>"terms_and_condition"}
#                        kontak GET    /kontak(.:format)                        home#contact
#                  send_contact POST   /kontak/kirim(.:format)                  home#send_contact
#             line_items_cancel POST   /penjualan/:id/batal(.:format)           line_items#cancel
#               line_items_ship POST   /penjualan/:id/kirim(.:format)           line_items#ship
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

Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  ActiveAdmin.routes(self)

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :products, path: 'produk' do

    member do
      post 'add_to_cart'
    end

  end

  get 'daftar-vendor' => 'products#vendors', as: 'vendors'
  get 'vendor/:id' => 'products#vendor', as: 'vendor_view'
  get 'saldo' => 'users#topup'
  post 'saldo/:id/transfer' => 'users#topup_transfer', as: 'top_up_transfer'
  get 'saldo/konfirmasi' => 'users#topup_confirm', as: 'top_up_confirm'
  # get 'saldo/penarikan' => 'users#withdrawal'
  post 'saldo' => 'users#topup_credit', as: 'tambah_saldo'
  delete 'keranjang/:id/buang' => 'orders#remove_from_cart', as: 'delete_from_cart'
  get 'keranjang' => 'orders#cart'
  post 'alamat' => 'orders#addressing', as: 'addressing'
  get 'alamat' => 'orders#address'
  get 'pesanan/:id' => 'users#order', as: 'order_detail'
  get 'pesanan' => 'users#orders'
  get 'akun' => 'users#account', as: 'account'
  post 'akun/ganti_password' => 'users#change_password', as: 'account_change_password'
  get 'akun/profil' => 'users#account_profile', as: 'account_profile'
  get 'akun/vendor' => 'users#account_vendor', as: 'account_vendor'
  post 'akun/simpan' => 'users#account_edit', as: 'account_update'
  get 'penjualan' => 'users#sell', as: 'sell'
  get 'penjualan/:id' => 'users#sell_view', as: 'sell_view'
  patch 'penjualan/:id/receipt' => 'users#receipt', as: 'sell_receipt'
  get 'dagangan' => 'users#products'
  post 'dagangan' => 'users#create_product', as: 'create_sell'
  get 'dagangan/baru' => 'users#new_product', as: 'new_sell'
  delete 'dagangan/:id/hapus' => 'users#delete_product', as: 'delete_sell'
  get 'dagangan/:id/edit' => 'users#edit_product', as: 'edit_sell'
  post 'dagangan/:id/ubah' => 'users#update_product', as: 'update_sell'
  get 'daleman' => 'home#order'
  get 'login' => 'home#login'
  post 'daftar/vendor' => 'home#create_supplier', as: 'create_supplier'
  get 'daftar/vendor' => 'home#register_supplier', as: 'register_supplier'
  get 'daftar' => 'home#register'
  get 'konfirmasi' => 'orders#confirmation'
  post 'konfirmasi' => 'orders#finish', as: 'finish'
  get 'tentang' => 'high_voltage/pages#show', id: 'about'
  get 'faq' => 'high_voltage/pages#show', id: 'faq'
  get 'aturan' => 'high_voltage/pages#show', id: 'terms_and_condition'
  get 'kontak' => 'home#contact'
  post 'kontak/kirim' => 'home#send_contact', as: 'send_contact'

  # order
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
