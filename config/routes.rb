Rails.application.routes.draw do
  # Routes for the Participant resource:

  # CREATE
  get("/participants/new", { :controller => "participants", :action => "new_form" })
  post("/create_participant", { :controller => "participants", :action => "create_row" })

  # READ
  get("/participants", { :controller => "participants", :action => "index" })
  get("/participants/:id_to_display", { :controller => "participants", :action => "show" })

  # UPDATE
  get("/participants/:prefill_with_id/edit", { :controller => "participants", :action => "edit_form" })
  post("/update_participant/:id_to_modify", { :controller => "participants", :action => "update_row" })

  # DELETE
  get("/delete_participant/:id_to_remove", { :controller => "participants", :action => "destroy_row" })

  #------------------------------

  # Routes for the Preference resource:

  # CREATE
  get("/preferences/new", { :controller => "preferences", :action => "new_form" })
  post("/create_preference", { :controller => "preferences", :action => "create_row" })

  # READ
  get("/preferences", { :controller => "preferences", :action => "index" })
  get("/preferences/:id_to_display", { :controller => "preferences", :action => "show" })

  # UPDATE
  get("/preferences/:prefill_with_id/edit", { :controller => "preferences", :action => "edit_form" })
  post("/update_preference/:id_to_modify", { :controller => "preferences", :action => "update_row" })

  # DELETE
  get("/delete_preference/:id_to_remove", { :controller => "preferences", :action => "destroy_row" })

  #------------------------------

  # Routes for the Restaurant resource:

  # CREATE
  get("/restaurants/new", { :controller => "restaurants", :action => "new_form" })
  post("/create_restaurant", { :controller => "restaurants", :action => "create_row" })

  # READ
  get("/restaurants", { :controller => "restaurants", :action => "index" })
  get("/restaurants/:id_to_display", { :controller => "restaurants", :action => "show" })

  # UPDATE
  get("/restaurants/:prefill_with_id/edit", { :controller => "restaurants", :action => "edit_form" })
  post("/update_restaurant/:id_to_modify", { :controller => "restaurants", :action => "update_row" })

  # DELETE
  get("/delete_restaurant/:id_to_remove", { :controller => "restaurants", :action => "destroy_row" })

  #------------------------------

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
