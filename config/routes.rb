Rails.application.routes.draw do
  # Sets the Devise Route for Signup, this must be situated here before Devise.
  devise_scope :user do
    get "/signup" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  
  devise_for :users, :controllers => {registrations: "registrations", sessions: "sessions", :omniauth_callbacks => "callbacks"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'disclaimer', to: 'pages#disclaimer'

  
  resources :exercises do
    member do
      put "like", to: "exercises#upvote"
      put "dislike", to: "exercises#downvote"
    end
    resources :variations do
      get ':id/edit' => "variations#edit"
      get 'new' => "variations#new"
    end
  end
  
  resources :routines
  resources :categories
  resources :muscle_groups
  resources :blogs
  resources :administrators
  resources :dashboard
  
  resources :feedbacks, only: [:create, :show, :edit, :update, :destroy]
  
  get 'your_feedback' => "feedbacks#new"
  get 'feedback/dashboard' => "feedbacks#index"
  
  resources :contacts, only: [:create]
  get 'contact' => "contacts#new"
  
  
   # error pages
  #%w( 404 422 500 503 ).each do |code|
  #  get code, :to => "errors#show", :code => code
  #end
  
  # Static Pages
  # generic multiview
  # get "/pages/:page" => "pages#show"
  #get ":page" => "pages#show"

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
