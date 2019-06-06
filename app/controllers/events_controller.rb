class EventsController < ApplicationController
  def index
    @events = Event.all

    render("event_templates/index.html.erb")
  end

  def show
    @event = Event.find(params.fetch("id_to_display"))

    render("event_templates/show.html.erb")
  end

  def new_form
    @event = Event.new

    render("event_templates/new_form.html.erb")
  end

  def create_row
    @event = Event.new

    @event.venue_id = params.fetch("venue_id")

    if @event.valid?
      @event.save

      redirect_back(:fallback_location => "/events", :notice => "Event created successfully.")
    else
      render("event_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @event = Event.find(params.fetch("prefill_with_id"))

    render("event_templates/edit_form.html.erb")
  end

  def update_row
    @event = Event.find(params.fetch("id_to_modify"))

    @event.venue_id = params.fetch("venue_id")

    if @event.valid?
      @event.save

      redirect_to("/events/#{@event.id}", :notice => "Event updated successfully.")
    else
      render("event_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_venue
    @event = Event.find(params.fetch("id_to_remove"))

    @event.destroy

    redirect_to("/restaurants/#{@event.venue_id}", notice: "Event deleted successfully.")
  end

  def destroy_row
    @event = Event.find(params.fetch("id_to_remove"))

    @event.destroy

    redirect_to("/events", :notice => "Event deleted successfully.")
  end
end
