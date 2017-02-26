class ChecklistsController < ApplicationController
  before_action :set_destination

  def show
    @checklist = Checklist.find(params[:id])
  end

  private


  def set_destination
    @destination = Destination.find(params[:destination_id])
  end

end
