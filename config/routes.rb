Xuehua::Application.routes.draw do
  resources :comments,:only => [:create,:show,:destroy,:index]
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
  resources :pictures do
    post 'create_comment'
    get 'show_comment'
  end
  resources :users,:only => :show do
    collection  do
      get :start,  :as => :getting_start
      post :start ,:as => :getting_start
      get :account , :as=> :account
      get :bind_auth, :as => :bindding
    end
    resources :pictures
  end
  resources :posts
  resources :follows ,:only => :index do
    post :create,:as => :create
    delete :destroy,:as => :destroy
  end
  get "/email_confirm" => "home#email_confirm", :as => :password_confirm

  get "/home" => "home#index"

  get "/profile" => "profiles#edit", :as => :profile
  post "/profile" => "profiles#update", :as => :profile
  resources :avatars
  get "/start" => "profiles#start", :as => :getting_start
  post "/start" => "profiles#create", :as => :create_profile

  resources :notifications , :only => [:create, :destroy,:index] do
    collection do
      get :noty_update , :as => :noty_update
    end
  end
end
