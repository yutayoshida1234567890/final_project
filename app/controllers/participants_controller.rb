class ParticipantsController < ApplicationController
  def index
    @q = Participant.ransack(params[:q])
    @participants = @q.result(:distinct => true).includes(:user, :event).page(params[:page]).per(10)

    render("participant_templates/index.html.erb")
  end

  def show
    @participant = Participant.find(params.fetch("id_to_display"))

    render("participant_templates/show.html.erb")
  end

  def new_form
    @participant = Participant.new

    render("participant_templates/new_form.html.erb")
  end

  def create_row
    @participant = Participant.new

    @participant.event_id = params.fetch("event_id")
    @participant.user_id = params.fetch("user_id")
    @participant.location = params.fetch("location")

    if @participant.valid?
      @participant.save

      redirect_back(:fallback_location => "/participants", :notice => "Participant created successfully.")
    else
      render("participant_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_event
    @participant = Participant.new

    @participant.event_id = params.fetch("event_id")
    @participant.user_id = params.fetch("user_id")
    @participant.location = params.fetch("location")

    if @participant.valid?
      @participant.save

      redirect_to("/events/#{@participant.event_id}", notice: "Participant created successfully.")
    else
      render("participant_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @participant = Participant.find(params.fetch("prefill_with_id"))

    render("participant_templates/edit_form.html.erb")
  end

  def update_row
    @participant = Participant.find(params.fetch("id_to_modify"))

    @participant.event_id = params.fetch("event_id")
    @participant.user_id = params.fetch("user_id")
    @participant.location = params.fetch("location")

    if @participant.valid?
      @participant.save

      redirect_to("/participants/#{@participant.id}", :notice => "Participant updated successfully.")
    else
      render("participant_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @participant = Participant.find(params.fetch("id_to_remove"))

    @participant.destroy

    redirect_to("/users/#{@participant.user_id}", notice: "Participant deleted successfully.")
  end

  def destroy_row_from_event
    @participant = Participant.find(params.fetch("id_to_remove"))

    @participant.destroy

    redirect_to("/events/#{@participant.event_id}", notice: "Participant deleted successfully.")
  end

  def destroy_row
    @participant = Participant.find(params.fetch("id_to_remove"))

    @participant.destroy

    redirect_to("/participants", :notice => "Participant deleted successfully.")
  end
end
