class OrdersController < ApplicationController
  
  before_action :move_index

  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
    @delivery_address = OrderAddress.new
  end

  def create
    @delivery_address = OrderAddress.new(address_params)
    if @delivery_address.valid?
      pay_item
      @delivery_address.save
      return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def move_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def address_params
    params.require(:order_address).permit(:post_number, :delivery_area_id, :municipality, :address, :building, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Pay.api_key = "sk_test_a99e9775895ee7f718c10ded"
    Pay::Charge.create(
      card: address_params[:token],
      currency:'jpy'
    )
  end

end
