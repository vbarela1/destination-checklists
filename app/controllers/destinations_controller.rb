class DestinationsController < ApplicationController
  before_action :set_traveler
  before_action :set_destination, only: [:show, :edit, :update, :destroy]
  def index
    @destinations = @traveler.destinations
  end

  def show
    
  end

  def new
    @destination = @traveler.destinations.new
  end

  def create 
    @destination = @traveler.destinations.new(destination_params)
    if @destination.save
      flash[:success] = 'Destination Created'
      redirect_to traveler_destination_path(@traveler, @destination)
    else 
      render :new 
    end
  end 

  def edit 
  end 

  def update 
    if @destination.update(destination_params)
      flash[:success] = 'Destination Updated!'
      redirect_to traveler_destination_path(@traveler, @destination)
    else 
      render :edit 
    end 
  end 

  def destroy 
    @destination.destroy
    flash[:success] = 'Destination Deleted!'
    redirect_to traveler_destinations_path(@traveler)
  end 

private 

  def destination_params 
    params.required(:destination).permit(:name, :description, :location)
  end 

  def set_traveler
    @traveler = Traveler.find(params[:traveler_id])
  end 

  def set_destination
    @destination = @traveler.destinations.find(params[:id])
  end
end 