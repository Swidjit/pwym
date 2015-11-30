Rails.application.routes.draw do

  devise_for :users,
    :controllers => { :registrations => "registrations", :sessions => "sessions",omniauth_callbacks: 'omniauth_callbacks' }
  resources :users do
    member do
      post 'upload_file'
    end
  end

  resources :posts, :only => [:create, :update, :destroy, :show,:index, :edit] do
    collection do
      get 'autocomplete_tag_search'
    end
    member do
      post 'create_or_destroy_reaction'
    end
  end
  resources :comments, :only => [:create, :destroy]

  resources :games, :only => [:show, :edit, :update, :index]


  resources :game_categories, :only => [:index, :show, :edit, :update]

  resources :matches, :only => [:create, :destroy, :show, :edit, :update] do
    member do
      post :leave
      get :refresh
      get :refresh_scoreboard
      get :play
      get :check
      post :check_into
      get :load_game
    end
    resources :entries, :only => [:create,:index]
  end

  resources :articles

  resources :round_scores, :only => [:create]

  root 'pages#home'
  get '/pages/:page_name' => 'pages#index', :as => :pages
  get '/posts/:category/:tag' => 'posts#index', :as => :filtered_posts
  get '/brain-games/:category/:game' => 'games#show'
  get '/brain-games/' => 'game_categories#index'
  get '/brain-games/:id/' => 'game_categories#show'
  get '/brain-articles/:category/:id' => 'articles#show'
  get '/brain-articles/:id/' => 'articles#index'
  get '/brain-articles/' => 'categories#index'
  get '/sitemap.xml' => 'pages#sitemap'
  get '/puzzles-brainteasers/:puzzle/:id' => 'puzzle_categories#show_puzzle'
  get '/puzzles-brainteasers/:puzzle/' => 'puzzle_categories#show'
  get '/puzzles-brainteasers/' => 'puzzle_categories#index'
  post '/brainball/*all' => 'pages#brainball', defaults: { format: 'xml' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup


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
