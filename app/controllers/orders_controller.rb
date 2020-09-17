class OrdersController < ApplicationController
  before_action :move_index
  before_action :order_move_index
  before_action :set_item, only: [:index, :create]

  def index
    @delivery_address = OrderAddress.new
  end

  def create
    @delivery_address = OrderAddress.new(address_params)
    if @delivery_address.valid? && @delivery_address.save
      pay_item
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

  def address_params
    params.require(:order_address).permit(:post_number, :delivery_area_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def order_move_index
    redirect_to root_path if @item.orders.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
