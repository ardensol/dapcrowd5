Crowdhoster::Application.routes.draw do

 

  get "comments/index"

  get "comments/new"

  resources :labs do
    resources :mainoptions do
      member do
        put "like", to: "mainoptions#upvote"
        put "dislike", to: "mainoptions#downvote"
      end
    end
    resources :comments
    member do
      put "like", to: "labs#upvote"
      put "dislike", to: "labs#downvote"
    end
  end


  resources :mainoptions do
      member do
        put "like", to: "mainoptions#upvote"
        put "dislike", to: "mainoptions#downvote"
      end
  end


  resources :prototypes do
    member do
      put "like", to: "prototypes#upvote"
      put "dislike", to: "prototypes#downvote"
    end
  end


  mount Ckeditor::Engine => '/ckeditor'

  # PAGES
  

  resources :posts do 
    resources :comments
  end

  # USERS
  resources :profiles
  match '/profiles/:id/comments',                      to: 'profiles#comment'

  get 'r/:code' => 'reffiliate#referral', as: 'referral'
 

  match 'referafriend' => 'reffiliate#new', :as => 'referafriend', :via => :get
  match 'referafriend' => 'reffiliate#create', :as => 'referafriend', :via => :post
  
  root :to => 'pages#index'

  devise_for :users, 
    path: 'account', 
    controllers: {registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks"} 
  devise_scope :user do
    authenticated :user do
  
      match '/wedding',                                to: 'pages#wedding'
    end
    unauthenticated :user do
      match '/wedding',                                to: 'pages#wedding_sign_up'
    end
    match '/user/settings',                            to: 'devise/registrations#edit',             as: :user_settings
  end

  resources :store_credits
  resources :users do
    resources :store_credits
  end

  match '/discussion',                     to: 'pages#discussion'
  
  match '/privacy',                     to: 'pages#privacy'
  match '/fitguide',                     to: 'pages#fitguide'
  match '/howitworks',                     to: 'pages#howitworks'
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
  # ADMIN
  get '/admin',                                to: 'admin#admin_dashboard',                 as: :admin_dashboard
  match '/admin/homepage',                     to: 'admin#admin_homepage',                  as: :admin_homepage
  match '/admin/site-settings',                to: 'admin#admin_site_settings',             as: :admin_site_settings
  match '/admin/customize',                    to: 'admin#admin_customize',                 as: :admin_customize
  namespace :admin do
    resources :campaigns
    post '/payments/:id/refund',               to: 'payments#refund_payment',               as: :admin_payment_refund
  end

  match '/admin/campaigns/:id/copy',           to: 'admin/campaigns#copy',                  as: :admin_campaigns_copy
  match '/admin/campaigns/:id/payments',       to: 'admin/campaigns#payments',              as: :admin_campaigns_payments
  match '/admin/processor-setup',              to: 'admin#admin_processor_setup',           as: :admin_processor_setup
  post '/admin/bank-setup',                    to: 'admin#create_admin_bank_account',       as: :create_admin_bank_account
  get '/admin/bank-setup',                     to: 'admin#admin_bank_account',              as: :admin_bank_account
  delete '/admin/bank-setup',                  to: 'admin#delete_admin_bank_account',       as: :delete_admin_bank_account
  match '/admin/notification-setup',           to: 'admin#admin_notification_setup',        as: :admin_notification_setup
  match '/ajax/verify',                        to: 'admin#ajax_verify',                     as: :ajax_verify

  # CAMPAIGNS
  match '/:id/checkout/amount',                to: 'campaigns#checkout_amount',             as: :checkout_amount
  match '/:id/checkout/payment',               to: 'campaigns#checkout_payment',            as: :checkout_payment
  match '/:id/checkout/process',               to: 'campaigns#checkout_process',            as: :checkout_process
  match '/:id/checkout/confirmation',          to: 'campaigns#checkout_confirmation',       as: :checkout_confirmation
  post '/:id/checkout/error',                  to: 'campaigns#checkout_error',              as: :checkout_error
  match '/:id',                                to: 'campaigns#home',                        as: :campaign_home
  match '/:id/ajax/create_payment_user',        to: 'campaigns#ajax_create_payment_user',    as: :ajax_create_payment_user

  resources :campaigns do 
    resources :comments
  end

  
  namespace :api, defaults: {format: 'json'} do
    scope module: :v0  do
      resources :campaigns, only: :show do
        resources :payments, only: :index
      end
    end
  end
end
