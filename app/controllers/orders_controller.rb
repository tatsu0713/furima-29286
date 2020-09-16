class OrdersController < ApplicationController
  
  before_action :move_index

  def index
    @item = Item.find(params[:item_id])
    @delivery_address = OrderAddress.new
  end

  def create
    @delivery_address = OrderAddress.new(address_params)
    @item = Item.find(params[:item_id])
    if @delivery_address.valid?
      pay_item
      @delivery_address.save
      redirect_to root_path
    else
      render "index"
    end
  end

  # def  done
  #   @product_order= Product.find(params[:id])
  #   @product_order.update( order_id: current_user.id)
  # end

  private

  def move_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def address_params
    params.require(:order_address).permit(:post_number, :delivery_area_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: address_params[:token],
      currency:'jpy'
    )
  end

end
