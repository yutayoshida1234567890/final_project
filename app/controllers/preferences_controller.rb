class PreferencesController < ApplicationController
  before_action :current_user_must_be_preference_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_preference_user
    preference = Preference.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == preference.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.preferences.ransack(params[:q])
    @preferences = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)

    render("preference_templates/index.html.erb")
  end

  def show
    @preference = Preference.find(params.fetch("id_to_display"))

    render("preference_templates/show.html.erb")
  end

  def new_form
    @preference = Preference.new

    render("preference_templates/new_form.html.erb")
  end

  def create_row
    @preference = Preference.new

    @preference.user_id = params.fetch("user_id")
    @preference.cuisine = params.fetch("cuisine")
    @preference.preference_scale = params.fetch("preference_scale")
    @preference.dietary_restriction = params.fetch("dietary_restriction")

    if @preference.valid?
      @preference.save

      redirect_back(:fallback_location => "/preferences", :notice => "Preference created successfully.")
    else
      render("preference_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @preference = Preference.find(params.fetch("prefill_with_id"))

    render("preference_templates/edit_form.html.erb")
  end

  def update_row
    @preference = Preference.find(params.fetch("id_to_modify"))

    
    @preference.cuisine = params.fetch("cuisine")
    @preference.preference_scale = params.fetch("preference_scale")
    @preference.dietary_restriction = params.fetch("dietary_restriction")

    if @preference.valid?
      @preference.save

      redirect_to("/preferences/#{@preference.id}", :notice => "Preference updated successfully.")
    else
      render("preference_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @preference = Preference.find(params.fetch("id_to_remove"))

    @preference.destroy

    redirect_to("/users/#{@preference.user_id}", notice: "Preference deleted successfully.")
  end

  def destroy_row
    @preference = Preference.find(params.fetch("id_to_remove"))

    @preference.destroy

    redirect_to("/preferences", :notice => "Preference deleted successfully.")
  end
end
