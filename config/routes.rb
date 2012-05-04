AmazonApp::Application.routes.draw do

  get "store", :controller => "items", :action => "index", :as => :items
  post "store", :controller => "items", :action => "create"
  
  get "store/new", :controller => "items", :action => "new", :as => :new_item
  
  get "store/:id", :controller => "items", :action => "show", :as => :item
  put "store/:id", :controller => "items", :action => "update"
  delete "store/:id", :controller => "items", :action => "destroy"
 
  get "store/:id/edit", :controller => "items", :action => "edit", :as => :edit_item
  
  
  get "cart", :controller => "carts", :action => "index", :as => :carts
  put "cart/:id", :controller => "carts", :action => "update", :as => :cart

end
