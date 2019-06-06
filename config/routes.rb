Rails.application.routes.draw do
  # Routes for the Rating resource:

  # CREATE
  get("/ratings/new", { :controller => "ratings", :action => "new_form" })
  post("/create_rating", { :controller => "ratings", :action => "create_row" })

  # READ
  get("/ratings", { :controller => "ratings", :action => "index" })
  get("/ratings/:id_to_display", { :controller => "ratings", :action => "show" })

  # UPDATE
  get("/ratings/:prefill_with_id/edit", { :controller => "ratings", :action => "edit_form" })
  post("/update_rating/:id_to_modify", { :controller => "ratings", :action => "update_row" })

  # DELETE
  get("/delete_rating/:id_to_remove", { :controller => "ratings", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
