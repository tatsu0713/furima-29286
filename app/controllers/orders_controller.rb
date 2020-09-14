class OrdersController < ApplicationController
  
  # before_action :move_index

  def index
    # @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
  end

  def new
  end

  # private

  # def move_index
  #   if user_signed_in? && current_user.id == @item.user_id
  #     redirect_to root_path
  #   end
  # end
  
end