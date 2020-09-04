class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name,:explanation,:category_id,:item_status_id,:item_burden_id,:delivery_area_id,:shipping_day,:selling_price)
  end
end
