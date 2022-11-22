Spree::Core::Engine.add_routes do
  namespace :api, defaults: { format: 'json' } do
     namespace :v2 do 
       namespace :platform do
         resources :orders do
           member do
             post :create_payment
           end   
         end
     end      
   end
  end

  namespace :admin, path: Spree.admin_path do
    resources :orders, except: [:show] do
      member do
        resources :followup        
      end  
    end  
    

  end  

end