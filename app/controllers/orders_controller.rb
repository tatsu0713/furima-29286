class OrdersController < ApplicationController
  
  before_action :move_index

  def index
    # @order = Order.new
    @item = Item.find(params[:item_id])
    @delivery_address = OrderAddress.new
  end

  def create
    @delivery_address = OrderAddress.new(address_params)
    if @delivery_address.valid?
      @delivery_address.save
      return redirect_to root_path
    else
      render "index"
    end
  end

  def new
  end

  private

  def move_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  def address_params
    params.require(:order_address).permit(:post_number, :delivery_area_id, :municipality, :address, :building, :phone_number)
  end
end
