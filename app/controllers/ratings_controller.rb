class RatingsController < ApplicationController
  def index
    @ratings = Rating.all

    render("rating_templates/index.html.erb")
  end

  def show
    @rating = Rating.find(params.fetch("id_to_display"))

    render("rating_templates/show.html.erb")
  end

  def new_form
    @rating = Rating.new

    render("rating_templates/new_form.html.erb")
  end

  def create_row
    @rating = Rating.new

    @rating.user_id = params.fetch("user_id")
    @rating.restaurant_id = params.fetch("restaurant_id")
    @rating.rating_scale = params.fetch("rating_scale")
    @rating.occasion = params.fetch("occasion")

    if @rating.valid?
      @rating.save

      redirect_back(:fallback_location => "/ratings", :notice => "Rating created successfully.")
    else
      render("rating_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @rating = Rating.find(params.fetch("prefill_with_id"))

    render("rating_templates/edit_form.html.erb")
  end

  def update_row
    @rating = Rating.find(params.fetch("id_to_modify"))

    @rating.user_id = params.fetch("user_id")
    @rating.restaurant_id = params.fetch("restaurant_id")
    @rating.rating_scale = params.fetch("rating_scale")
    @rating.occasion = params.fetch("occasion")

    if @rating.valid?
      @rating.save

      redirect_to("/ratings/#{@rating.id}", :notice => "Rating updated successfully.")
    else
      render("rating_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @rating = Rating.find(params.fetch("id_to_remove"))

    @rating.destroy

    redirect_to("/users/#{@rating.user_id}", notice: "Rating deleted successfully.")
  end

  def destroy_row_from_restaurant
    @rating = Rating.find(params.fetch("id_to_remove"))

    @rating.destroy

    redirect_to("/restaurants/#{@rating.restaurant_id}", notice: "Rating deleted successfully.")
  end

  def destroy_row
    @rating = Rating.find(params.fetch("id_to_remove"))

    @rating.destroy

    redirect_to("/ratings", :notice => "Rating deleted successfully.")
  end
end
