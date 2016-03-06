Cinema::Application.routes.draw do

  
  
  put "voices/:increase_id" => "voices#increase", :as => "voices_increase"
  put "voices/:decrease_id" => "voices#decrease", :as => "voices_decrease"

  namespace :admin do
    resources  :admins
    resources  :configurables
    resources  :clients
    resources  :tasks
  end
  
  get 'admins/index'
    


  resources :answerfrommoderators
  resources :messagestoadministrators
  resources :messages
  resources :product_types
  resources :orders
  resources :line_items
  resources :carts
  
  resources :searches do 
    collection do
      post "search_film" => "searches#search_film"
    end
  end

  resources :folders
  resources :loads

  
  get 'home/index'

  get 'store/index'
  get 'store/all_category'
  get 'store/show'
  get 'store/contact'
  get 'line/increase',to: 'line_items#increase', as: :increase_line_item
  get 'line/decrease',to: 'line_items#decrease', as: :decrease_line_item
  get 'store/showlike'
  get '/change_locale/:locale', to: 'pages#change_locale', as: :change_locale
  


  resources :products do 
    collection do
      get "search" => "products#search"
    end
      resources :comments, module: :products do
    end
  end  
  
  resources :invitations do
    member do
      get "invitat/:id" =>"invitations#search_token", :as=>"search_token"
    end
  end
  
   # BLOGS
  
  resources :blogs do
    member do
      get "show_blog" => "blogs#show_blog"
    end 
    collection do
      get "search" => "blogs#search"
      get "home" => "blogs#home"
     
      get "about" => "blogs#about"
      get "contact" => "blogs#contact"
      get "features" => "blogs#features"
      get "services" => "blogs#services"
    end
   
  end
  
  resources :blogs, shallow: true  do
    resources :postings do
      member do
        get "show_posting" => "postings#show_posting"
      end
    end
  end
 
    
 

  resources :postings do
    resources :comments, module: :postings do
    end  
    collection do
      get :tags
    end
  end


  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  resources :posts do
    resources :questions
  end  

  resources :questions do
    resources :answers
  end  

  get "browse/:folder_id" => "loads#browse", :as => "browse"
  get "browse/:folder_id/new_folder" => "folders#new", :as => "new_sub_folder"
 # post 'pages/download'
  #get 'pages/index'
  #post 'pages/upload' 
  delete 'user_delete/:id' => 'admins#delete_user', as: "delete_user"
  
  get "info_show_from_email/:user_id" => "infos#show_from_email", :as => "user_show"
  get "info_show_from_navbar/:user_id" => "infos#show_from_navbar", :as => "user_show_navbar"
  get "ban_the_user/:id" => "admins#ban_the_user", :as => "ban"
  
resources :infos 

devise_for :admins do
  collection do
   
  end
end
 resources :films, except: [:index] do
 
    resources :comments, module: :films do
      collection do
        get "new_with_info" => "comments#new_with_info"
      end
    end  
    collection do
     
      get "trailer" => "films#trailer"
      get "latest" => "films#latest"
      get "top_rated" => "films#top_rated"
      get "action" => "films#action"
      get "documental" => "films#documental"
      get "films/search" => "films#search", :as => "search_film"
      get "comedy" => "films#comedy", :as => "comedy"
      get "history" => "films#history", :as => "history"
      get "horror" => "films#horror", :as => "horror"
      get "other" => "films#other"
    end
    member do
      get "show_modal" => "films#show_modal"
      put "like"=>"films#upvote"
      put "dislike"=>"films#downvote"
     
    end
  end
   get "films/get/:id" => "films#get", :as => "download_film"


  resources :asets

  resources :actors do
     resources :comments, module: :films do
  end 
    end  
  get "loads/get/:id" => "loads#get", :as => "download"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#all_film'

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
