Saveme::Application.routes.draw do

  resources :message, :only => ['create']
  match "/joinqueue" => "videoconferences#join_queue"
  match "/videoconference" => "videoconferences#create"
  match 'people' => "people#create", :via => ["post"]

  root :to => "videoconferences#index"

  match "/pusher/auth"        => "pusher#auth"
  match '/help_me'            => 'twilio#help_me'
  match '/help_me/call_ended' => 'twilio#call_ended'
  match '/mobile'             => 'mobile#index'
  match '/mobile/report'      => 'mobile#report', :as => :incident_reports, :via => ["get"]
  match '/mobile/report'      => 'mobile#submit_report', :as => :submit_report, :via => ["post"]
  match '/mobile/respond'     => 'mobile#respond', :as => :respond
  #match '/sms/incoming'       => 'twilio#incoming_sms'


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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
