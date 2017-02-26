class ItemsController < ApplicationController
  before_action :set_item, only: [:complete, :edit, :destroy, :update]
  before_action :set_checklist, only: [:create]

  def create
    item = @checklist.items.new
    item.name = params[:name]
    item.description = params[:description]
    if params[:complete].present?
      item.complete = 'yes'
    else
      item.complete = 'no'
    end
    if item.save
      flash[:success] = "Saved Item #{item.name}"
      redirect_to :back
    else
      flash[:error] = "Item #{item.name} errors" + item.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  def edit
  end

  def update
    @checklist = @item.checklist
    if @item.update(item_params)
      redirect_to traveler_destination_checklist_path(current_traveler, @checklist.destination.id, @checklist)
    else
      flash[:error] = "Item #{item.name} errors" + item.errors.full_messages.to_sentence
      render :edit
    end
  end

  def complete
    if @item.complete == 'yes'
      @item.update(complete: 'no')
    else
      @item.update(complete: 'yes')
    end
    redirect_to :back
  end

  def destroy
    @item.destroy
    name = @item.name
    flash[:success] = "Item #{name} deleted"
    redirect_to :back
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :complete)
  end

  def set_checklist
    @checklist = Checklist.find(params[:checklist_id])
  end
end
