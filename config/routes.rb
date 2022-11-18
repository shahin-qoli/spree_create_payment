Spree::Core::Engine.add_routes do
  namespace :api, defaults: { format: 'json' } do
     namespace :v2 do 
  # Add your extension routes here
       namespace :platform do
         resources :orders do
           member do
             post :create_payment
      end   
     end
  end      
end
end
end