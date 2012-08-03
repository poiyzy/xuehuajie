Xuehua::Application.routes.draw do
  get "users/show"

  get "users/account"

  devise_for :users,:controllers => { :omniauth_callbacks => "omniauth_callbacks" }, :skip => [:sessions,:registration] do

  end
  devise_scope :user do
    get '/' => 'devise/sessions#new', :as => :root
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
    get 'signup' => "devise/registrations#new", :as => :new_user_registration
    post 'signup' => "devise/registrations#create", :as => :user_registration
    get '/users/cancle' => "devise/registrations#cancel", :as => :cancel_user_registration
    get '/users/edit' => "devise/registrations#edit", :as => :edit_user_registration 
  end
  resources :posts
  resources :users,:only => :show do
    collection  do
      get :start,  :as => :getting_start
      post :start ,:as => :getting_start
      get :account , :as=> :account
      get :bind_auth, :as => :bindding
    end
  end
  get "/home" => "home#index"
  get "/profile" => "profiles#edit", :as => :profile
  post "/profile" => "profiles#update", :as => :profile
  get "/start" => "profiles#start", :as => :getting_start
  post "/start" => "profiles#create", :as => :create_profile
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
