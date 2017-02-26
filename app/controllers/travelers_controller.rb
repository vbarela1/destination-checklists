class TravelersController < ApplicationController
  before_action :set_traveler, only: [:show, :edit, :update, :destroy]

  def index
    @travelers = Traveler.all 
  end

  def show
  end

  def new 
    @traveler = Traveler.new 
  end 

  def create 
    @traveler = Traveler.new(set_traveler_params)
    if @traveler.save
      flash[:success] = 'New Traveler Created!'
      redirect_to traveler_path(@traveler)
    else
      flash[:error] = 'Please try again.'
      render :new 
    end 
  end

  def edit 
  end 

  def update 
    if @traveler.update(set_traveler_params)
      flash[:success] = 'Traveler Updated!'
      redirect_to traveler_path(@traveler)
    else 
      flash[:error] = 'Please Try Again.'
      render :edit
    end 
  end 

  def destroy 
    @traveler.destroy
    flash[:success] = 'Traveler Deleted.'
    redirect_to travelers_path 
  end 

private 

  def set_traveler 
    @traveler = Traveler.find(params[:id])
  end 

  def set_traveler_params
    params.require(:traveler).permit(:first_name, :last_name, :interests)
  end 

  def sign_up_params
   params.require(:traveler).permit(:first_name, :last_name, :email, :password, 
   :password_confirmation)
 end
  def account_update_params
   params.require(:traveler).permit(:first_name, :last_name, :email, :password, 
   :password_confirmation, :current_password)
 end
end
