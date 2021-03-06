class ItemsController < ApplicationController
  def index
    @items = current_user.items
    @item = Item.new
  end

  def show
    @item = current_user.items.find(params[:id])
  end

  def new
    @item = params[:item].present? ? Item.new(secure_params) : Item.new
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def create
    @item = current_user.items.build(secure_params)
    if @item.save
      redirect_to dashboard_path
    else
      flash[:warning] = @item.errors.full_messages
      render :new
    end
  end

  def update
    item = current_user.items.find(params[:id])
    item.update!(secure_params)
    redirect_to dashboard_path
  end

  def destroy
    current_user.items.destroy(params[:id])
    redirect_to dashboard_path
  end

  private

  def secure_params
    params.require(:item).permit(
      :name,
      :description,
      :serial_number,
      :purchase_price,
      :purchased_at,
    )
  end
end
